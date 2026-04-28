--// This file was created by XHider v1.2 [https://discord.gg/hATuHQaQRb]

local Y = { "?zZ2@[MMd#kw/B" };
local k = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!#$%&()*+,./:;<=>?@[]^_`{|}~\"\' ";
local function M(Y)
	local M = {};
	for Y = 1, #k, 1 do
		M[k:sub(Y, Y)] = Y - 1;
	end;
	local N = {};
	local T = 0;
	local e = 0;
	local L = -1;
	local b = math.pow;
	for k = 1, #Y, 1 do
		local i = Y:sub(k, k);
		local H = M[i];
		if H ~= nil then
			if L == -1 then
				L = H;
			else
				L = L + H * 91;
				local Y = L % 8192;
				local k = Y > 88 and 13 or 14;
				T = T + L * b(2, e);
				e = e + k;
				while e >= 8 do
					table.insert(N, string.char(T % 256));
					T = math.floor(T / 256);
					e = e - 8;
				end;
				L = -1;
			end;
		end;
	end;
	if L ~= -1 then
		T = T + L * b(2, e);
		e = e + 13;
		while e >= 8 do
			table.insert(N, string.char(T % 256));
			T = math.floor(T / 256);
			e = e - 8;
		end;
	end;
	return table.concat(N);
end;
(loadstring(M(table.concat(Y))))();