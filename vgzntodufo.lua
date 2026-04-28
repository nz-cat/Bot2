--// This file was created by XHider v1.2 [https://discord.gg/hATuHQaQRb]

return (function(...)
	local Z, F, P = table, string, bit;
	local r, s, S, w, K, A, h, V, x, e, j = F.byte, F.char, F.sub, Z.concat, Z.insert, math.ldexp, getfenv and getfenv() or _ENV, setmetatable, select, unpack or Z.unpack, tonumber;
	local k = (function(F)
			local P, w, K, A, h, V, x = 1, function(Z)
					local F = "";
					for P = 1, #Z, 1 do
						F = F .. s(r(Z, P) - 25);
					end;
					return j(F, 36);
				end, "", "", {}, 256, {};
			for Z = 0, V - 1, 1 do
				x[Z] = s(Z);
			end;
			local function e()
				local Z = w(S(F, P, P));
				P = P + 1;
				local r = w(S(F, P, (P + Z) - 1));
				P = P + Z;
				return r;
			end;
			K = s(e());
			h[1] = K;
			while P < #F do
				local Z = e();
				if x[Z] then
					A = x[Z];
				else
					A = K .. S(K, 1, 1);
				end;
				x[V] = K .. S(A, 1, 1);
				h[#h + 1], K, V = A, A, V + 1;
			end;
			return Z.concat(h);
		end)("KLeKLgKPNKLgKLjKPOKOkKOiKObKOeKOoKLgKLfKPOKOZKPOKPNKLkKPOKMJKPcKP`KPNKMJKP`KP`KPMKPOKPQKPNKPMKPiKLdKPOKPiKLg");
	local n, D, f, v = 1, P and P.bxor or function(Z, F)
			local P, r = 1, 0;
			while Z > 0 and F > 0 do
				local s, S = Z % 2, F % 2;
				if s ~= S then
					r = r + P;
				end;
				Z, F, P = (Z - s) / 2, (F - S) / 2, P * 2;
			end;
			if Z < F then
				Z = F;
			end;
			while Z > 0 do
				local F = Z % 2;
				if F > 0 then
					r = r + P;
				end;
				Z, P = (Z - F) / 2, P * 2;
			end;
			return r;
		end, 131, function(Z, F, P)
			if P then
				local r = (Z / 2 ^ (F - 1)) % 2 ^ (((P - 1) - (F - 1)) + 1);
				return r - r % 1;
			else
				local P = 2 ^ (F - 1);
				return Z % (P + P) >= P and 1 or 0;
			end;
		end;
	local E, g, Y = function()
			local Z, F, P, s = r(k, n, n + 3);
			Z, F, P, s = D(Z, f), D(F, f), D(P, f), D(s, f);
			n = n + 4;
			return ((s * 16777216 + P * 65536) + F * 256) + Z;
		end, function()
			local Z = D(r(k, n, n), f);
			n = n + 1;
			return Z;
		end, function()
			local Z, F = r(k, n, n + 2);
			Z, F = D(Z, f), D(F, f);
			n = n + 2;
			return F * 256 + Z;
		end;
	local function u()
		local Z = E();
		local F = E();
		local P = 1;
		local r = v(F, 1, 20) * 4294967296.0 + Z;
		local s = v(F, 21, 31);
		local S = -1 ^ v(F, 32);
		if s == 0 then
			if r == 0 then
				return S * 0;
			else
				s = 1;
				P = 0;
			end;
		elseif s == 2047 then
			return r == 0 and S * (1 / 0) or S * (0 / 0);
		end;
		return A(S, s - 1023) * (P + r / 4.5035996273705e+015);
	end;
	local z, B = E, function(Z)
			local F;
			if not Z then
				Z = E();
				if Z == 0 then
					return "";
				end;
			end;
			F = S(k, n, (n + Z) - 1);
			n = n + Z;
			local P = {};
			for Z = 1, #F, 1 do
				P[Z] = s(D(r(S(F, Z, Z)), 131));
			end;
			return w(P);
		end;
	local R, p = E, function(...)
			return { ... }, x("#", ...);
		end;
	local function J()
		local Z, F, P = {}, {}, {};
		local r = {
				Z,
				F,
				nil,
				P,
			};
		local s, S = E(), {};
		for Z = 1, s, 1 do
			local F, P = g();
			if F == 3 then
				P = g() ~= 0;
			elseif F == 1 then
				P = u();
			elseif F == 0 then
				P = B();
			end;
			S[Z] = P;
		end;
		r[3] = g();
		for Z = 1, E(), 1 do
			F[Z - 1] = J();
		end;
		for F = 1, E(), 1 do
			local P = g();
			if v(P, 1, 1) == 0 then
				local r, s, w = v(P, 2, 3), v(P, 4, 6), {
						Y(),
						Y(),
						nil,
						nil,
					};
				if r == 0 then
					w[3] = Y();
					w[4] = Y();
				elseif r == 1 then
					w[3] = E();
				elseif r == 2 then
					w[3] = E() - 65536.0;
				elseif r == 3 then
					w[3] = E() - 65536.0;
					w[4] = Y();
				end;
				if v(s, 1, 1) == 1 then
					w[2] = S[w[2]];
				end;
				if v(s, 2, 2) == 1 then
					w[3] = S[w[3]];
				end;
				if v(s, 3, 3) == 1 then
					w[4] = S[w[4]];
				end;
				Z[F] = w;
			end;
		end;
		return r;
	end;
	local function L(Z, F, P)
		local r, s, S = Z[1], Z[2], Z[3];
		return function(...)
			local Z, F, w, K, A, h, V, e, j, k, n = r, s, S, p, 1, -1, {}, { ... }, x("#", ...) - 1, {}, {};
			for Z = 0, j, 1 do
				if Z >= w then
					V[Z - w] = e[Z + 1];
				else
					n[Z] = e[Z + 1];
				end;
			end;
			local D = (j - w) + 1;
			local f;
			local v;
			while true do
				f = Z[A];
				v = f[1];
				if v <= 3 then
					if v <= 1 then
						if v > 0 then
							n[f[2]] = f[3];
						else
							n[f[2]] = P[f[3]];
						end;
					elseif v > 2 then
						do
							return;
						end;
					else
						do
							return;
						end;
					end;
				elseif v <= 5 then
					if v == 4 then
						n[f[2]] = f[3];
					else
						local Z = f[2];
						n[Z](n[Z + 1]);
					end;
				elseif v == 6 then
					n[f[2]] = P[f[3]];
				else
					local Z = f[2];
					n[Z](n[Z + 1]);
				end;
				A = A + 1;
			end;
		end;
	end;
	return (L(J(), {}, h))(...);
end)(...);