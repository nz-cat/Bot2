--// This file was created by XHider v1.2 [https://discord.gg/hATuHQaQRb]

return (function()
	local L, j;
	do
		local O = 127;
		local g = 255;
		local z = function(L)
				return L;
			end;
		local C = {};
		for L = 0, 255, 1.0 do
			C[L] = {};
			for j = 0, 255.0, 1.0 do
				C[L][j] = .0;
			end;
		end;
		local t = false;
		if not t then
			for L = 0, 7, 1 do
				C[0][0] = C[0][0] + 0;
			end;
			t = true;
		end;
		local x = {
				33,
				64.0,
				35,
				36.0,
			};
		local h = {
				37.0,
				94.0,
				38.0,
				42,
			};
		local Y = {
				40,
				41.0,
				95.0,
				43,
			};
		local A = {
				45,
				61.0,
				91.0,
				93.0,
			};
		local m = function()
				local L = 0;
				for j = 1.0, 4, 1 do
					L = (((L + #x) + #h) + #Y) + #A;
				end;
				return L > 0;
			end;
		if not m() then
 
		end;
		local W = {};
		local w = 1;
		for L, j in ipairs({
			x,
			h,
			Y,
			A,
		}) do
			for L = 1.0, #j, 1 do
				W[w] = string.char(j[L]);
				w = w + 1;
			end;
		end;
		W = table.concat(W);
		local b = 87;
		local d = 88.0;
		local N = b + d;
		local function I(L, j)
			if C[L] and (C[L][j] and C[L][j] ~= 0) then
				return C[L][j];
			end;
			local O = 0;
			for g = 0, 7, 1 do
				local z = L / 2.0 + j / 2.0;
				if z ~= math.floor(z) then
					O = O + 2.0 ^ g;
				end;
				L = math.floor(L / 2.0);
				j = math.floor(j / 2.0);
			end;
			if L < 256.0 and j < 256 then
				C[L] = C[L] or {};
				C[L][j] = O;
			end;
			return O;
		end;
		local F = {};
		for L = 1.0, #W, 1.0 do
			F[string.sub(W, L, L)] = L - 1.0;
		end;
		local function D(L)
			return F[L] or 0;
		end;
		local G = "-(-#-[=+---*|]&-!=_(][[==-_(][$-!=-=+([|==-[-@-+-!-#|---!-@---[=+|=_-@=]-[---%|-$=&=^=_==[$-@-=|[$[)-$|)^(*(_-+(^(&)^|)^|==[!)=-)[!-[]][*])|]=)*[$]+-(]*)[[^[@[-)[[))*|-$-!=)-_(]=_|[)=_---%(]]_|[--!-@-(==-[=+=_-$-[=+-&-!-@=-(]-!-@(]=&-!=_==(]=-=_-----_=-=-([|-(-_=+-&-@-)-!|]!]!-&-@-+-_=*|]!]!-@-_=(-&-@-+-_=*|]!]!-#-_=+-[=+-[-=-$-_|]!]!-(--|]!]!-#-!-+-_|-%|]!]!---[-$-$|]!]!-$-_-@|]!]!=]-[-&===-|]!]!-&=]-[-&===-|]!]!-+-_-==_-(|]!]!=+-!=-=+==-&-@-(|]!]!---!-@---[=+|]!]!=_-@-#|]!]!-[-+-+|]!]!=-=_-=|]!]!-#=_-$|]!]!-+-&=)|]!]!-#-!-+|]!]!=]-!=(|]!]!-_=[|]!]!-$=+|]!]!-$-_|-)=_-@--=+-&-!-@|]+-*-&=-(]-#-_=+-[=+-[-=-$-_(]-&=-(]-$-!---%-_-+(@|-!=-|-&-!|-)-&-$-_|-+-_-==_-(|-(-_=+-*-!-!-%|---$-!---%|=+-&-#-_|-&-@=--_===+|]-|=(-*-[=+|[-|-(-_=+=_=]=)-[-$=_-_|==-_=+=_==-@(])[(%)[|==-[-@-+-!-#]-=+==-&-@-(|_=_]_]_[_]_]+@_]_]+[_]_]_]_]_]_]_^_]_]_]_!_]_]_]+&_]_]_](]_]_]_](__]_]_](@_]_]_])(_]_]_][]_]_]_][&_]_]_]]=_]_]_]]%_]_]_]-(_]_]_]=)_]_]_]&+_]_]_]*]_]_]_]%&_]_]_]-!_]_]%_&)*^%**]*)($@)[+_[_]_])+=$!**&*]=$$_*+(%_=_]_]^]*)+$$)^)_*#&+[+)-+]@)(#&&]$(@[^]%^)^^&^)!]$=(-[+_=_]_]&)_[_]_]](-^[^^)&[_[_]_]%[+^_%$$%[)$!#_(])+__]_]!@+__]_][+_-_]_])+-+[[-!*]#)!$_([+_+_]_]^])@_&#]^)]+___#+)[]!#@(-]+)()*(=^$+]*%+(+_=_!^(*]%+&=)_()(+@#^+[+___]_]]+$*+!^^-^&)-=#*[+_)_]_]]+(]!=]--^$@%&@[[+_(_]_]]+-+!=&=-^+)!)])[+_*_]_]]+-=)!%!-^-]+])#[+_&_]_]]+)*+@#%-^&)@%[+[+_^_]_]]+!^]%$*-^-^++[*^](^=*&&^)$]%%!=[+_=_]_]&)_[_]_]](-]#)+[&[_[_]_][+_%_]_])+-*]^$#[+_$_]_]^_)+-++!^_]]_-*[%[]+[)*_])-__]_]$-!^)&&![+_#_]_])+)@]@=%*]_@+*^%[+_%_]_])+&=%=&[&*(^_#_([+_@_]_]^]+=[-[*^)^*%)^[][_[_]&$[+_!_]_]&%]**-%+][_[_]%#](-=#&&-][_[_]*)+)$=(*!_#&!=+-*_^]+)@#+^^)++=]$)+)-**&%@$(%+$(%^*]@^-&&$^]_]!!--^)@+)&[(+)$+!*@&-]+@^==&[+_-_]_])+^==[%_*]_^*%-=[++]_]_]^]^+__#$^)=$&^@^+)%@+]@]-]#^((#)!=_$[#)^!@-!_]_]$-+]-^)#[+_-_]_])+[])!-(*]*+^@@*[++[_]_]^]!*=$$+^)(^^*&=+)=*(]=@-]+^=-#(!=-=$^=_=^+)+&@]_]___]_]_]=]---[-$-$_[_[_]_]_]_]___]_]_]=]==-&-@=+_]_=_]_]_]-*-&_[$#-^(_!+_-[=*-]!^&@)[=]=&]_-[[^]#$=%+%=]_]_]_-[=*[^%@@)*(@]@[]_-[[^%&]]=^[)]_]_]_-[=*)&-$*=#[)%+[]_]_+_]_]_]-(-[-#-__]_(_]_]_]]]-$-[---_[&-+_]_^_]_]_]-$-!-[-+=-=+==-&-@-(_][&_]_]_]-*=+=+=]=-)^(!(!-(-&=+-*=_-=(@---!-#(!]+-$[+-&-@-*[%-*-!-&(!]_=+-&-$(!==-[=((!==-_-)=-(!-*-_-[-+=-(!-#-[-&-@(![@-!=+-&-)=&[=-$-!=*[%-&-+(@-$=_-[=__]_(_]_]_][*=+=+=][(-_=+_]++_]_]_]]*-*-&-+-_==)^(]===_-@(]=-=_-----_=-=-([_]_$_]_]_]]*-*-&-+-_==)^(]=--%-&=]|-$-+-_=*=]|-)-$-!-!==|-$||-==&=+-_|---*-[==|";
		local y = {};
		local Z = 0;
		local function l(L)
			Z = Z + 1;
			if y[L] then
				return y[L];
			end;
			local j = {};
			local O = L + 1.0;
			while O <= #G do
				local L = string.sub(G, O, O);
				if L == "|" then
					break;
				end;
				local g = D(L);
				local z = D(string.sub(G, O + 1, O + 1.0));
				local C = g * 16 + z;
				local t = I(C, N);
				j[#j + 1] = string.char(t);
				O = O + 2.0;
			end;
			local g = table.concat(j);
			y[L] = g;
			return g;
		end;
		local v = true;
		L = setmetatable({}, { __index = function(L, j)
					if not v then
 
					end;
					return l(j);
				end, __metatable = "locked", __newindex = function()
 
				end });
		function j(L)
			if type(L) ~= "number" then
 
			end;
			return L;
		end;
		if Z < 0 then
 
		end;
	end;
	do
		local O = true;
		local g = string[L[j(0)]];
		local z = function()
				error(L[j(13.0)]);
			end;
		local C = false;
		local t = pcall(function()
				C = true;
			end) and C;
		local x = math[L[j(40.0)]];
		local h = table[L[j(53)]];
		local Y = table and table[L[j(66)]] or unpack;
		local A = x(3, 65.0);
		local m = 0;
		local W = 0;
		local w = { pcall(function()
					local O = 6248961.0 - L[j(79.0)] ^ 16158209;
					return L[j(96)] / O;
				end) };
		local b = w[2];
		local d = tonumber((g(tostring(b), L[j(103)]))());
		for z = 1, A, 1.0 do
			local C = math[L[j(40.0)]](1, 100.0);
			local t = x(.0, 255.0);
			local h = x(1.0, C);
			local w = x(1.0, 2) == 1;
			local N = b:gsub(L[j(103.0)], L[j(118.0)] .. (tostring(x(0, 10000.0)) .. L[j(118.0)]));
			local I = { pcall(function()
						if x(1, 2) == 1.0 or z == A then
							local z = tonumber((g(tostring(({ pcall(function()
										local O = 2295297.0 - L[j(121.0)] ^ 8966145.0;
										return L[j(140)] / O;
									end) })[2.0]), L[j(103)]))());
							O = O and d == z;
						end;
						if w then
							error(N, 0);
						end;
						local m = {};
						for L = 1.0, C, 1 do
							m[L] = x(0, 255.0);
						end;
						m[h] = t;
						return Y(m);
					end) };
			if w then
				O = O and (I[1] == false and I[2] == N);
			else
				O = O and I[1.0];
				m = (m + I[h + 1.0]) % 256.0;
				W = (W + t) % 256;
			end;
		end;
		O = O and m == W;
		if O then
 
		else
			repeat
				return (function()
					while true do
						l1, l2 = l2, l1;
						z();
					end;
				end)();
			until true;
			while true do
				l2 = x(1.0, 6);
				if l2 > 2.0 then
					l2 = tostring(l1);
				else
					l1 = l2;
				end;
			end;
			return;
		end;
	end;
	do
		local O = true;
		local function g()
			print(L[j(167)]);
			pcall(function(O, g, z, C)
				(getgenv())[L[j(180.0)]] = function(L, j, O, g)
 
					end;
			end);
			pcall(function()
				error(L[j(193.0)], 0);
			end);
			local O = {};
			while true do
				O[#O + 1] = 0;
				for L = 1.0, 100000000.0, 1 do
 
				end;
				repeat
 
				until false;
			end;
		end;
		local z = error;
		local C = pairs;
		local t = setmetatable;
		local x = getmetatable;
		local h = type;
		local Y = load;
		local A = loadstring;
		local m = pcall;
		local W = math[L[j(40.0)]];
		local w = xpcall;
		local b = debug;
		local d = debug and debug[L[j(258.0)]] or nil;
		local N = package;
		local I = coroutine;
		local F = string;
		local D = math;
		local G = table;
		local y = os;
		local Z = io;
		local l = file;
		local v = {};
		local E = {};
		for L, j in C(_G) do
			E[L] = j;
		end;
		local function r(O)
			local z = {
					[L[j(273.0)]] = O,
					[L[j(288.0)]] = function(L, j, O)
						if E[j] then
							g();
						else
							E[j] = O;
						end;
					end,
					[L[j(309.0)]] = false,
					[L[j(332)]] = function()
						g();
					end,
					[L[j(341)]] = L[j(354)],
					[L[j(357)]] = function()
						g();
					end,
					[L[j(370)]] = function()
						g();
					end,
					[L[j(381.0)]] = function()
						g();
					end,
					[L[j(396)]] = function()
						g();
					end,
					[L[j(413)]] = function()
						g();
					end,
					[L[j(428.0)]] = function()
						g();
					end,
					[L[j(449.0)]] = function()
						g();
					end,
					[L[j(466.0)]] = function()
						g();
					end,
					[L[j(477.0)]] = function()
						g();
					end,
					[L[j(488.0)]] = function()
						g();
					end,
					[L[j(499)]] = function()
						g();
					end,
					[L[j(510.0)]] = function()
						g();
					end,
					[L[j(521)]] = function()
						g();
					end,
					[L[j(532)]] = function()
						g();
					end,
					[L[j(543)]] = function()
						g();
					end,
					[L[j(552)]] = function()
						g();
					end,
					[L[j(561.0)]] = function()
						g();
					end,
				};
			return t({}, z);
		end;
		function v.protectGlobals()
			for O, g in C(_G) do
				if h(g) == L[j(570)] then
					E[O] = g;
				end;
			end;
			_G = r(E);
			t(_G, { [L[j(309)]] = L[j(587.0)] });
		end;
		function v.protectTable(L)
			return r(L);
		end;
		function v.protectFunction(O)
			local z = function(...)
					return O(...);
				end;
			return t({}, {
				[L[j(273.0)]] = function(O, C)
					if C == L[j(357)] then
						return z;
					else
						g();
					end;
				end,
				[L[j(288.0)]] = function(L, j, O)
					g();
				end,
				[L[j(309)]] = false,
				[L[j(332.0)]] = function()
					g();
				end,
				[L[j(341)]] = L[j(354.0)],
				[L[j(357.0)]] = function()
					g();
				end,
				[L[j(370.0)]] = function()
					g();
				end,
				[L[j(381.0)]] = function()
					g();
				end,
				[L[j(396.0)]] = function()
					g();
				end,
				[L[j(413.0)]] = function()
					g();
				end,
			});
		end;
		if error ~= z or pairs ~= C or setmetatable ~= t or getmetatable ~= x or type ~= h or load ~= Y or loadstring ~= A or pcall ~= m or xpcall ~= w or debug ~= b or package ~= N or coroutine ~= I or string ~= F or math ~= D or table ~= G then
			g();
		end;
		if pcall ~= m or math[L[j(40.0)]] ~= W then
			g();
		end;
		local S = {
				L[j(638.0)],
				L[j(643.0)],
				L[j(648.0)],
				L[j(657.0)],
			};
		for L, j in ipairs(S) do
			if _G[j] ~= E[j] then
				g();
			end;
		end;
		local J, U = pcall(b[L[j(668)]]);
		if J then
			if U then
				g();
			end;
		end;
		local B = string[L[j(0)]];
		local X, e = pcall(main);
		for L, j in ipairs(S) do
			if getmetatable(_G[j]) ~= getmetatable(E[j]) then
				g();
			end;
		end;
		if b and d then
			local O = { C, y[L[j(683)]] or y[L[j(694.0)]], G[L[j(703)]] };
			for O, z in C(O) do
				if z then
					local O = d(z, L[j(716)]);
					if O and O[L[j(719)]] ~= L[j(728.0)] then
						g();
					end;
				end;
			end;
			local z = d(1, L[j(716.0)]);
			if not z then
				g();
			end;
			local t = d(C, L[j(716.0)]);
			local x = d(function()
 
				end, L[j(716.0)]);
			if t[L[j(719.0)]] == x[L[j(719)]] then
				g();
			end;
		end;
		do
			local O = typeof ~= nil;
			local z = loadstring or load;
			local C = load;
			local t = A or Y;
			if z ~= nil or t ~= nil then
				if z ~= t then
					g();
				end;
			end;
			if C ~= nil or Y ~= nil then
				if C ~= Y then
					g();
				end;
			end;
			if not O and (b and d) then
				if z ~= nil then
					local O = d(z, L[j(716)]);
					if O and O[L[j(719)]] ~= L[j(728.0)] then
						g();
					end;
				end;
				if C ~= nil then
					local O = d(C, L[j(716.0)]);
					if O and O[L[j(719)]] ~= L[j(728.0)] then
						g();
					end;
				end;
			end;
			if b and b[L[j(731.0)]] then
				if z ~= nil then
					local O, C = m(b[L[j(731)]], z, 1.0);
					if O and C ~= nil then
						g();
					end;
				end;
				if C ~= nil then
					local O, z = m(b[L[j(731.0)]], C, 1.0);
					if O and z ~= nil then
						g();
					end;
				end;
			end;
			local h = z or C;
			if h ~= nil then
				local O = L[j(752.0)];
				local z, C = h(O);
				if type(z) ~= L[j(570.0)] then
					g();
				end;
				local t, x = m(z);
				if not t or x ~= 2 then
					g();
				end;
			end;
			if z ~= nil and x(z) ~= nil then
				g();
			end;
			if C ~= nil and x(C) ~= nil then
				g();
			end;
			if O then
				if iscclosure then
					if z ~= nil and not iscclosure(z) then
						g();
					end;
					if C ~= nil and not iscclosure(C) then
						g();
					end;
				end;
				if checkclosure then
					if z ~= nil and not checkclosure(z) then
						g();
					end;
					if C ~= nil and not checkclosure(C) then
						g();
					end;
				end;
			end;
		end;
		local R = false;
		local a = m(function()
				R = true;
			end) and R;
		local o = math[L[j(40.0)]];
		local k = table[L[j(53)]];
		local c = table and table[L[j(66.0)]] or unpack;
		n = W(3.0, 65.0);
		if n < 3.0 or n > 65.0 then
			local O = o(1, 16777216.0) - RandomStrings[L[j(773)]]() ^ o(1, 16777216.0);
			return RandomStrings[L[j(773.0)]]() / O;
		end;
		local p = 0;
		local T = 0;
		local P = { pcall(function()
					local O = o(1, 16777216.0) - RandomStrings[L[j(773)]]() ^ o(1, 16777216.0);
					return RandomStrings[L[j(773)]]() / O;
				end) };
		local u = P[2.0];
		local i = tonumber((B(tostring(u), L[j(103.0)]))());
		for g = 1, 100.0, 1.0 do
			local z = 100.0;
			local C = g % 256.0;
			local t = g % z + 1.0;
			local x = g % 2.0 == 0;
			local h = u:gsub(L[j(103.0)], L[j(118.0)] .. (tostring(o(0, 10000.0)) .. L[j(118.0)]));
			local Y = { pcall(function()
						if o(1, 2) == 1 or g == n then
							local g = tonumber((B(tostring(({ pcall(function()
										local O = o(1, 16777216.0) - RandomStrings[L[j(773)]]() ^ o(1.0, 16777216.0);
										return RandomStrings[L[j(773)]]() / O;
									end) })[2.0]), L[j(103)]))());
							O = O and i == g;
						end;
						if x then
							error(h, 0);
						end;
						local Y = {};
						for L = 1.0, z, 1.0 do
							Y[L] = o(0, 255);
						end;
						Y[t] = C;
						return c(Y);
					end) };
			if x then
				O = O and (Y[1] == false and Y[2.0] == h);
			else
				O = O and Y[1.0];
				p = (p + Y[t + 1.0]) % 256.0;
				T = (T + C) % 256.0;
			end;
		end;
		O = O and p == T;
		if O then
 
		else
			repeat
				return (function()
					g();
				end)();
			until true;
			return;
		end;
	end;
	local O, g, z, C, t, x, h, Y, A, m, W, w, b, d, N, I, F, D, G, y, Z, l;
	Y = getfenv or function()
			return _ENV;
		end;
	Z = function(L, j, O)
			return function(...)
				return b(F(L, { ... }, j, O));
			end;
		end;
	d = L[j(798)];
	w = math[L[j(2353)]];
	m = function()
			x = t(1, 3);
			C = {};
			for L = 0, x - 1, 1.0 do
				C[L + 1] = t(z + L * 3.0, 3);
			end;
			z = z + x * 3.0;
			O = t(z, 3.0);
			for L = 0, O - 1, 1 do
				A[L + 1.0] = t((z + 3.0) + L * 4, 4.0);
			end;
			z = (z + O * 4.0) + 6.0;
			G = t(z - 3.0, 3.0);
			W = z + G * 4.0;
		end;
	g = function(L)
			local j = {};
			for O = 1, #L, 1 do
				j[O] = h(L, O);
			end;
			return j;
		end;
	b = table and table[L[j(66)]] or unpack;
	z = 4;
	N = math[L[j(2364)]];
	F = function(O, g, x, h)
			local Y = { [0] = h };
			local m = {};
			local w = 0;
			local N, F, G, l, v, E;
			F = z + (O - 1) * 4;
			N = d[F];
			while true do
				G = true;
				while N == 200 do
					m[L[j(2375)]] = w;
					m = { [0] = m, [1.0] = m[w] };
					w = 1.0;
					O = O + 1;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 246 do
					if w > 0 then
						l = m[w];
					else
						l = nil;
					end;
					m = m[0];
					w = m[L[j(2375.0)]] + 1;
					m[w] = l;
					O = O + 1;
					F = z + (O - 1) * 4;
					N = d[F];
					G = false;
				end;
				while N == 203 do
					m[w] = m[w - 1][m[w]];
					O = O + 1.0;
					F = z + (O - 1.0) * 4;
					N = d[F];
					G = false;
				end;
				while N == 245.0 do
					w = w - 1;
					m[w], m[w + 1] = m[w][m[w + 1.0]], nil;
					O = O + 1.0;
					F = z + (O - 1.0) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 87.0 do
					w = w - 1;
					m[w + 1] = nil;
					O = O + 1.0;
					F = z + (O - 1.0) * 4;
					N = d[F];
					G = false;
				end;
				while N == 106 do
					w = w - 2.0;
					m[w][m[w + 1]] = m[w + 2.0];
					m[w + 1], m[w + 2.0] = nil, nil;
					O = O + 1;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 122.0 do
					return {};
				end;
				while N == 208.0 do
					m[L[j(2375)]] = w;
					w = 0;
					m = { [0] = m };
					O = O + 1;
					F = z + (O - 1.0) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 81 do
					l = t(F + 1, 2.0);
					m[w], m[w - l] = m[w - l], m[w];
					O = O + 1;
					F = z + (O - 1) * 4;
					N = d[F];
					G = false;
				end;
				while N == 38 do
					w = w + 1.0;
					m[w] = {};
					O = O + 1.0;
					F = z + (O - 1.0) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 96 do
					m = { [0] = m[0] };
					w = 0;
					O = O + 1;
					F = z + (O - 1.0) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 84 do
					m[w + 1.0] = true;
					w = w + 1;
					O = O + 1.0;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 151 do
					m[w] = m[w][1];
					O = O + 1.0;
					F = z + (O - 1) * 4;
					N = d[F];
					G = false;
				end;
				while N == 68 do
					E = t(F + 1, 3);
					w = w + 1;
					m[w] = D[E];
					if not m[w] then
						l = A[E] + W;
						v = d[l];
						if v == 0 then
							v = t(l + 1.0, 4);
							m[w] = L[j(2378)];
							for L = 1, v, 1 do
								m[w] = m[w] .. I(d[(l + L) + 4]);
							end;
						elseif v == 3.0 then
							m[w] = y(l + 1);
						elseif v == 1.0 then
							m[w] = t(l + 1.0, 4.0);
						elseif v == 2.0 then
							m[w] = -t(l + 1, 4.0);
						end;
						D[E] = m[w];
					end;
					O = O + 1.0;
					F = z + (O - 1.0) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 52 do
					m[w] = x[m[w]];
					O = O + 1;
					F = z + (O - 1.0) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 162 do
					Y = Y[0];
					O = O + 1;
					F = z + (O - 1) * 4;
					N = d[F];
					G = false;
				end;
				while N == 193.0 do
					l = Y;
					for L = 1, d[F + 3.0], 1.0 do
						l = l[0];
					end;
					m[w + 1] = l[t(F + 1.0, 2.0)];
					w = w + 1;
					O = O + 1.0;
					F = z + (O - 1) * 4;
					N = d[F];
					G = false;
				end;
				while N == 174.0 do
					O = t(F + 1, 3) - 1;
					O = O + 1;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 198 do
					l = Y;
					for L = 1.0, d[F + 3.0], 1 do
						l = l[0];
					end;
					l[t(F + 1.0, 2.0)] = m[w - 1][m[w]];
					m[w] = nil;
					w = w - 1;
					O = O + 1.0;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 22.0 do
					w = w - 1;
					m[w], m[w + 1] = { m[w](b(m[w + 1])) }, nil;
					O = O + 1;
					F = z + (O - 1.0) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 147 do
					Y = { [0] = Y };
					O = O + 1.0;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 86.0 do
					if m[w] then
						O = t(F + 1, 3.0) - 1;
					end;
					m[w] = nil;
					w = w - 1;
					O = O + 1.0;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 43 do
					w = w + 1;
					m[w] = Z(C[t(F + 1, 3.0)], x, Y);
					O = O + 1;
					F = z + (O - 1) * 4;
					N = d[F];
					G = false;
				end;
				while N == 240.0 do
					l = {};
					for L, j in ipairs(m) do
						l[L] = j;
					end;
					w = 1;
					m = { [0] = m[0], [1] = l };
					O = O + 1;
					F = z + (O - 1) * 4.0;
					N = d[F];
					G = false;
				end;
				while N == 225.0 do
					m[w] = not m[w];
					O = O + 1;
					F = z + (O - 1) * 4;
					N = d[F];
					G = false;
				end;
				while N == 137 do
					l, m[w] = m[w], nil;
					for L, j in ipairs(l) do
						m[w] = j;
						w = w + 1.0;
					end;
					w = w - 1.0;
					O = O + 1;
					F = z + (O - 1.0) * 4;
					N = d[F];
					G = false;
				end;
				if G then
					O = O + 1;
					F = z + (O - 1) * 4.0;
					N = d[F];
				end;
			end;
		end;
	D = {};
	A = {};
	y = function(L)
			local j = {};
			for O = 0, 7, 1 do
				j[O + 1.0] = d[L + O];
			end;
			local O = 1;
			local g = j[2.0] % 16.0;
			for L = 3.0, 8, 1 do
				g = g * 256.0 + j[L];
			end;
			if j[1] > 127 then
				O = -1;
			end;
			local z = (j[1] % 128) * 16 + N(j[2.0] / 16);
			if z == 0 then
				return 0;
			end;
			g = (w(g, -52.0) + 1.0) * O;
			return w(g, z - 1023.0);
		end;
	t = function(L, j)
			local O = .0;
			local g = 1;
			for j = 0, j - 1, 1 do
				O = O + d[L + j] * g;
				g = g * 256;
			end;
			return O;
		end;
	l = function()
			d = g(d);
			m();
			return (Z(C[1.0], Y()))();
		end;
	C = {};
	h = string[L[j(2379.0)]];
	I = string[L[j(2388)]];
	return l();
end)();