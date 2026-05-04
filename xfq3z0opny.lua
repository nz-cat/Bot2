--[[
    ╔══════════════════════════════════════════════════════════════╗
    ║             NatAov – Main Logic (Standalone)                 ║
    ║             Tác giả : Atuansitink                            ║
    ║             Game    : Blox Fruits                            ║
    ╚══════════════════════════════════════════════════════════════╝

    Script chạy HOÀN TOÀN ĐỘC LẬP – không cần Hub chính.
    Chỉ cần chỉnh phần CONFIG bên dưới rồi paste vào executor.

    Tính năng:
      • Auto equip + attack bằng fruit (T-Rex, Dragon, Kitsune...)
      • Insta-teleport tới mục tiêu với dự đoán vị trí (motion prediction)
      • Tự động server hop khi không tìm được mục tiêu
      • Anti-seat (không bị đẩy vào ghế)
      • Buso Ken tự động mỗi 5 giây
      • Dragon Rage auto khi rage > 50
      • Health escape khi máu thấp (tele lên cao, chờ hồi rồi tiếp tục)
      • Phát hiện kick, tự rejoin server cũ
      • Bỏ qua người trong safe zone / PvP bị disabled / level thấp / cùng team
      • Stats in ra console (kills, bounty, hops)
      • Phím RightControl: stop/start script
--]]

-- ══════════════════════════════════════════════════════════════════
-- ██  CẤU HÌNH – chỉnh tại đây trước khi chạy  ██
-- ══════════════════════════════════════════════════════════════════

local CONFIG = {
    -- Faction của bạn: "Pirates" hoặc "Marines"
    Faction = "Pirates",

    -- Vùng để server hop tới (tên hiển thị trong ServerBrowser của Blox Fruits)
    -- Ví dụ: "Singapore", "America", "Europe", "Asia"
    Region = "Singapore",

    -- Fruit đang dùng (phải khớp với bảng FruitConfigs bên dưới)
    -- Hỗ trợ: "T-Rex", "Dragon", "Kitsune", "Empyrean", "Pain", "Control"
    Fruit = "T-Rex",

    -- Level tối thiểu của mục tiêu để tấn công
    MinTargetLevel = 2300,

    -- Ngưỡng máu để kích hoạt health escape (tele lên cao chờ hồi)
    LowHealthThreshold = 5000,

    -- Ngưỡng máu an toàn để quay lại chiến đấu sau khi escape
    SafeHealthThreshold = 9000,

    -- Độ cao tele lên khi escape (đủ cao để tránh mọi hitbox)
    EscapeHeight = 273861,

    -- Thời gian dự đoán vị trí mục tiêu (giây) – càng cao càng "lead" trước
    PredictionTime = 0.25,

    -- Số mẫu lấy để tính velocity dự đoán
    PredictionSamples = 3,

    -- Offset Y khi teleport tới mục tiêu (dương = đứng trên đầu mục tiêu)
    YOffset = 1,
}

-- ══════════════════════════════════════════════════════════════════
-- ██  KHỞI TẠO  ██
-- ══════════════════════════════════════════════════════════════════

-- Chờ game load hoàn toàn
repeat task.wait() until game:IsLoaded()

local Players            = game:GetService("Players")
local RunService         = game:GetService("RunService")
local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local TweenService       = game:GetService("TweenService")
local TeleportService    = game:GetService("TeleportService")
local UserInputService   = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CoreGui            = game:GetService("CoreGui")

local lp = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() and Players.LocalPlayer

-- Biến môi trường global để đồng bộ giữa các thread
local _env = getgenv()
_env.NatAovShuttingDown = false
_env.IsServerHopping    = false

local CurrentJobId  = game.JobId
local CurrentPlaceId = game.PlaceId

print("[NatAov] Script khởi động – Game loaded")
print(string.format("[NatAov] Config: Fruit=%s | Region=%s | Faction=%s | MinLv=%d",
    CONFIG.Fruit, CONFIG.Region, CONFIG.Faction, CONFIG.MinTargetLevel))

-- ══════════════════════════════════════════════════════════════════
-- ██  STATS ĐƠN GIẢN (in ra console, không cần file)  ██
-- ══════════════════════════════════════════════════════════════════

local Stats = {
    SessionStartTime  = tick(),
    TotalKills        = 0,
    SessionBounty     = 0,
    ServerHops        = 0,
    InitialBounty     = 0,
}

