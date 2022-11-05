   function y = LTriSol(L,b)
%  function y = LTriSol(L,b)
%  Solves the nonsingular lower triangular system Ly = b,
%  where L is n-by-n, b is n-by-1, and y is n-by-1. Note
%  that the algorithm has been vectorized with successive
%  overwriting of b. Here we use y where Van Loan uses x.
   n = length(b);
   y = zeros(n,1);
   for j = 1:n-1
       y(j) = b(j)/L(j,j);
       b(j+1:n) = b(j+1:n) - L(j+1:n,j)*y(j);
   end
   y(n) = b(n)/L(n,n);

