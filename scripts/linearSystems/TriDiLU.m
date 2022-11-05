   function [l,u] = TriDiLU(d,e,f)
%           [l,u] = TriDiLU(d,e,f)
%  Tridiagonal LU without pivoting, where d,e,f are n-vectors.
%  Assumes T = diag(e(2:n),-1) + diag(d) + diag(f(1:n-1),1)
%  has an LU factorization. Output l and u are n-vectors with
%  the property that if L = eye + diag(l(2:n),-1) and
%  U = diag(u) + diag(f(1:n-1),-1), then T = LU. Note l(1) and
%  f(n) are wasted.
n = length(d); l = zeros(n,1); u = zeros(n,1);
u(1) = d(1);
for i = 2:n
   l(i) = e(i)/u(i-1);
   u(i) = d(i) - l(i)*f(i-1);
end
