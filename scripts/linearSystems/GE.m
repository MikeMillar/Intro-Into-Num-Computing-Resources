% CS/Math 375, UNM Spring 2021
% C. F. Van Loan's GE.m (slightly edited). LU factorization
% without pivoting. If A is n-by-n and has LU factorization,
% then L is unit lower triangular and U is upper triangular
% so A = LU.
% function [L,U] = GE(A)
  function [L,U] = GE(A)
[n,m] = size(A);
if n ~= m; error('Matrix A not square.'); end;
for k=1:n-1
   A(k+1:n,k) = A(k+1:n,k)/A(k,k);
   A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
%
%  Previous line equivalent to the following for loops.
%
%  for q = k+1:n
%    v = A(q,k);  % A(q,k)/A(k,k) before A(q,k) was over written
%    for l = k+1:n
%      A(q,l) = A(q,l) - v * A(k,l);
%    end
%  end
end
L = eye(n,n) + tril(A,-1);
U = triu(A);
