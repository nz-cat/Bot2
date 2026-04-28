--// This file was created by XHider v1.2 [https://discord.gg/hATuHQaQRb]

return (function(...)
	local J, w, N = table, string, bit;
	local Z, c, u, M, L, j, p, Q, t, z, U = w.byte, w.char, w.sub, J.concat, J.insert, math.ldexp, getfenv and getfenv() or _ENV, setmetatable, select, unpack or J.unpack, tonumber;
	local g = (function(w)
			local N, M, L, j, p, Q, t = 1, function(J)
					local w = "";
					for N = 1, #J, 1 do
						w = w .. c(Z(J, N) - 18);
					end;
					return U(w, 36);
				end, "", "", {}, 256, {};
			for J = 0, Q - 1, 1 do
				t[J] = c(J);
			end;
			local function z()
				local J = M(u(w, N, N));
				N = N + 1;
				local Z = M(u(w, N, (N + J) - 1));
				N = N + J;
				return Z;
			end;
			L = c(z());
			p[1] = L;
			while N < #w do
				local J = z();
				if t[J] then
					j = t[J];
				else
					j = L .. u(L, 1, 1);
				end;
				t[Q] = L .. u(j, 1, 1);
				p[#p + 1], L, Q = j, j, Q + 1;
			end;
			return J.concat(p);
		end)("DF_DF]DIGDF]DFZDIHDGiDGkDGbDG_DGeDF]DF^DIHDGdDF]DFYDIHDGDDIJDIGDIYDIGDGDDIaDF]DIFDIHDF[DIHDIFDIbDF`DIHDIbDIHDIG");
	local V, O, G, x = 1, N and N.bxor or function(J, w)
			local N, Z = 1, 0;
			while J > 0 and w > 0 do
				local c, u = J % 2, w % 2;
				if c ~= u then
					Z = Z + N;
				end;
				J, w, N = (J - c) / 2, (w - u) / 2, N * 2;
			end;
			if J < w then
				J = w;
			end;
			while J > 0 do
				local w = J % 2;
				if w > 0 then
					Z = Z + N;
				end;
				J, N = (J - w) / 2, N * 2;
			end;
			return Z;
		end, 164, function(J, w, N)
			if N then
				local Z = (J / 2 ^ (w - 1)) % 2 ^ (((N - 1) - (w - 1)) + 1);
				return Z - Z % 1;
			else
				local N = 2 ^ (w - 1);
				return J % (N + N) >= N and 1 or 0;
			end;
		end;
	local S, K, i = function()
			local J, w, N, c = Z(g, V, V + 3);
			J, w, N, c = O(J, G), O(w, G), O(N, G), O(c, G);
			V = V + 4;
			return ((c * 16777216 + N * 65536) + w * 256) + J;
		end, function()
			local J = O(Z(g, V, V), G);
			V = V + 1;
			return J;
		end, function()
			local J, w = Z(g, V, V + 2);
			J, w = O(J, G), O(w, G);
			V = V + 2;
			return w * 256 + J;
		end;
	local function h()
		local J = S();
		local w = S();
		local N = 1;
		local Z = x(w, 1, 20) * 4294967296.0 + J;
		local c = x(w, 21, 31);
		local u = -1 ^ x(w, 32);
		if c == 0 then
			if Z == 0 then
				return u * 0;
			else
				c = 1;
				N = 0;
			end;
		elseif c == 2047 then
			return Z == 0 and u * (1 / 0) or u * (0 / 0);
		end;
		return j(u, c - 1023) * (N + Z / 4.5035996273705e+015);
	end;
	local f, R = S, function(J)
			local w;
			if not J then
				J = S();
				if J == 0 then
					return "";
				end;
			end;
			w = u(g, V, (V + J) - 1);
			V = V + J;
			local N = {};
			for J = 1, #w, 1 do
				N[J] = c(O(Z(u(w, J, J)), 164));
			end;
			return M(N);
		end;
	local v, a = S, function(...)
			return { ... }, t("#", ...);
		end;
	local function W()
		local J, w, N = {}, {}, {};
		local Z = {
				J,
				w,
				nil,
				N,
			};
		local c, u = S(), {};
		for J = 1, c, 1 do
			local w, N = K();
			if w == 3 then
				N = K() ~= 0;
			elseif w == 1 then
				N = h();
			elseif w == 0 then
				N = R();
			end;
			u[J] = N;
		end;
		Z[3] = K();
		for w = 1, S(), 1 do
			local N = K();
			if x(N, 1, 1) == 0 then
				local Z, c, M = x(N, 2, 3), x(N, 4, 6), {
						i(),
						i(),
						nil,
						nil,
					};
				if Z == 0 then
					M[3] = i();
					M[4] = i();
				elseif Z == 1 then
					M[3] = S();
				elseif Z == 2 then
					M[3] = S() - 65536.0;
				elseif Z == 3 then
					M[3] = S() - 65536.0;
					M[4] = i();
				end;
				if x(c, 1, 1) == 1 then
					M[2] = u[M[2]];
				end;
				if x(c, 2, 2) == 1 then
					M[3] = u[M[3]];
				end;
				if x(c, 3, 3) == 1 then
					M[4] = u[M[4]];
				end;
				J[w] = M;
			end;
		end;
		for J = 1, S(), 1 do
			w[J - 1] = W();
		end;
		return Z;
	end;
	local function y(J, w, N)
		local Z, c, u = J[1], J[2], J[3];
		return function(...)
			local J, w, M, L, j, p, Q, z, U, g, V = Z, c, u, a, 1, -1, {}, { ... }, t("#", ...) - 1, {}, {};
			for J = 0, U, 1 do
				if J >= M then
					Q[J - M] = z[J + 1];
				else
					V[J] = z[J + 1];
				end;
			end;
			local O = (U - M) + 1;
			local G;
			local x;
			while true do
				G = J[j];
				x = G[1];
				if x <= 3 then
					if x <= 1 then
						if x > 0 then
							V[G[2]] = N[G[3]];
						else
							V[G[2]] = G[3];
						end;
					elseif x > 2 then
						do
							return;
						end;
					else
						do
							return;
						end;
					end;
				elseif x <= 5 then
					if x == 4 then
						V[G[2]] = G[3];
					else
						V[G[2]] = N[G[3]];
					end;
				elseif x == 6 then
					local J = G[2];
					V[J](V[J + 1]);
				else
					local J = G[2];
					V[J](V[J + 1]);
				end;
				j = j + 1;
			end;
		end;
	end;
	return (y(W(), {}, p))(...);
end)(...);