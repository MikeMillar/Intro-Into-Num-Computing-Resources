% Solves linear system A*x=b using Gauss-Seidel method expressed as follows:
% x_new = x_old + inv(L+D)*(b - A*x_old). Here L and D are the diagonal and
% strictly lower triangular parts of A; b - A*x_old is the "old" residual.
% function [x ResidualHistory] = RunGaussSeidel(A,b,x0,kmax)
  function [x ResidualHistory] = RunGaussSeidel(A,b,x0,kmax)
%
LplusD = tril(A); x = x0; res = b-A*x; % Here res is residual for initial guess.
ResidualHistory = zeros(kmax+1,1); ResidualHistory(1) = norm(res);
for k = 1:kmax
    x = x + LplusD\res;
    res = b-A*x; ResidualHistory(k+1) = norm(res);
end