-- In tóm tắt stats ra console mỗi 60 giây
task.spawn(function()
    while not _env.NatAovShuttingDown do
        task.wait(60)
        local elapsed = tick() - Stats.SessionStartTime
        local mins = math.floor(elapsed / 60)
        local secs = math.floor(elapsed % 60)
        print(string.format(
            "[NatAov] [Stats] Kills: %d | Bounty: %d | Hops: %d | Time: %dm%ds",
            Stats.TotalKills, Stats.SessionBounty, Stats.ServerHops, mins, secs
        ))
    end
end)

-- ══════════════════════════════════════════════════════════════════
-- ██  PHÁT HIỆN KICK – tự rejoin server cũ  ██
-- ══════════════════════════════════════════════════════════════════

pcall(function()
    CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
        if child.Name == "ErrorPrompt"
            and child:FindFirstChild("MessageArea")
            and child.MessageArea:FindFirstChild("ErrorFrame")
        then
            -- Chỉ rejoin nếu không phải đang server hop chủ động
            if not _env.IsServerHopping then
                print("[NatAov] [!] Phát hiện kick – đang rejoin...")
                TeleportService:TeleportToPlaceInstance(CurrentPlaceId, CurrentJobId, lp)
            end
        end
    end)
end)

-- ══════════════════════════════════════════════════════════════════
-- ██  VÔ HIỆU HOÁ CAMERA SHAKE (giảm lag)  ██
-- ══════════════════════════════════════════════════════════════════

task.spawn(function()
    pcall(function()
        local util       = ReplicatedStorage:WaitForChild("Util", 15)
        local camShaker  = util and util:WaitForChild("CameraShaker", 15)
        local main       = camShaker and camShaker:WaitForChild("Main", 15)
        if not main then return end
        local CameraShaker = require(main)
        local noop = function() end
        CameraShaker.StartShake          = noop
        CameraShaker.ShakeOnce           = noop
        CameraShaker.ShakeSustain        = noop
        CameraShaker.CameraShakeInstance = noop
        CameraShaker.Shake               = noop
        CameraShaker.Start               = noop
        print("[NatAov] Camera shake đã bị vô hiệu hoá")
    end)
end)

-- ══════════════════════════════════════════════════════════════════
-- ██  CÁC HÀM KIỂM TRA TRẠNG THÁI  ██
-- ══════════════════════════════════════════════════════════════════

-- Lấy level người chơi từ Data.Level
local function GetPlayerLevel(player)
    local data = player:FindFirstChild("Data")
    if data then
        local lvl = data:FindFirstChild("Level")
        if lvl then return tonumber(lvl.Value) or 0 end
    end
    return 0
end

-- Kiểm tra người chơi có đang trong safe zone không
local function IsPlayerInSafeZone(player)
    if not player.Character then return false end
    local hrp = player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    -- Nếu attribute InCombat = "0" hoặc "1" → không trong safe zone
    local inCombat = player.Character:GetAttribute("InCombat")
    if inCombat == "0" or inCombat == "1" then return false end

    local safeZonesFolder = workspace._WorldOrigin:FindFirstChild("SafeZones")
    if not safeZonesFolder then return false end

    for _, zone in pairs(safeZonesFolder:GetChildren()) do
        local mesh = zone:FindFirstChild("Mesh")
        if mesh and mesh:IsA("SpecialMesh") then
            local radius = (zone.Size.X * mesh.Scale.X) / 2
            if (zone.Position - hrp.Position).Magnitude <= radius then
                return true
            end
        end
    end
    return false
end

-- Kiểm tra mục tiêu có hợp lệ để attack không
local function IsPlayerValid(player)
    if player == lp then return false end

    -- Không attack người cùng team (chỉ áp dụng cho Marines)
    if lp.Team and lp.Team.Name == "Marines" and player.Team and player.Team == lp.Team then
        return false
    end

    if not player.Character then return false end

    local humanoid = player.Character:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false end

    -- Bỏ qua người đã tắt PvP
    if player:GetAttribute("PvpDisabled") == true then return false end

    -- Bỏ qua người đang Island Raiding
    if player:GetAttribute("IslandRaiding") == true then return false end

    -- Kiểm tra level tối thiểu
    if GetPlayerLevel(player) < CONFIG.MinTargetLevel then return false end

    -- Bỏ qua người trong safe zone
    if IsPlayerInSafeZone(player) then return false end

    return true
