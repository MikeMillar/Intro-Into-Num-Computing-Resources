% Given dimension n and diagonal dominance factor dd, returns diagonally dominant n-by-n matrix A.
% function A = getDiagDomA(n,dd)
  function A = getDiagDomA(n,dd)
A = rand(n,n); % Start with a random matrix.
for i = 1:n    % Give it diagonal dominance dd.
    A(i,i) = 0;
    A(i,i) = sum(abs(A(i,:)))*dd;
end
