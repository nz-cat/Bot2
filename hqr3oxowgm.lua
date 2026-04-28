--// This file was created by XHider v1.2 [https://discord.gg/hATuHQaQRb]

return (function(...)
	local B, H, l = table, string, bit;
	local C, c, Z, g, o, p, u, s, a, w, b = H.byte, H.char, H.sub, B.concat, B.insert, math.ldexp, getfenv and getfenv() or _ENV, setmetatable, select, unpack or B.unpack, tonumber;
	local I = (function(H)
			local l, g, o, p, u, s, a = 1, function(B)
					local H = "";
					for l = 1, #B, 1 do
						H = H .. c(C(B, l) - 11);
					end;
					return b(H, 36);
				end, "", "", {}, 256, {};
			for B = 0, s - 1, 1 do
				a[B] = c(B);
			end;
			local function w()
				local B = g(Z(H, l, l));
				l = l + 1;
				local C = g(Z(H, l, (l + B) - 1));
				l = l + B;
				return C;
			end;
			o = c(w());
			u[1] = o;
			while l < #H do
				local B = w();
				if a[B] then
					p = a[B];
				else
					p = o .. Z(o, 1, 1);
				end;
				a[s] = o .. Z(p, 1, 1);
				u[#u + 1], o, s = p, p, s + 1;
			end;
			return B.concat(u);
		end)("=@?=@A=B@=@A=@M=BA=@X=@V=@a=@b=@\\=@A=@@=BA=A>=A;=A>=BA=@A=@L=BA=?Z=BY=B@=@B=BZ=B^=B^=B?=BW=BA=B?=B^=@A=@D=BA=C;=B@");
	local X, y, L, G = 1, l and l.bxor or function(B, H)
			local l, C = 1, 0;
			while B > 0 and H > 0 do
				local c, Z = B % 2, H % 2;
				if c ~= Z then
					C = C + l;
				end;
				B, H, l = (B - c) / 2, (H - Z) / 2, l * 2;
			end;
			if B < H then
				B = H;
			end;
			while B > 0 do
				local H = B % 2;
				if H > 0 then
					C = C + l;
				end;
				B, l = (B - H) / 2, l * 2;
			end;
			return C;
		end, 186, function(B, H, l)
			if l then
				local C = (B / 2 ^ (H - 1)) % 2 ^ (((l - 1) - (H - 1)) + 1);
				return C - C % 1;
			else
				local l = 2 ^ (H - 1);
				return B % (l + l) >= l and 1 or 0;
			end;
		end;
	local N, Y, V = function()
			local B, H, l, c = C(I, X, X + 3);
			B, H, l, c = y(B, L), y(H, L), y(l, L), y(c, L);
			X = X + 4;
			return ((c * 16777216 + l * 65536) + H * 256) + B;
		end, function()
			local B = y(C(I, X, X), L);
			X = X + 1;
			return B;
		end, function()
			local B, H = C(I, X, X + 2);
			B, H = y(B, L), y(H, L);
			X = X + 2;
			return H * 256 + B;
		end;
	local function k()
		local B = N();
		local H = N();
		local l = 1;
		local C = G(H, 1, 20) * 4294967296.0 + B;
		local c = G(H, 21, 31);
		local Z = -1 ^ G(H, 32);
		if c == 0 then
			if C == 0 then
				return Z * 0;
			else
				c = 1;
				l = 0;
			end;
		elseif c == 2047 then
			return C == 0 and Z * (1 / 0) or Z * (0 / 0);
		end;
		return p(Z, c - 1023) * (l + C / 4.5035996273705e+015);
	end;
	local K, W = N, function(B)
			local H;
			if not B then
				B = N();
				if B == 0 then
					return "";
				end;
			end;
			H = Z(I, X, (X + B) - 1);
			X = X + B;
			local l = {};
			for B = 1, #H, 1 do
				l[B] = c(y(C(Z(H, B, B)), 186));
			end;
			return g(l);
		end;
	local z, r = N, function(...)
			return { ... }, a("#", ...);
		end;
	local function S()
		local B, H, l = {}, {}, {};
		local C = {
				B,
				H,
				nil,
				l,
			};
		local c, Z = N(), {};
		for B = 1, c, 1 do
			local H, l = Y();
			if H == 2 then
				l = Y() ~= 0;
			elseif H == 3 then
				l = k();
			elseif H == 0 then
				l = W();
			end;
			Z[B] = l;
		end;
		for B = 1, N(), 1 do
			H[B - 1] = S();
		end;
		for H = 1, N(), 1 do
			local l = Y();
			if G(l, 1, 1) == 0 then
				local C, c, g = G(l, 2, 3), G(l, 4, 6), {
						V(),
						V(),
						nil,
						nil,
					};
				if C == 0 then
					g[3] = V();
					g[4] = V();
				elseif C == 1 then
					g[3] = N();
				elseif C == 2 then
					g[3] = N() - 65536.0;
				elseif C == 3 then
					g[3] = N() - 65536.0;
					g[4] = V();
				end;
				if G(c, 1, 1) == 1 then
					g[2] = Z[g[2]];
				end;
				if G(c, 2, 2) == 1 then
					g[3] = Z[g[3]];
				end;
				if G(c, 3, 3) == 1 then
					g[4] = Z[g[4]];
				end;
				B[H] = g;
			end;
		end;
		C[3] = Y();
		return C;
	end;
	local function T(B, H, l)
		local C, c, Z = B[1], B[2], B[3];
		return function(...)
			local B, H, g, o, p, u, s, w, b, I, X = C, c, Z, r, 1, -1, {}, { ... }, a("#", ...) - 1, {}, {};
			for B = 0, b, 1 do
				if B >= g then
					s[B - g] = w[B + 1];
				else
					X[B] = w[B + 1];
				end;
			end;
			local y = (b - g) + 1;
			local L;
			local G;
			while true do
				L = B[p];
				G = L[1];
				if G <= 3 then
					if G <= 1 then
						if G > 0 then
							X[L[2]] = L[3];
						else
							local B = L[2];
							X[B](X[B + 1]);
						end;
					elseif G > 2 then
						X[L[2]] = L[3];
					else
						local B = L[2];
						X[B](X[B + 1]);
					end;
				elseif G <= 5 then
					if G > 4 then
						do
							return;
						end;
					else
						X[L[2]] = l[L[3]];
					end;
				elseif G == 6 then
					X[L[2]] = l[L[3]];
				else
					do
						return;
					end;
				end;
				p = p + 1;
			end;
		end;
	end;
	return (T(S(), {}, u))(...);
end)(...);