end

-- Lấy bounty hiện tại của LocalPlayer
local function GetCurrentBounty()
    local leaderstats = lp:FindFirstChild("leaderstats")
    if leaderstats then
        local bounty = leaderstats:FindFirstChild("Bounty/Honor")
        if bounty then return tonumber(bounty.Value) or 0 end
    end
    return 0
end

-- Kiểm tra nhân vật đang trong combat (check InCombat UI)
local function IsInCombat()
    local playerGui = lp:FindFirstChild("PlayerGui")
    if not playerGui then return false end
    local mg = playerGui:FindFirstChild("Main")
    if not mg then return false end
    local bottomHUD = mg:FindFirstChild("BottomHUDList")
    if not bottomHUD then return false end
    local inCombatUI = bottomHUD:FindFirstChild("InCombat")
    if not inCombatUI or not inCombatUI.Visible then return false end
    if inCombatUI:IsA("TextLabel") and string.find(inCombatUI.Text, "risk") then
        return true
    end
    return false
end

-- Kiểm tra máu nhân vật có thấp không
local function IsHealthLow()
    local char = lp.Character
    if not char then return false end
    local humanoid = char:FindFirstChild("Humanoid")
    if not humanoid then return false end
    return humanoid.Health <= CONFIG.LowHealthThreshold
end

-- Chờ thoát khỏi combat (timeout giây)
local function WaitForCombatEnd(timeout)
    timeout = timeout or 30
    local startTime = tick()
    while IsInCombat() and tick() - startTime < timeout do
        task.wait(1)
    end
    return not IsInCombat()
end

-- Lấy toàn bộ người chơi hợp lệ trong server
local function GetAllValidPlayers()
    local result = {}
    for _, p in pairs(Players:GetPlayers()) do
        if IsPlayerValid(p) then
            table.insert(result, p)
        end
    end
    return result
end

-- ══════════════════════════════════════════════════════════════════
-- ██  CÁC HÀM COMBAT HELPER  ██
-- ══════════════════════════════════════════════════════════════════

-- Bật PvP cho nhân vật
local function PvpEnable()
    pcall(function()
        local remotes = ReplicatedStorage:WaitForChild("Remotes")
        remotes:WaitForChild("CommF_"):InvokeServer("EnablePvp")
    end)
end

-- Kích hoạt Buso Ken (Observation + Armament Haki)
local function BusoKen()
    pcall(function()
        local remotes = ReplicatedStorage:WaitForChild("Remotes")
        remotes:WaitForChild("CommE"):FireServer("Ken", true)
        local char = lp.Character
        if char and not char:FindFirstChild("HasBuso") then
            remotes:WaitForChild("CommF_"):InvokeServer("Buso")
        end
    end)
end

-- Kiểm tra và kích hoạt Dragon Rage khi rage > 50
local function CheckDragonRage()
    if CONFIG.Fruit ~= "Dragon" then return end
    pcall(function()
        local char = lp.Character
        if not char then return end
        if char:FindFirstChild("DragonHybrid") then return end -- đã ở hybrid rồi
        local rage = char:FindFirstChild("Rage")
        if not rage or not rage:IsA("NumberValue") then return end
        if rage.Value > 50 and rage.Value < 60 then
            VirtualInputManager:SendKeyEvent(true,  Enum.KeyCode.V, false, game)
            task.wait(0.05)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.V, false, game)
        end
    end)
end

-- Kích hoạt T-Rex Awakening (V4)
local function ActivateTRexV4()
    pcall(function()
        local backpack = lp:WaitForChild("Backpack")
        local awakening = backpack:FindFirstChild("Awakening")
        if awakening then
            awakening:WaitForChild("RemoteFunction"):InvokeServer(true)
        end
        VirtualInputManager:SendKeyEvent(true,  Enum.KeyCode.T, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.T, false, game)
    end)
end

-- Đặt folder AntiMover trong character để chống bị đẩy
local function SetupAntiMover()
    pcall(function()
        local char = lp.Character
        if char and not char:FindFirstChild("AntiMover") then
            local folder = Instance.new("Folder")
            folder.Name = "AntiMover"
            folder.Parent = char
        end
    end)
end

-- ══════════════════════════════════════════════════════════════════
-- ██  FRUIT CONFIGS  ██
-- ══════════════════════════════════════════════════════════════════

