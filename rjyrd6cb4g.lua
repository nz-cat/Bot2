--// This file was created by XHider v1.2 [https://discord.gg/hATuHQaQRb]

do
	local X = string.char;
	local y = {
			__add = function(X, y)
				return setmetatable({ _dk = (type(X) == "table" and X._dk or X) + (type(y) == "table" and y._dk or y) }, getmetatable(type(X) == "table" and X or y));
			end,
			__sub = function(X, y)
				return setmetatable({ _dk = (type(X) == "table" and X._dk or X) - (type(y) == "table" and y._dk or y) }, getmetatable(type(X) == "table" and X or y));
			end,
			__mul = function(X, y)
				return setmetatable({ _dk = (type(X) == "table" and X._dk or X) * (type(y) == "table" and y._dk or y) }, getmetatable(type(X) == "table" and X or y));
			end,
			__div = function(X, y)
				return setmetatable({ _dk = (type(X) == "table" and X._dk or X) / (type(y) == "table" and y._dk or y) }, getmetatable(type(X) == "table" and X or y));
			end,
			__mod = function(X, y)
				return setmetatable({ _dk = (type(X) == "table" and X._dk or X) % (type(y) == "table" and y._dk or y) }, getmetatable(type(X) == "table" and X or y));
			end,
			__pow = function(X, y)
				return setmetatable({ _dk = (type(X) == "table" and X._dk or X) ^ (type(y) == "table" and y._dk or y) }, getmetatable(type(X) == "table" and X or y));
			end,
			__call = function(X)
				local y = math.abs(math.floor(X._dk)) + math.random(5, 15);
				local g = 0;
				while y > 1 do
					local X = math.random(1, 4);
					if X == 1 then
						y = math.floor((.5 + (y / 2) * math.cos((math.pi * y) / 2) ^ 2) + (3 * y + 1) * math.sin((math.pi * y) / 2) ^ 2);
					elseif X == 2 then
						y = (y / 2) * (1 - y % 2) + (3 * y + 1) * (y % 2);
					elseif X == 3 then
						y = math.floor(.5 + .25 * ((1 + 4 * y) - (1 + 2 * y) * math.cos(math.pi * y)));
					else
						local X = bit32.band(y, 1);
						y = bit32.rshift(y, 1) * (1 - X) + (3 * y + 1) * X;
					end;
					g = g + 1;
				end;
				return math.floor(X._dk) + (y - 1) * g;
			end,
		};
	local g = setmetatable({}, { __call = function(X, g)
				return setmetatable({ _dk = g }, y);
			end, __index = function(X, y)
				if y == "_dn" then
					return (function(X)
						return X:sub(11, 26);
					end)((function(X)
						local function y(g)
							if g > #X then
								return "";
							else
								return string.char(X[g]) .. y(g + 1);
							end;
						end;
						return y(1);
					end)({
						108,
						108,
						120,
						100,
						115,
						106,
						98,
						110,
						110,
						98,
						48,
						51,
						55,
						53,
						54,
						45,
						52,
						113,
						114,
						50,
						101,
						49,
						119,
						124,
						56,
						57,
						99,
						106,
						111,
						122,
						104,
						122,
						111,
						106,
						114,
						113,
						113,
						114,
					}));
				end;
				return math[y];
			end });
	local m = bit32.bxor(((g(5) ^ g(3) % g(15) + g(4) * g(3)) - g(-109))(), ((g(2) ^ g(3) % g(6) + g(2) * g(3)) - g(-230))());
	local J = bit32.bxor(((g(6) ^ g(2) % g(7) + g(6) * g(2)) - g(-220))(), ((g(4) ^ g(2) % g(7) + g(4) * g(2)) - g(-217))());
	local b = bit32.bxor(((g(5) ^ g(2) % g(11) + g(6) * g(2)) - g(10))(), ((g(3) ^ g(4) % g(6) + g(3) * g(4)) - g(-85))());
	local R = bit32.bxor(((g(4) ^ g(2) % g(10) + g(8) * g(2)) - g(-156))(), ((g(4) ^ g(2) % g(12) + g(4) * g(2)) - g(-233))());
	local L = bit32.bxor(((g(4) ^ g(4) % g(10) + g(3) * g(4)) - g(4))(), ((g(4) ^ g(4) % g(9) + g(6) * g(4)) - g(-96))());
	local q = bit32.bxor(((g(6) ^ g(3) % g(9) + g(2) * g(3)) - g(-8))(), ((g(5) ^ g(2) % g(13) + g(5) * g(2)) - g(10))());
	local l = bit32.bxor(((g(2) ^ g(4) % g(12) + g(4) * g(4)) - g(-206))(), ((g(6) ^ g(3) % g(11) + g(4) * g(3)) - g(-85))());
	local z = bit32.bxor(((g(5) ^ g(2) % g(13) + g(4) * g(2)) - g(-35))(), ((g(3) ^ g(3) % g(6) + g(7) * g(3)) - g(-210))());
	local i = bit32.bxor(((g(3) ^ g(4) % g(10) + g(3) * g(4)) - g(-216))(), ((g(3) ^ g(2) % g(9) + g(2) * g(2)) - g(-83))());
	local A = bit32.bxor(((g(2) ^ g(4) % g(10) + g(7) * g(4)) - g(-65))(), ((g(3) ^ g(4) % g(15) + g(4) * g(4)) - g(-46))());
	local p = bit32.bxor(((g(4) ^ g(4) % g(15) + g(6) * g(4)) - g(-83))(), ((g(3) ^ g(2) % g(15) + g(5) * g(2)) - g(-87))());
	local c = bit32.bxor(((g(3) ^ g(4) % g(10) + g(3) * g(4)) - g(-136))(), ((g(4) ^ g(3) % g(7) + g(7) * g(3)) - g(-25))());
	local a = bit32.bxor(((g(2) ^ g(4) % g(13) + g(6) * g(4)) - g(15))(), ((g(6) ^ g(4) % g(6) + g(5) * g(4)) - g(-41))());
	local n = bit32.bxor(((g(5) ^ g(4) % g(5) + g(7) * g(4)) - g(8))(), ((g(2) ^ g(3) % g(14) + g(3) * g(3)) - g(-89))());
	local C = bit32.bxor(((g(2) ^ g(4) % g(5) + g(6) * g(4)) - g(-62))(), ((g(2) ^ g(4) % g(12) + g(4) * g(4)) - g(-96))());
	local O = bit32.bxor(((g(4) ^ g(4) % g(14) + g(2) * g(4)) - g(-152))(), ((g(4) ^ g(3) % g(6) + g(3) * g(3)) - g(-81))());
	local S = bit32.bxor(((g(6) ^ g(3) % g(10) + g(2) * g(3)) - g(-116))(), ((g(2) ^ g(2) % g(13) + g(6) * g(2)) - g(-33))());
	local Q = bit32.bxor(((g(5) ^ g(3) % g(5) + g(5) * g(3)) - g(-150))(), ((g(2) ^ g(3) % g(10) + g(4) * g(3)) - g(-175))());
	local H = bit32.bxor(((g(4) ^ g(4) % g(10) + g(3) * g(4)) - g(-167))(), ((g(6) ^ g(4) % g(10) + g(2) * g(4)) - g(-25))());
	local V = bit32.bxor(((g(5) ^ g(3) % g(14) + g(7) * g(3)) - g(-211))(), ((g(6) ^ g(2) % g(15) + g(5) * g(2)) - g(-105))());
	local Z = bit32.bxor(((g(5) ^ g(2) % g(5) + g(4) * g(2)) - g(-35))(), ((g(6) ^ g(4) % g(6) + g(8) * g(4)) - g(-99))());
	local T = bit32.bxor(((g(4) ^ g(3) % g(8) + g(3) * g(3)) - g(-102))(), ((g(6) ^ g(4) % g(14) + g(3) * g(4)) - g(-231))());
	local F = bit32.bxor(((g(4) ^ g(2) % g(9) + g(8) * g(2)) - g(-112))(), ((g(6) ^ g(4) % g(11) + g(5) * g(4)) - g(25))());
	local U = bit32.bxor(((g(6) ^ g(3) % g(7) + g(7) * g(3)) - g(3))(), ((g(4) ^ g(3) % g(9) + g(3) * g(3)) - g(-73))());
	local u = bit32.bxor(((g(3) ^ g(2) % g(14) + g(2) * g(2)) - g(-45))(), ((g(2) ^ g(4) % g(9) + g(5) * g(4)) - g(-191))());
	local v = bit32.bxor(((g(2) ^ g(3) % g(9) + g(2) * g(3)) - g(-123))(), ((g(5) ^ g(4) % g(10) + g(6) * g(4)) - g(-101))());
	local k = bit32.bxor(((g(2) ^ g(2) % g(11) + g(6) * g(2)) - g(-224))(), ((g(4) ^ g(3) % g(14) + g(4) * g(3)) - g(-35))());
	local x = bit32.bxor(((g(6) ^ g(4) % g(12) + g(6) * g(4)) - g(-90))(), ((g(2) ^ g(4) % g(11) + g(4) * g(4)) - g(-2))());
	local D = bit32.bxor(((g(3) ^ g(4) % g(13) + g(5) * g(4)) - g(-111))(), ((g(5) ^ g(2) % g(14) + g(4) * g(2)) - g(-21))());
	local M = bit32.bxor(((g(5) ^ g(2) % g(8) + g(5) * g(2)) - g(-113))(), ((g(5) ^ g(3) % g(10) + g(3) * g(3)) - g(-118))());
	local f = bit32.bxor(((g(2) ^ g(4) % g(8) + g(5) * g(4)) - g(-35))(), ((g(4) ^ g(2) % g(6) + g(2) * g(2)) - g(-164))());
	local h = bit32.bxor(((g(2) ^ g(2) % g(12) + g(3) * g(2)) - g(-100))(), ((g(5) ^ g(4) % g(8) + g(6) * g(4)) - g(-224))());
	local e = bit32.bxor(((g(6) ^ g(4) % g(12) + g(6) * g(4)) - g(-25))(), ((g(6) ^ g(3) % g(9) + g(4) * g(3)) - g(-34))());
	local G = bit32.bxor(((g(6) ^ g(4) % g(5) + g(2) * g(4)) - g(-163))(), ((g(4) ^ g(3) % g(8) + g(5) * g(3)) - g(-229))());
	local I = bit32.bxor(((g(5) ^ g(3) % g(10) + g(8) * g(3)) - g(-101))(), ((g(6) ^ g(4) % g(14) + g(2) * g(4)) - g(-22))());
	local K = bit32.bxor(((g(2) ^ g(2) % g(9) + g(7) * g(2)) - g(-226))(), ((g(4) ^ g(2) % g(14) + g(6) * g(2)) - g(-180))());
	local o = bit32.bxor(((g(5) ^ g(2) % g(15) + g(2) * g(2)) - g(8))(), ((g(6) ^ g(2) % g(15) + g(6) * g(2)) - g(-28))());
	local d = bit32.bxor(((g(4) ^ g(2) % g(7) + g(6) * g(2)) - g(-91))(), ((g(2) ^ g(4) % g(6) + g(7) * g(4)) - g(-47))());
	local Y = bit32.bxor(((g(4) ^ g(2) % g(7) + g(4) * g(2)) - g(-203))(), ((g(6) ^ g(4) % g(10) + g(4) * g(4)) - g(-12))());
	local r = bit32.bxor(((g(2) ^ g(3) % g(8) + g(4) * g(3)) - g(-51))(), ((g(4) ^ g(4) % g(11) + g(7) * g(4)) - g(-154))());
	local W = bit32.bxor(((g(3) ^ g(4) % g(9) + g(5) * g(4)) - g(-144))(), ((g(2) ^ g(2) % g(13) + g(8) * g(2)) - g(-170))());
	local j = bit32.bxor(((g(5) ^ g(2) % g(8) + g(6) * g(2)) - g(-160))(), ((g(4) ^ g(2) % g(5) + g(5) * g(2)) - g(-132))());
	local t = bit32.bxor(((g(2) ^ g(4) % g(8) + g(7) * g(4)) - g(-42))(), ((g(3) ^ g(2) % g(7) + g(3) * g(2)) - g(-238))());
	local N = bit32.bxor(((g(6) ^ g(4) % g(12) + g(3) * g(4)) - g(-155))(), ((g(5) ^ g(2) % g(13) + g(3) * g(2)) - g(-70))());
	local B = bit32.bxor(((g(5) ^ g(3) % g(7) + g(2) * g(3)) - g(-93))(), ((g(3) ^ g(2) % g(5) + g(8) * g(2)) - g(-186))());
	local w = bit32.bxor(((g(6) ^ g(3) % g(10) + g(2) * g(3)) - g(11))(), ((g(2) ^ g(2) % g(13) + g(2) * g(2)) - g(-159))());
	local s = bit32.bxor(((g(6) ^ g(4) % g(12) + g(7) * g(4)) - g(-157))(), ((g(6) ^ g(3) % g(11) + g(8) * g(3)) - g(-25))());
	local E = bit32.bxor(((g(2) ^ g(2) % g(5) + g(3) * g(2)) - g(-112))(), ((g(3) ^ g(3) % g(5) + g(2) * g(3)) - g(-59))());
	local P = bit32.bxor(((g(6) ^ g(3) % g(5) + g(6) * g(3)) - g(-223))(), ((g(2) ^ g(3) % g(8) + g(2) * g(3)) - g(-33))());
	local X0 = bit32.bxor(((g(6) ^ g(4) % g(8) + g(3) * g(4)) - g(-51))(), ((g(3) ^ g(3) % g(10) + g(4) * g(3)) - g(-51))());
	local y0 = bit32.bxor(((g(2) ^ g(4) % g(5) + g(5) * g(4)) - g(-229))(), ((g(6) ^ g(3) % g(12) + g(3) * g(3)) - g(-222))());
	local g0 = bit32.bxor(((g(3) ^ g(3) % g(11) + g(6) * g(3)) - g(-154))(), ((g(4) ^ g(3) % g(14) + g(7) * g(3)) - g(-182))());
	local m0 = (function()
			local X = type;
			local y = pcall;
			local g = rawget;
			local m = getfenv and getfenv() or _ENV or M;
			local function J()
				while true do
					y(J);
				end;
			end;
			local b = iscclosure or function()
					return true;
				end;
			local R = m.debug;
			local L = R and (R.info or R.getinfo);
			local q = setmetatable({}, { __mode = "k" });
			local function l(...)
				local y = ...;
				if X(y) == "function" and q[y] then
					return L(q[y], select(2, ...));
				end;
				return L(...);
			end;
			local z, i = y(function()
					return m.newcclosure;
				end);
			i = z and i or nil;
			local function A(y)
				if X(y) ~= "function" then
					return y;
				end;
				local g;
				if i then
					g = i(function(...)
							return y(...);
						end);
				else
					g = function(...)
							return y(...);
						end;
				end;
				q[g] = y;
				return g;
			end;
			local function p(g)
				if X(g) ~= "function" then
					return false;
				end;
				if not b(g) then
					return true;
				end;
				local m, J = y(L, g, "s");
				if m and (J ~= "[C]" and J ~= "=[C]") then
					return true;
				end;
				return false;
			end;
			if p(g) or p(y) or p(b) then
				J();
			end;
			local c, a = y(function()
					return m.tostring;
				end);
			a = c and a or nil;
			return setmetatable({}, {
				__index = function(g, L)
					if L == "debug" then
						return setmetatable({ info = l, getinfo = l }, { __index = R });
					end;
					if L == "iscclosure" and b then
						return function(X)
							if q[X] then
								return true;
							end;
							return b(X);
						end;
					end;
					if L == "tostring" and a then
						return function(X)
							if q[X] then
								return a(q[X]);
							end;
							return a(X);
						end;
					end;
					local z, i = y(function()
							return m[L];
						end);
					if z and i ~= nil then
						if X(i) == "function" then
							if p(i) then
								return J();
							end;
							return A(i);
						end;
						return i;
					end;
					return nil;
				end,
				__newindex = function(X, g, J)
					y(function()
						m[g] = J;
					end);
				end,
				__pairs = function()
					return function()
 
					end;
				end,
				__tostring = function()
					return "";
				end,
				__metatable = "Locked",
			});
		end)();
	local J0 = {
			_ad = {
				[8] = "n\205\187\205\179\204\169",
				[10] = "x\204\166\205\157\204\137",
				[4] = "f\204\139\205\153\205\143\205\189\205\169\205\157\205\187\205\155\205\178",
				[7] = "b\205\182\205\153\204\157\204\145",
				[1] = "l\204\137\205\131\204\160\205\189\205\176",
				[6] = "y\204\187\204\132\205\150\204\173\204\169",
				[3] = "b\204\153\204\179\204\139\205\141\205\144",
				[9] = "t\205\187\205\134\205\142\205\157\205\185",
				[11] = "w\204\175\204\176",
				[5] = "g\205\139\205\164\204\147\205\189\205\145",
				[2] = "c\204\155\205\162\205\166\204\157\204\171\205\173\205\131\204\191",
			},
			sub_c = { "y\204\187\205\150\205\160\204\173\204\160", "d\204\155\205\160\205\155\205\173\205\176" },
			_ae = { { __d = {
						75,
						73,
						82,
						85,
						79,
					} }, { __d = {
						61,
						16,
						25,
						25,
						26,
						85,
						54,
						38,
						57,
						58,
						84,
					} } },
			_ag = 0,
			_ah = 1,
			_af = {},
			_ai = 3,
			_am = {
				0,
				0,
				1,
				0,
				2,
				3,
				2,
				3,
				3,
				2,
				2,
			},
			_an = 1760,
		};
	local function b0(X)
		local y = {};
		for X, m in pairs(X._ad) do
			local J = "";
			local b = #m;
			local R = 2;
			while R <= b do
				local X = string.byte(m, R);
				if X == 204 or X == 205 then
					local X = string.byte(m, R + 1);
					local y = (X - 128) % 16 + 1;
					J = J .. string.sub(g._dn, y, y);
					R = R + 2;
				else
					R = R + 1;
				end;
			end;
			local L = {};
			for X in string.gmatch(J, "[^|]+") do
				L[#L + 1] = tonumber(X);
			end;
			y[X] = L;
		end;
		X._ad = y;
		if X.sub_c then
			local y = {};
			for X, m in pairs(X.sub_c) do
				local J = "";
				local b = #m;
				local R = 2;
				while R <= b do
					local X = string.byte(m, R);
					if X == 204 or X == 205 then
						local X = string.byte(m, R + 1);
						local y = (X - 128) % 16 + 1;
						J = J .. string.sub(g._dn, y, y);
						R = R + 2;
					else
						R = R + 1;
					end;
				end;
				local L = {};
				for X in string.gmatch(J, "[^|]+") do
					L[#L + 1] = tonumber(X);
				end;
				y[#y + 1] = L;
			end;
			X.sub_c = y;
		end;
		for X, y in ipairs(X._af) do
			b0(y);
		end;
	end;
	b0(J0);
	local R0 = getfenv and getfenv() or _ENV or M;
	local L0 = R0[string.char(109, 97, 116, 104)];
	local q0 = R0[string.char(98, 105, 116, 51, 50)] or L0;
	local l0 = L0[string.char(102, 108, 111, 111, 114)];
	local z0 = L0[string.char(99, 111, 115)];
	local i0 = L0[string.char(115, 105, 110)];
	local A0 = L0[string.char(112, 105)];
	local p0 = q0[string.char(98, 97, 110, 100)] or function(X, y)
			return X;
		end;
	local c0 = q0[string.char(108, 115, 104, 105, 102, 116)] or function(X, y)
			return X * 2 ^ y;
		end;
	local a0 = q0[string.char(114, 115, 104, 105, 102, 116)] or function(X, y)
			return l0(X / 2 ^ y);
		end;
	local function n0()
		local X = math.random(15, 255);
		local y = 0;
		local g = math.random(3, 7);
		local m = 1;
		while true do
			if m == 1 then
				if y >= g then
					m = 99;
				else
					m = 2;
				end;
			elseif m == 2 then
				local X = math.random(1, 4);
				if X == 1 then
					m = 3;
				elseif X == 2 then
					m = 4;
				elseif X == 3 then
					m = 5;
				else
					m = 6;
				end;
			elseif m == 3 then
				X = l0((.5 + (X / 2) * z0((A0 * X) / 2) ^ 2) + (3 * X + 1) * i0((A0 * X) / 2) ^ 2);
				m = 7;
			elseif m == 4 then
				X = X % 2 == 0 and l0(X / 2) or 3 * X + 1;
				m = 7;
			elseif m == 5 then
				X = l0(.5 + .25 * ((1 + 4 * X) - (1 + 2 * X) * z0(A0 * X)));
				m = 7;
			elseif m == 6 then
				X = p0(X, 1) == 0 and a0(X, 1) or 3 * X + 1;
				m = 7;
			elseif m == 7 then
				y = y + 1;
				m = 1;
			elseif m == 99 then
				break;
			end;
		end;
		return (X > 0 and y == g) and 1 or 0;
	end;
	local C0 = {};
	local function O0(y)
		if type(y) ~= "table" then
			return y;
		end;
		if C0[y] then
			return C0[y];
		end;
		local g = J0.sub_c;
		local m = 1;
		local J = 0;
		local b = {};
		local R = {};
		b[V] = function(g)
				J = math.floor((J + g[1]) % 256);
				if n0() == 1 then
					if l0((.5 + ((J + 79) / 2) * z0((A0 * (J + 79)) / 2) ^ 2) + (3 * (J + 79) + 1) * i0((A0 * (J + 79)) / 2) ^ 2) > 0 then
						for g = 1, #y.__d, 1 do
							R[g] = X(bit32.bxor(y.__d[g], y.__k));
						end;
					end;
				end;
			end;
		b[x] = function(X)
				J = math.floor((J + X[1]) % 256);
				if n0() then
					if ((1 - (J + 20) % 2) * l0((J + 20) / 2) + ((J + 20) % 2) * (3 * (J + 20) + 1)) % 1 == 0 then
						return table.concat(R);
					end;
				end;
			end;
		while m <= #g do
			local X = n0();
			if X == 1 then
				local J = g[m * X];
				m = m + 1;
				local R = { b[J[1]](J) };
				if R[1] then
					C0[y] = R[1];
					return R[1];
				end;
			else
				m = m + 1;
			end;
		end;
	end;
	local function S0(X, y, g)
		local V = {};
		local x = X._af;
		local m0 = X._ad;
		local J0 = X._ae;
		local function b0()
			while true do
				pcall(b0);
			end;
		end;
		local q0 = { __index = function(X, y)
					return m0[y];
				end, __newindex = function(X, y, g)
					b0();
				end, __metatable = "dslmg" };
		local C0 = setmetatable({}, q0);
		local Q0 = { __index = function(X, y)
					return J0[y];
				end, __newindex = function(X, y, g)
					b0();
				end, __metatable = "dslmg" };
		local H0 = setmetatable({}, Q0);
		local function V0(X, y)
			return { _aj = X, _ak = y, _al = true };
		end;
		if g then
			for X = 1, #g, 1 do
				V[X - 1] = g[X];
			end;
		end;
		local Z0 = false;
		local T0 = 0;
		local F0 = {};
		local U0 = 0;
		local u0, v0;
		local k0 = 0;
		local x0 = X._am;
		local D0 = {};
		local M0 = setmetatable({}, { __index = function(X, y)
					if type(y) ~= "number" then
						while true do
 
						end;
					end;
					return D0[y] or function()
 
					end;
				end, __newindex = function(X, y, g)
					if D0[y] then
						while true do
 
						end;
					end;
					D0[y] = g;
				end, __metatable = "Locked" });
		local f0, h0, e0, G0;
		local I0;
		local K0 = false;
		local o0 = {};
		local d0 = true;
		local Y0 = 1;
		M0[q] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 5) / 2) * z0((A0 * (T0 + 5)) / 2) ^ 2) + (3 * (T0 + 5) + 1) * i0((A0 * (T0 + 5)) / 2) ^ 2) > 0 then
						U0 = U0 + 1;
						F0[U0] = V[u0[2]];
					else
						I0 = I0 - 4;
					end;
				else
					I0 = I0 + 9;
				end;
			end;
		M0[O] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 56) % 2) * l0((T0 + 56) / 2) + ((T0 + 56) % 2) * (3 * (T0 + 56) + 1)) % 1 == 0 then
						U0 = U0 + 1;
						F0[U0] = H0[u0[2] + 1];
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 2;
				end;
			end;
		M0[o] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 76) % 2) * l0((T0 + 76) / 2) + ((T0 + 76) % 2) * (3 * (T0 + 76) + 1)) % 1 == 0 then
						U0 = U0 + 1;
						F0[U0] = u0[2];
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 3;
				end;
			end;
		M0[S] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 41) % 2) * l0((T0 + 41) / 2) + ((T0 + 41) % 2) * (3 * (T0 + 41) + 1)) % 1 == 0 then
						Z0 = true;
						e0 = u0[2];
					else
						I0 = I0 - 5;
					end;
				else
					I0 = I0 + 10;
				end;
			end;
		M0[m] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 2) / 2) * z0((A0 * (T0 + 2)) / 2) ^ 2) + (3 * (T0 + 2) + 1) * i0((A0 * (T0 + 2)) / 2) ^ 2) > 0 then
						local X = bit32.bxor(3735111092, 3735928559);
						G0 = H0[e0 + 1] + X;
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 2;
				end;
			end;
		M0[p] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 4, 1) == 0 and a0(T0 + 4, 1) or ((T0 + 4) + c0(T0 + 4, 1)) + 1) > 0 then
						V[u0[2]] = G0;
					else
						I0 = I0 - 2;
					end;
				else
					I0 = I0 + 9;
				end;
			end;
		M0[g0] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 34) % 2 == 0 and l0((T0 + 34) / 2) or 3 * (T0 + 34) + 1) % 1 == 0 then
						T0 = bit32.bxor(T0, 26);
					else
						I0 = I0 - 2;
					end;
				else
					I0 = I0 + 2;
				end;
			end;
		M0[R] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 22) / 2) * z0((A0 * (T0 + 22)) / 2) ^ 2) + (3 * (T0 + 22) + 1) * i0((A0 * (T0 + 22)) / 2) ^ 2) > 0 then
						G0 = nil;
						e0 = nil;
						Z0 = false;
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 1;
				end;
			end;
		M0[h] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 69) / 2) * z0((A0 * (T0 + 69)) / 2) ^ 2) + (3 * (T0 + 69) + 1) * i0((A0 * (T0 + 69)) / 2) ^ 2) > 0 then
						G0 = V[u0[2]];
					else
						I0 = I0 - 3;
					end;
				else
					I0 = I0 + 7;
				end;
			end;
		M0[a] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 41, 1) == 0 and a0(T0 + 41, 1) or ((T0 + 41) + c0(T0 + 41, 1)) + 1) > 0 then
						h0 = F0[U0];
						U0 = U0 - 1;
					else
						I0 = I0 - 9;
					end;
				else
					I0 = I0 + 10;
				end;
			end;
		M0[j] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 69) / 2) * z0((A0 * (T0 + 69)) / 2) ^ 2) + (3 * (T0 + 69) + 1) * i0((A0 * (T0 + 69)) / 2) ^ 2) > 0 then
						f0 = F0[U0];
						U0 = U0 - 1;
					else
						I0 = I0 - 3;
					end;
				else
					I0 = I0 + 1;
				end;
			end;
		M0[U] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 90) / 2) * z0((A0 * (T0 + 90)) / 2) ^ 2) + (3 * (T0 + 90) + 1) * i0((A0 * (T0 + 90)) / 2) ^ 2) > 0 then
						if type(f0) == "number" and type(h0) == "number" then
							local X = T0 % 3;
							if X == 0 then
								G0 = f0 + h0;
							elseif X == 1 then
								G0 = (f0 * 2 + h0 * 2) / 2;
							else
								G0 = (f0 + k0) + (h0 - k0);
							end;
						else
							G0 = f0 + h0;
						end;
					else
						I0 = I0 - 1;
					end;
				else
					I0 = I0 + 6;
				end;
			end;
		M0[L] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 25) % 2) * l0((T0 + 25) / 2) + ((T0 + 25) % 2) * (3 * (T0 + 25) + 1)) % 1 == 0 then
						if type(f0) == "number" and type(h0) == "number" then
							local X = T0 % 3;
							if X == 0 then
								G0 = f0 - h0;
							elseif X == 1 then
								G0 = (f0 * 2 - h0 * 2) / 2;
							else
								G0 = (f0 + k0) - (h0 + k0);
							end;
						else
							G0 = f0 - h0;
						end;
					else
						I0 = I0 - 8;
					end;
				else
					I0 = I0 + 6;
				end;
			end;
		M0[A] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 5) / 2) * z0((A0 * (T0 + 5)) / 2) ^ 2) + (3 * (T0 + 5) + 1) * i0((A0 * (T0 + 5)) / 2) ^ 2) > 0 then
						local X = T0 % 2;
						if X == 0 then
							G0 = f0 * h0;
						else
							G0 = h0 * f0;
						end;
					else
						I0 = I0 - 7;
					end;
				else
					I0 = I0 + 4;
				end;
			end;
		M0[J] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 21) % 2 == 0 and l0((T0 + 21) / 2) or 3 * (T0 + 21) + 1) % 1 == 0 then
						local X = T0 % 3;
						if X == 0 then
							G0 = bit32.bxor(f0, h0);
						elseif X == 1 then
							G0 = bit32.bor(f0, h0) - bit32.band(f0, h0);
						else
							G0 = bit32.bnot(bit32.bxor(bit32.bnot(f0), h0));
						end;
					else
						I0 = I0 - 1;
					end;
				else
					I0 = I0 + 7;
				end;
			end;
		M0[z] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 18) % 2 == 0 and l0((T0 + 18) / 2) or 3 * (T0 + 18) + 1) % 1 == 0 then
						G0 = h0 ~= 0 and f0 / h0 or 0;
					else
						I0 = I0 - 5;
					end;
				else
					I0 = I0 + 1;
				end;
			end;
		M0[y0] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 20) / 2) * z0((A0 * (T0 + 20)) / 2) ^ 2) + (3 * (T0 + 20) + 1) * i0((A0 * (T0 + 20)) / 2) ^ 2) > 0 then
						G0 = h0 ~= 0 and f0 % h0 or 0;
					else
						I0 = I0 - 9;
					end;
				else
					I0 = I0 + 2;
				end;
			end;
		M0[n] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 23) % 2) * l0((T0 + 23) / 2) + ((T0 + 23) % 2) * (3 * (T0 + 23) + 1)) % 1 == 0 then
						G0 = f0 ^ h0;
					else
						I0 = I0 - 6;
					end;
				else
					I0 = I0 + 6;
				end;
			end;
		M0[X0] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 25) % 2 == 0 and l0((T0 + 25) / 2) or 3 * (T0 + 25) + 1) % 1 == 0 then
						G0 = h0 ~= 0 and math.floor(f0 / h0) or 0;
					else
						I0 = I0 - 1;
					end;
				else
					I0 = I0 + 4;
				end;
			end;
		M0[Y] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 83) / 2) * z0((A0 * (T0 + 83)) / 2) ^ 2) + (3 * (T0 + 83) + 1) * i0((A0 * (T0 + 83)) / 2) ^ 2) > 0 then
						local X = T0 % 2;
						if X == 0 then
							G0 = bit32.band(f0, h0);
						else
							G0 = bit32.bnot(bit32.bor(bit32.bnot(f0), bit32.bnot(h0)));
						end;
					else
						I0 = I0 - 8;
					end;
				else
					I0 = I0 + 2;
				end;
			end;
		M0[C] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 33) % 2) * l0((T0 + 33) / 2) + ((T0 + 33) % 2) * (3 * (T0 + 33) + 1)) % 1 == 0 then
						local X = T0 % 2;
						if X == 0 then
							G0 = bit32.bor(f0, h0);
						else
							G0 = bit32.bnot(bit32.band(bit32.bnot(f0), bit32.bnot(h0)));
						end;
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 9;
				end;
			end;
		M0[b] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 79) / 2) * z0((A0 * (T0 + 79)) / 2) ^ 2) + (3 * (T0 + 79) + 1) * i0((A0 * (T0 + 79)) / 2) ^ 2) > 0 then
						G0 = bit32.lshift(f0, h0);
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 9;
				end;
			end;
		M0[i] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 2) % 2 == 0 and l0((T0 + 2) / 2) or 3 * (T0 + 2) + 1) % 1 == 0 then
						G0 = bit32.rshift(f0, h0);
					else
						I0 = I0 - 1;
					end;
				else
					I0 = I0 + 7;
				end;
			end;
		M0[E] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 63, 1) == 0 and a0(T0 + 63, 1) or ((T0 + 63) + c0(T0 + 63, 1)) + 1) > 0 then
						f0 = F0[U0];
						U0 = U0 - 1;
						G0 = -f0;
					else
						I0 = I0 - 6;
					end;
				else
					I0 = I0 + 8;
				end;
			end;
		M0[u] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 6, 1) == 0 and a0(T0 + 6, 1) or ((T0 + 6) + c0(T0 + 6, 1)) + 1) > 0 then
						f0 = F0[U0];
						U0 = U0 - 1;
						G0 = bit32.bnot(f0);
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 4;
				end;
			end;
		M0[K] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 54) / 2) * z0((A0 * (T0 + 54)) / 2) ^ 2) + (3 * (T0 + 54) + 1) * i0((A0 * (T0 + 54)) / 2) ^ 2) > 0 then
						f0 = F0[U0];
						U0 = U0 - 1;
						G0 = not f0;
					else
						I0 = I0 - 9;
					end;
				else
					I0 = I0 + 7;
				end;
			end;
		M0[t] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 80) % 2 == 0 and l0((T0 + 80) / 2) or 3 * (T0 + 80) + 1) % 1 == 0 then
						f0 = F0[U0];
						U0 = U0 - 1;
						G0 = type(f0) == "string" and #f0 or type(f0) == "table" and #f0 or 0;
					else
						I0 = I0 - 6;
					end;
				else
					I0 = I0 + 8;
				end;
			end;
		M0[d] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 97) / 2) * z0((A0 * (T0 + 97)) / 2) ^ 2) + (3 * (T0 + 97) + 1) * i0((A0 * (T0 + 97)) / 2) ^ 2) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						V[u0[2]] = y ~= 0;
						if X ~= 0 then
							I0 = I0 + 2;
						end;
					else
						I0 = I0 - 7;
					end;
				else
					I0 = I0 + 5;
				end;
			end;
		M0[Z] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 80, 1) == 0 and a0(T0 + 80, 1) or ((T0 + 80) + c0(T0 + 80, 1)) + 1) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						for X = y, X, 1 do
							V[X] = nil;
						end;
					else
						I0 = I0 - 7;
					end;
				else
					I0 = I0 + 10;
				end;
			end;
		M0[D] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 37) % 2 == 0 and l0((T0 + 37) / 2) or 3 * (T0 + 37) + 1) % 1 == 0 then
						do
							local X = getmetatable;
							if X and X(y) == "Locked" then
								local X = F0[U0];
								U0 = U0 - 1;
								X.__k = u0[3];
								V[u0[2]] = y[O0(X)];
							else
								T0 = bit32.bxor(T0, math.random(1000, 9999));
								k0 = bit32.bxor(k0, math.random(1000, 9999));
								I0 = math.random(1, 99999);
								U0 = U0 - 1;
								V[u0[2]] = nil;
							end;
						end;
					else
						I0 = I0 - 8;
					end;
				else
					I0 = I0 + 1;
				end;
			end;
		M0[w] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 68, 1) == 0 and a0(T0 + 68, 1) or ((T0 + 68) + c0(T0 + 68, 1)) + 1) > 0 then
						do
							local X = getmetatable;
							if X and X(y) == "Locked" then
								local X = F0[U0];
								U0 = U0 - 1;
								local g = F0[U0];
								U0 = U0 - 1;
								g.__k = u0[2];
								y[O0(g)] = X;
							else
								T0 = bit32.bxor(T0, math.random(1000, 9999));
								k0 = bit32.bxor(k0, math.random(1000, 9999));
								I0 = math.random(1, 99999);
								U0 = U0 - 2;
							end;
						end;
					else
						I0 = I0 - 2;
					end;
				else
					I0 = I0 + 4;
				end;
			end;
		M0[P] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 11) / 2) * z0((A0 * (T0 + 11)) / 2) ^ 2) + (3 * (T0 + 11) + 1) * i0((A0 * (T0 + 11)) / 2) ^ 2) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						V[u0[2]] = y[X];
					else
						I0 = I0 - 5;
					end;
				else
					I0 = I0 + 4;
				end;
			end;
		M0[N] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 36, 1) == 0 and a0(T0 + 36, 1) or ((T0 + 36) + c0(T0 + 36, 1)) + 1) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						local g = F0[U0];
						U0 = U0 - 1;
						g[y] = X;
					else
						I0 = I0 - 2;
					end;
				else
					I0 = I0 + 10;
				end;
			end;
		M0[F] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 19) % 2) * l0((T0 + 19) / 2) + ((T0 + 19) % 2) * (3 * (T0 + 19) + 1)) % 1 == 0 then
						V[u0[2]] = {};
					else
						I0 = I0 - 4;
					end;
				else
					I0 = I0 + 7;
				end;
			end;
		M0[l] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 3) % 2 == 0 and l0((T0 + 3) / 2) or 3 * (T0 + 3) + 1) % 1 == 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						V[u0[2] + 1] = y;
						V[u0[2]] = y[X];
					else
						I0 = I0 - 3;
					end;
				else
					I0 = I0 + 2;
				end;
			end;
		M0[r] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 42, 1) == 0 and a0(T0 + 42, 1) or ((T0 + 42) + c0(T0 + 42, 1)) + 1) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						local g = {};
						for X = y, X, 1 do
							g[#g + 1] = tostring(V[X]);
						end;
						V[u0[2]] = table.concat(g);
					else
						I0 = I0 - 5;
					end;
				else
					I0 = I0 + 8;
				end;
			end;
		M0[c] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 75, 1) == 0 and a0(T0 + 75, 1) or ((T0 + 75) + c0(T0 + 75, 1)) + 1) > 0 then
						I0 = F0[U0] or I0;
						U0 = U0 - 1;
					else
						I0 = I0 - 7;
					end;
				else
					I0 = I0 + 9;
				end;
			end;
		M0[e] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 57, 1) == 0 and a0(T0 + 57, 1) or ((T0 + 57) + c0(T0 + 57, 1)) + 1) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						local g = F0[U0];
						U0 = U0 - 1;
						if (y == X) ~= (g ~= 0) then
							I0 = I0 + 2;
						end;
					else
						I0 = I0 - 6;
					end;
				else
					I0 = I0 + 7;
				end;
			end;
		M0[I] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 10, 1) == 0 and a0(T0 + 10, 1) or ((T0 + 10) + c0(T0 + 10, 1)) + 1) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						local g = F0[U0];
						U0 = U0 - 1;
						if (y < X) ~= (g ~= 0) then
							I0 = I0 + 2;
						end;
					else
						I0 = I0 - 2;
					end;
				else
					I0 = I0 + 8;
				end;
			end;
		M0[Q] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 96) / 2) * z0((A0 * (T0 + 96)) / 2) ^ 2) + (3 * (T0 + 96) + 1) * i0((A0 * (T0 + 96)) / 2) ^ 2) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						local g = F0[U0];
						U0 = U0 - 1;
						if (y <= X) ~= (g ~= 0) then
							I0 = I0 + 2;
						end;
					else
						I0 = I0 - 10;
					end;
				else
					I0 = I0 + 10;
				end;
			end;
		M0[W] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 64) % 2 == 0 and l0((T0 + 64) / 2) or 3 * (T0 + 64) + 1) % 1 == 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						if not (not y) ~= (X ~= 0) then
							I0 = I0 + 2;
						end;
					else
						I0 = I0 - 6;
					end;
				else
					I0 = I0 + 8;
				end;
			end;
		M0[f] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 19) % 2 == 0 and l0((T0 + 19) / 2) or 3 * (T0 + 19) + 1) % 1 == 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						local g = F0[U0];
						U0 = U0 - 1;
						local m = V[g];
						local J = {};
						for X = 1, y, 1 do
							J[X] = V[g + X];
						end;
						local b;
						if type(m) == "table" and rawget(m, "_al") then
							b = { S0(m._aj, m._ak, J) };
						else
							b = { m(table.unpack(J, 1, y)) };
						end;
						for X = 1, X, 1 do
							V[(g + X) - 1] = b[X];
						end;
					else
						I0 = I0 - 7;
					end;
				else
					I0 = I0 + 5;
				end;
			end;
		M0[M] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 77) / 2) * z0((A0 * (T0 + 77)) / 2) ^ 2) + (3 * (T0 + 77) + 1) * i0((A0 * (T0 + 77)) / 2) ^ 2) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						K0 = true;
						if X == 0 then
							o0 = {};
							return;
						end;
						local g = {};
						for X = 0, X - 1, 1 do
							g[X + 1] = V[y + X];
						end;
						o0 = g;
						return;
					else
						return;
					end;
				else
					return;
				end;
			end;
		M0[H] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 12, 1) == 0 and a0(T0 + 12, 1) or ((T0 + 12) + c0(T0 + 12, 1)) + 1) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						V[y] = (V[y] or 0) - (V[y + 2] or 1);
						I0 = X;
					else
						I0 = I0 - 3;
					end;
				else
					I0 = I0 + 8;
				end;
			end;
		M0[k] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 26) % 2 == 0 and l0((T0 + 26) / 2) or 3 * (T0 + 26) + 1) % 1 == 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						local y = F0[U0];
						U0 = U0 - 1;
						local g = V[y] + (V[y + 2] or 1);
						V[y] = g;
						if g <= V[y + 1] then
							V[y + 3] = g;
							I0 = X;
						end;
					else
						I0 = I0 - 2;
					end;
				else
					I0 = I0 + 6;
				end;
			end;
		M0[v] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or l0((.5 + ((T0 + 56) / 2) * z0((A0 * (T0 + 56)) / 2) ^ 2) + (3 * (T0 + 56) + 1) * i0((A0 * (T0 + 56)) / 2) ^ 2) > 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						V[u0[2]] = function(...)
								return S0(x[X + 1], y, { ... });
							end;
					else
						I0 = I0 - 7;
					end;
				else
					I0 = I0 + 10;
				end;
			end;
		M0[G] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((1 - (T0 + 32) % 2) * l0((T0 + 32) / 2) + ((T0 + 32) % 2) * (3 * (T0 + 32) + 1)) % 1 == 0 then
						d0 = false;
					else
						return;
					end;
				else
					return;
				end;
			end;
		M0[T] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 42, 1) == 0 and a0(T0 + 42, 1) or ((T0 + 42) + c0(T0 + 42, 1)) + 1) > 0 then
 
					else
						I0 = I0 - 7;
					end;
				else
					I0 = I0 + 8;
				end;
			end;
		M0[s] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or ((T0 + 53) % 2 == 0 and l0((T0 + 53) / 2) or 3 * (T0 + 53) + 1) % 1 == 0 then
						local X = F0[U0];
						U0 = U0 - 1;
						X.__k = u0[3];
						V[u0[2]] = O0(X);
					else
						I0 = I0 - 9;
					end;
				else
					I0 = I0 + 9;
				end;
			end;
		M0[B] = function()
				T0 = math.floor((T0 + (u0[1] or 0)) % 256);
				if Z0 or n0() then
					if Z0 or (p0(T0 + 98, 1) == 0 and a0(T0 + 98, 1) or ((T0 + 98) + c0(T0 + 98, 1)) + 1) > 0 then
						U0 = U0 + 1;
						F0[U0] = u0[2];
						local X = C0[I0];
						if X then
							u0 = X;
							T0 = bit32.bxor(T0, X[1]);
							local y = X[2] and bit32.bxor(X[2], k0) or nil;
							local g = X[3] and bit32.bxor(X[3], k0) or nil;
							X[2] = y;
							X[3] = g;
							k0 = bit32.bxor(k0, y or 0);
							U0 = U0 + 1;
							F0[U0] = u0[2];
							I0 = I0 + 1;
						end;
					else
						I0 = I0 - 2;
					end;
				else
					I0 = I0 + 1;
				end;
			end;
		local r0 = 0;
		for X in pairs(m0) do
			if type(X) == "number" and X > r0 then
				r0 = X;
			end;
		end;
		local W0 = 0;
		for X in pairs(m0) do
			if type(X) == "number" and X > W0 then
				W0 = X;
			end;
		end;
		while d0 do
			if Y0 > W0 or Y0 < 1 then
				break;
			end;
			local X = n0();
			if X == 1 then
				u0 = C0[Y0 * X];
				k0 = x0[Y0] or k0;
				T0 = bit32.bxor(T0, u0[1]);
				v0 = bit32.bxor(u0[1], k0);
				local y = u0[2] and bit32.bxor(u0[2], k0) or nil;
				local g = u0[3] and bit32.bxor(u0[3], k0) or nil;
				u0[2] = y;
				u0[3] = g;
				k0 = bit32.bxor(k0, y or 0);
				I0 = Y0 + 1;
				M0[v0]();
				if K0 then
					return table.unpack(o0);
				end;
				local m = I0;
				local J = R0[string.char(103, 101, 116, 109, 101, 116, 97, 116, 97, 98, 108, 101)];
				local b = R0[string.char(116, 121, 112, 101)];
				local R = R0[string.char(112, 99, 97, 108, 108)];
				local L = R0[string.char(105, 115, 99, 99, 108, 111, 115, 117, 114, 101)] or function()
						return true;
					end;
				local q = b(J) == string.char(102, 117, 110, 99, 116, 105, 111, 110) and J(C0) or "nil";
				local l = b(J) == string.char(102, 117, 110, 99, 116, 105, 111, 110) and J(M0) or "nil";
				local z = (q == "dslmg" and (l == string.char(76, 111, 99, 107, 101, 100) and L(R))) and 1 or 0;
				local i = (1 - z) * 72406;
				local A = z * 83576;
				local p = 18953;
				while bit32.bxor(p, 85878) ~= 0 do
					if p == 43068 then
						local X = b(L0) == string.char(116, 97, 98, 108, 101) and 1 or 0;
						Y0 = Y0 * X;
						p = bit32.bxor(p, 129251);
					elseif p == 86239 then
						Y0 = math.random(1, 99999);
						T0 = bit32.bxor(T0, 57005);
						p = bit32.bxor(p, 8105);
					elseif p == 67463 then
						Y0 = bit32.bxor(T0, 123);
						p = bit32.bxor(p, 110523);
					elseif p == 19831 then
						Y0 = bit32.bxor(_cz, T0);
						p = bit32.bxor(p, 66049);
					elseif p == 68721 then
						_cz = bit32.bxor(bit32.bxor(m, 504), bit32.bxor(T0, 504));
						p = bit32.bxor(p, 116876);
					elseif p == 50429 then
						local X = bit32.bxor(T0, T0) == 0 and 1 or 0;
						p = bit32.bxor(p, X * 35210 + (1 - X) * 103458);
					elseif p == 18953 then
						p = bit32.bxor(p, bit32.bor(i, A));
					end;
				end;
			else
				Y0 = Y0 + (math.random(1, 2) == 1 and 0 or 1);
			end;
		end;
	end;
	S0(J0, m0, {});
end;