   function y = LBiDiSol(l,b)
%  function y = LBiDiSol(l,b)
%  Note we use y for Van Loan's x. We are solving Ly = b.
%  L is *unit* lower bidiagonal.
n = length(b); y = zeros(n,1);
y(1)= b(1);
for i = 2:n
   y(i) = b(i) - l(i)*y(i-1);
end