--[[
    Bảng cấu hình cho từng fruit:
      ToolName   : Tên tool trong Backpack/Character
      RemoteName : Tên RemoteEvent bên trong tool để fire attack
      Args(dir)  : Hàm trả về danh sách arguments gửi lên server
    
    Để thêm fruit mới: copy một entry, đổi ToolName và Args nếu cần.
--]]
local FruitConfigs = {
    ["T-Rex"] = {
        ToolName   = "T-Rex-T-Rex",
        RemoteName = "LeftClickRemote",
        Args = function(dir) return { Vector3.new(dir.X, dir.Y, dir.Z), 3 } end,
    },
    Dragon = {
        ToolName   = "Dragon-Dragon",
        RemoteName = "LeftClickRemote",
        Args = function(dir) return { Vector3.new(dir.X, dir.Y, dir.Z), 1 } end,
    },
    Kitsune = {
        ToolName   = "Kitsune-Kitsune",
        RemoteName = "LeftClickRemote",
        Args = function(dir) return { Vector3.new(dir.X, dir.Y, dir.Z), 1 } end,
    },
    Empyrean = {
        ToolName   = "Empyrean (Kitsune)-Empyrean (Kitsune)",
        RemoteName = "LeftClickRemote",
        Args = function(dir) return { Vector3.new(dir.X, dir.Y, dir.Z), 1 } end,
    },
    Pain = {
        ToolName   = "Pain-Pain",
        RemoteName = "LeftClickRemote",
        Args = function(dir) return { Vector3.new(dir.X, dir.Y, dir.Z), 1 } end,
    },
    Control = {
        ToolName   = "Control-Control",
        RemoteName = "LeftClickRemote",
        Args = function(dir) return { Vector3.new(dir.X, dir.Y, dir.Z), 1 } end,
    },
}

-- Equip fruit vào tay nhân vật
local function EquipFruit()
    local cfg = FruitConfigs[CONFIG.Fruit]
    if not cfg then return false end
    local char    = lp.Character
    local backpack = lp.Backpack
    if not char then return false end
    if char:FindFirstChild(cfg.ToolName) then return true end -- đã equip rồi
    local tool = backpack:FindFirstChild(cfg.ToolName)
    if tool then
        char.Humanoid:EquipTool(tool)
        task.wait(0.1)
        return true
    end
    return false
end

-- Fire remote attack của fruit về phía mục tiêu
local function FruitAttackPlayer(targetHRP)
    local cfg = FruitConfigs[CONFIG.Fruit]
    if not cfg then return end
    local myChar = lp.Character
    if not myChar then return end
    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end

    -- Tính hướng tới mục tiêu (hoặc dùng hướng mặc định)
    local direction
    if targetHRP then
        direction = (targetHRP.Position - myHRP.Position).Unit
    else
        direction = Vector3.new(0, -0.9, 0.03) -- hướng mặc định khi không có target
    end

    local tool = myChar:FindFirstChild(cfg.ToolName)
    if not tool then
        EquipFruit()
        task.wait(0.1)
        tool = myChar:FindFirstChild(cfg.ToolName)
        if not tool then return end
    end

    local remote = tool:FindFirstChild(cfg.RemoteName)
    if not remote then return end

    pcall(function()
        remote:FireServer(table.unpack(cfg.Args(direction)))
    end)
end

-- ══════════════════════════════════════════════════════════════════
-- ██  SERVER HOP  ██
-- ══════════════════════════════════════════════════════════════════

