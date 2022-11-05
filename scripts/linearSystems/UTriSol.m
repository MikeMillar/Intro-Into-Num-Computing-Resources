   function x = UTriSol(U,y)
%  function x = UTriSol(U,y)
%  Solves the nonsingular upper triangular system Ux = y,
%  where U is n-by-n, y is n-by-1, and x is n-by-1. Note
%  that the algorithm has been vectorized with successive
%  overwriting of y. Here we use y where Van Loan uses b.
   n = length(y);
   x = zeros(n,1);
   for j = n:-1:2
       x(j) = y(j)/U(j,j);
       y(1:j-1) = y(1:j-1) - x(j)*U(1:j-1,j);
   end
   x(1) = y(1)/U(1,1);

