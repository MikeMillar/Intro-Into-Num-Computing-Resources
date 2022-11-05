   function x = UBiDiSol(u,f,y)
%  function x = UBiDiSol(u,f,y)
%  Note we use y for Van Loan's b. We are solving Ux = y.
%  U is upper bidiagonal.
n = length(y); x = zeros(n,1);
x(n)= y(n)/u(n);
for i = n-1:-1:1
   x(i) = (y(i) - f(i)*x(i+1))/u(i);
end