local function ServerHop()
    Stats.ServerHops = Stats.ServerHops + 1
    print(string.format("[NatAov] [Hop #%d] Đang tìm server %s...", Stats.ServerHops, CONFIG.Region))

    _env.IsServerHopping = true

    -- Tele lên cao trong lúc chờ thoát combat
    local hopActive = true
    task.spawn(function()
        while hopActive and not _env.NatAovShuttingDown do
            pcall(function()
                local char = lp.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = CFrame.new(hrp.Position.X, hrp.Position.Y + CONFIG.EscapeHeight, hrp.Position.Z)
                    end
                end
            end)
            task.wait(0.05)
        end
    end)

    -- Chờ thoát combat trước khi hop (tối đa 30 giây)
    WaitForCombatEnd(30)
    task.wait(1)
    hopActive = false

    -- Mở ServerBrowser và lọc region
    local PlayerGui = lp.PlayerGui
    if not PlayerGui:FindFirstChild("ServerBrowser") then
        warn("[NatAov] [Hop] Không tìm thấy ServerBrowser GUI – bỏ qua hop")
        _env.IsServerHopping = false
        return
    end

    PlayerGui.ServerBrowser.Enabled = true
    task.wait(0.1)

    local frame = PlayerGui.ServerBrowser.Frame
    local textBox = frame:FindFirstChild("Filters")
        and frame.Filters:FindFirstChild("SearchRegion")
        and frame.Filters.SearchRegion:FindFirstChild("TextBox")

    if not textBox then
        warn("[NatAov] [Hop] Không tìm thấy ô tìm kiếm region – bỏ qua hop")
        _env.IsServerHopping = false
        return
    end

    textBox.Text = CONFIG.Region
    task.wait(3) -- chờ server list load

    -- Cuộn ngẫu nhiên để không hop cùng server mỗi lần
    local scrollingFrame = frame.ScrollingFrame
    local fakeScroll     = frame.FakeScroll
    local inside         = fakeScroll.Inside
    scrollingFrame.CanvasPosition = Vector2.new(0, math.random(100, 4000))
    task.wait(0.1)

    local currentJobId = game.JobId
    -- Tìm và join server khác
    while true do
        task.wait(0.5)
        for _, template in ipairs(inside:GetChildren()) do
            if template.Name == "Template" then
                local joinButton = template:FindFirstChild("Join")
                if joinButton then
                    local job = tostring(joinButton:GetAttribute("Job") or "")
                    if job:find("-", 1, true) and job ~= currentJobId then
                        print("[NatAov] [Hop] Đang teleport tới server: " .. job)
                        local ok = pcall(function()
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, job)
                        end)
                        if not ok then
                            pcall(function()
                                TeleportService:TeleportToServer(job)
                            end)
                        end
                        task.wait(5) -- chờ teleport xử lý
                    end
                end
            end
        end
    end
end

-- ══════════════════════════════════════════════════════════════════
-- ██  ANTI-SEAT  ██
-- ══════════════════════════════════════════════════════════════════

local AntiSeatConn1, AntiSeatConn2

