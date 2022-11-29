% Solves linear system A*x=b using Jacobi method expressed as follows:
% x_new = x_old + inv(D)*(b - A*x_old). Here D is the diagonal and of
% A; b - A*x_old is the "old" residual.
% function [x ResidualHistory] = RunJacobi(A,b,x0,kmax)
  function [x ResidualHistory] = RunJacobi(A,b,x0,kmax)
%
D = diag(diag(A)); x = x0; res = b-A*x; % Here res is residual for initial guess.
ResidualHistory = zeros(kmax+1,1); ResidualHistory(1) = norm(res);
for k = 1:kmax
    x = x + D\res;
    res = b-A*x; ResidualHistory(k+1) = norm(res);
end