local function StartAntiSeat()
    -- Huỷ connection cũ nếu có
    if AntiSeatConn1 then AntiSeatConn1:Disconnect() end
    if AntiSeatConn2 then AntiSeatConn2:Disconnect() end

    local char = lp.Character
    if not char then return end
    local humanoid = char:WaitForChild("Humanoid", 10)
    if not humanoid then return end

    -- Liên tục force jump ra khỏi trạng thái ngồi
    AntiSeatConn1 = RunService.Heartbeat:Connect(function()
        if humanoid.Sit then
            humanoid.Sit = false
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    AntiSeatConn2 = humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Seated then
            humanoid.Sit = false
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    print("[NatAov] Anti-seat đã bật")
end

-- ══════════════════════════════════════════════════════════════════
-- ██  HEALTH ESCAPE  ██
-- ══════════════════════════════════════════════════════════════════

-- Biến toàn cục để StartInstaTeleport có thể dừng khi cần
local InstaTpConnection = nil
local SelectedPlayer    = nil
local PlayerPositionHistory = {}

local StartInstaTeleport  -- khai báo trước, định nghĩa sau

local function PerformHealthEscape()
    -- Dừng insta-tp trong lúc escape
    if InstaTpConnection then
        InstaTpConnection:Disconnect()
        InstaTpConnection = nil
    end

    print("[NatAov] [!] Máu thấp – đang escape...")
    local escapeActive = true

    -- Tele lên cao liên tục để thoát khỏi tầm đánh
    task.spawn(function()
        while escapeActive and not _env.NatAovShuttingDown do
            pcall(function()
                local char = lp.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = CFrame.new(hrp.Position.X, hrp.Position.Y + CONFIG.EscapeHeight, hrp.Position.Z)
                    end
                end
            end)
            task.wait(0.05)
        end
    end)

    -- Chờ máu hồi đủ
    while true do
        task.wait(0.5)
        local char = lp.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health >= CONFIG.SafeHealthThreshold then
                break
            end
        end
    end

    escapeActive = false
    task.wait(0.2)
    print("[NatAov] Máu đã hồi – tiếp tục chiến đấu")
    StartInstaTeleport() -- quay lại teleport tới mục tiêu
end

-- ══════════════════════════════════════════════════════════════════
-- ██  INSTA-TELEPORT (MOTION PREDICTION)  ██
-- ══════════════════════════════════════════════════════════════════

--[[
    Thuật toán:
      1. Mỗi Stepped frame: lưu vị trí và timestamp của mục tiêu
      2. Tính velocity trung bình từ N mẫu gần nhất (PredictionSamples)
      3. Dự đoán vị trí sau PredictionTime giây
      4. Teleport nhân vật tới vị trí dự đoán + offset Y

    Kết quả: luôn "đứng trước" mục tiêu, ít bị trượt khi target đang chạy.
--]]
StartInstaTeleport = function()
    if InstaTpConnection then InstaTpConnection:Disconnect() end

    InstaTpConnection = RunService.Stepped:Connect(function()
        if not SelectedPlayer then return end

        pcall(function()
            local char   = lp.Character
            local target = Players:FindFirstChild(SelectedPlayer)
            if not (char and target and target.Character) then
                -- Target offline hoặc mất character → dọn history
                PlayerPositionHistory[SelectedPlayer] = nil
                return
            end

            local myHRP     = char:FindFirstChild("HumanoidRootPart")
            local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
            if not (myHRP and targetHRP) then return end

            -- Cập nhật history vị trí
            if not PlayerPositionHistory[SelectedPlayer] then
                PlayerPositionHistory[SelectedPlayer] = { positions = {}, timestamps = {} }
            end
            local hist = PlayerPositionHistory[SelectedPlayer]
            table.insert(hist.positions,  targetHRP.Position)
            table.insert(hist.timestamps, tick())

            -- Giữ tối đa PredictionSamples mẫu
            while #hist.positions > CONFIG.PredictionSamples do
                table.remove(hist.positions,  1)
                table.remove(hist.timestamps, 1)
            end

            -- Tính vị trí dự đoán
            local predictedPos = targetHRP.Position
            if #hist.positions >= 2 then
                local totalDisplacement = Vector3.new(0, 0, 0)
                local totalTime = 0
                for i = 2, #hist.positions do
                    local dPos  = hist.positions[i]  - hist.positions[i-1]
                    local dTime = hist.timestamps[i] - hist.timestamps[i-1]
                    if dTime > 0 then
                        totalDisplacement = totalDisplacement + dPos
                        totalTime = totalTime + dTime
                    end
                end
                if totalTime > 0 then
                    local velocity = totalDisplacement / totalTime
                    predictedPos = targetHRP.Position + velocity * CONFIG.PredictionTime
                end
            end

            -- Teleport tới vị trí dự đoán
            myHRP.CFrame = CFrame.new(predictedPos) * CFrame.new(0, CONFIG.YOffset, 0)
        end)
    end)
end

-- ══════════════════════════════════════════════════════════════════
-- ██  XỬ LÝ KHI NHÂN VẬT CHẾT  ██
-- ══════════════════════════════════════════════════════════════════

local function OnCharacterDeath()
    print("[NatAov] Nhân vật chết – đang chờ respawn...")

    -- Dọn dẹp connections liên quan tới character cũ
    if InstaTpConnection then InstaTpConnection:Disconnect(); InstaTpConnection = nil end
    if AntiSeatConn1     then AntiSeatConn1:Disconnect(); AntiSeatConn1 = nil end
    if AntiSeatConn2     then AntiSeatConn2:Disconnect(); AntiSeatConn2 = nil end

    SelectedPlayer = nil
    PlayerPositionHistory = {}

    -- Chờ character mới
    local newChar = lp.Character or lp.CharacterAdded:Wait()
    local newHRP  = newChar:WaitForChild("HumanoidRootPart", 10)
    local newHum  = newChar:WaitForChild("Humanoid",         10)

    if newHRP and newHum then
        task.wait(1) -- chờ character ổn định
        StartAntiSeat()
        StartInstaTeleport()
        -- Gắn lại listener chết cho character mới
        newHum.Died:Connect(OnCharacterDeath)
        print("[NatAov] Đã respawn – tiếp tục chiến đấu")
    end
end

-- ══════════════════════════════════════════════════════════════════
-- ██  THEO DÕI BOUNTY (đếm kill)  ██
-- ══════════════════════════════════════════════════════════════════

local CurrentTargetPlayer = nil

pcall(function()
    local leaderstats  = lp:WaitForChild("leaderstats", 5)
    if not leaderstats then return end
    local bountyValue  = leaderstats:FindFirstChild("Bounty/Honor")
    if not bountyValue then return end

    Stats.InitialBounty = tonumber(bountyValue.Value) or 0
    local LastKnownBounty = Stats.InitialBounty

    bountyValue.Changed:Connect(function(newValue)
        local newBounty  = tonumber(newValue) or 0
        local bountyGain = newBounty - LastKnownBounty
        if bountyGain > 0 then
            Stats.TotalKills     = Stats.TotalKills + 1
            Stats.SessionBounty  = Stats.SessionBounty + bountyGain
            local targetName = CurrentTargetPlayer and CurrentTargetPlayer.Name or "Unknown"
            print(string.format(
                "[NatAov] [Kill #%d] +%d bounty từ %s | Tổng bounty phiên: %d",
                Stats.TotalKills, bountyGain, targetName, Stats.SessionBounty
            ))
        end
        LastKnownBounty = newBounty
    end)
end)

-- ══════════════════════════════════════════════════════════════════
-- ██  KHỞI ĐỘNG HỆ THỐNG  ██
-- ══════════════════════════════════════════════════════════════════

-- Chọn team khi character chưa spawn
if not (lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")) then
    print("[NatAov] Đang chọn team: " .. CONFIG.Faction)
    local playerGui = lp:WaitForChild("PlayerGui")
    local mainGui   = playerGui:WaitForChild("Main (minimal)")
    local teamName  = (CONFIG.Faction == "Marines") and "Marines" or "Pirates"
    local btn

    repeat
        task.wait()
        local container = mainGui:FindFirstChild("ChooseTeam")
            and mainGui.ChooseTeam:FindFirstChild("Container")
        if container then
            local teamFrame = container:FindFirstChild(teamName)
            if teamFrame then
                btn = teamFrame:FindFirstChild("Frame")
                    and teamFrame.Frame:FindFirstChild("TextButton")
            end
        end
    until btn

    -- Fire button chọn team
    local attempt = 0
    repeat
        task.wait(0.25)
        attempt = attempt + 1
        pcall(function()
            if firesignal then
                firesignal(btn.Activated)
                firesignal(btn.MouseButton1Click)
            end
            if getconnections then
                for _, conn in pairs(getconnections(btn.Activated)) do conn:Fire() end
                for _, conn in pairs(getconnections(btn.MouseButton1Click)) do conn:Fire() end
            end
        end)
        if attempt > 10 then
            print("[NatAov] [!] Không tự chọn được team – vui lòng click thủ công!")
        end
    until (lp.Character and lp.Character:FindFirstChild("Humanoid"))
        or _env.NatAovShuttingDown
else
    print("[NatAov] Character đã tồn tại – bỏ qua chọn team")
end

-- Chờ HumanoidRootPart
repeat task.wait() until (lp.Character and lp.Character:FindFirstChild("HumanoidRootPart"))
    or _env.NatAovShuttingDown

print("[NatAov] Character sẵn sàng – khởi động hệ thống chiến đấu")

-- Gắn listener chết cho character hiện tại
if lp.Character then
    local humanoid = lp.Character:FindFirstChild("Humanoid")
    if humanoid then humanoid.Died:Connect(OnCharacterDeath) end
end

-- Gắn listener cho lần character spawn tiếp theo
lp.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid", 10)
    if humanoid then humanoid.Died:Connect(OnCharacterDeath) end
end)

-- Bắt đầu các hệ thống nền
StartAntiSeat()
StartInstaTeleport()

-- Lưu bounty ban đầu
if Stats.InitialBounty == 0 then
    Stats.InitialBounty = GetCurrentBounty()
end

-- ══════════════════════════════════════════════════════════════════
-- ██  VÒNG LẶP UTILITY (BusoKen / DragonRage / PvP / AntiMover)  ██
-- ══════════════════════════════════════════════════════════════════

-- Buso Ken mỗi 5 giây
task.spawn(function()
    while not _env.NatAovShuttingDown do
        pcall(BusoKen)
        task.wait(5)
    end
end)

-- Dragon Rage check mỗi giây
task.spawn(function()
    while not _env.NatAovShuttingDown do
        CheckDragonRage()
        task.wait(1)
    end
end)

-- PvP enable + AntiMover + V4 mỗi giây
task.spawn(function()
    while not _env.NatAovShuttingDown do
        pcall(function()
            PvpEnable()
            SetupAntiMover()
            if CONFIG.Fruit == "T-Rex" then
                ActivateTRexV4()
            end
        end)
        task.wait(1)
    end
end)

-- ══════════════════════════════════════════════════════════════════
-- ██  VÒNG LẶP ATTACK CHÍNH (Fruit attack liên tục)  ██
-- ══════════════════════════════════════════════════════════════════

--[[
    Chạy nhanh nhất có thể (task.wait(0.01) ≈ 100 lần/giây).
    Mỗi iteration: equip fruit → fire attack remote về phía mục tiêu.
    pcall bảo vệ khỏi lỗi làm crash loop.
--]]
task.spawn(function()
    print("[NatAov] Bắt đầu vòng lặp attack")
    while not _env.NatAovShuttingDown do
        task.wait(0.01)
        pcall(function()
            EquipFruit()
            -- Lấy HRP của mục tiêu để tính hướng
            local targetHRP = nil
            if SelectedPlayer then
                local target = Players:FindFirstChild(SelectedPlayer)
                if target and target.Character then
                    targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
                end
            end
            FruitAttackPlayer(targetHRP)
        end)
    end
    print("[NatAov] Vòng lặp attack đã dừng")
end)

-- ══════════════════════════════════════════════════════════════════
-- ██  VÒNG LẶP CHỌN MỤC TIÊU + SERVER HOP  ██
-- ══════════════════════════════════════════════════════════════════

--[[
    Mỗi 0.4 giây:
      1. Nếu máu thấp → health escape (chờ hồi)
      2. Lấy danh sách player hợp lệ
      3. Nếu có → chọn lần lượt (round-robin), cập nhật SelectedPlayer
      4. Nếu không có → server hop
--]]
task.spawn(function()
    task.wait(3) -- chờ ổn định trước khi bắt đầu chọn target
    print("[NatAov] Bắt đầu vòng lặp chọn mục tiêu")
    local currentIndex = 1

    while not _env.NatAovShuttingDown do
        task.wait(0.4)

        -- Health escape ưu tiên cao nhất
        if IsHealthLow() then
            PerformHealthEscape()
            task.wait(1)
        end

        local validPlayers = GetAllValidPlayers()

        if #validPlayers > 0 then
            -- Wrap index
            if currentIndex > #validPlayers then currentIndex = 1 end
            local targetPlayer = validPlayers[currentIndex]

            if targetPlayer and targetPlayer.Parent and targetPlayer.Character then
                SelectedPlayer      = targetPlayer.Name
                CurrentTargetPlayer = targetPlayer
            end

            currentIndex = currentIndex + 1
        else
            -- Không có mục tiêu → server hop
            currentIndex = 1
            ServerHop()
        end
    end

    print("[NatAov] Vòng lặp chọn mục tiêu đã dừng")
end)

-- ══════════════════════════════════════════════════════════════════
-- ██  PHÍM TẮT  ██
-- ══════════════════════════════════════════════════════════════════

--[[
    RightControl: Toggle script (dừng / tiếp tục)
    Khi dừng: huỷ insta-tp và anti-seat, đặt NatAovShuttingDown = true.
    Khi tiếp tục: reset flag và restart các hệ thống.
--]]
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        if _env.NatAovShuttingDown then
            -- Khởi động lại
            _env.NatAovShuttingDown = false
            print("[NatAov] Script đã được BẬT lại")
            StartAntiSeat()
            StartInstaTeleport()
        else
            -- Dừng
            _env.NatAovShuttingDown = true
            if InstaTpConnection then InstaTpConnection:Disconnect(); InstaTpConnection = nil end
            if AntiSeatConn1      then AntiSeatConn1:Disconnect();    AntiSeatConn1 = nil end
            if AntiSeatConn2      then AntiSeatConn2:Disconnect();    AntiSeatConn2 = nil end
            SelectedPlayer = nil
            print("[NatAov] Script đã TẮT – nhấn RightControl để bật lại")
        end
    end
end)

-- ══════════════════════════════════════════════════════════════════
print("[NatAov] ✓ Script sẵn sàng! Nhấn RightControl để toggle.")
print(string.format("[NatAov] Fruit: %s | Region: %s | MinLv: %d",
    CONFIG.Fruit, CONFIG.Region, CONFIG.MinTargetLevel))
-- ══════════════════════════════════════════════════════════════════
