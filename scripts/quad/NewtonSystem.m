  function z = NewtonSystem(F,DF,z0,tol,kmax)
% function z = NewtonSystem(F,DF,z0,tol,kmax)
% Given a differentiable vector function F with Jacobian DF,
% this routine --when convergent-- returns an approximate vector
% root z obtained via Newton-Raphson iteration. Other inputs
% are an error tolerance tol (max over error between successive
% iterations and norm(F)), the max number kmax of iterations, and
% the initial iteration z0. tol=1e-8 and kmax = 1e5 are defaults,
% if left unspecified.
switch nargin
   case 3,
     tol = 1e-8
     kmax = 1e5;
   case 4,
     kmax = 1e5;
   case 5,
     % Fall through.
   otherwise,
     error('NewtonSystem called with incorrect number of arguments')
end
n = length(z0);
z = zeros(n,1); y = zeros(n,1); J = zeros(n,n); % Memory preallocation.
z = z0; err=100; k = 0;  % z=z0 here allows return for large tol.

while err >= tol;
  y = F(z0);
  J = DF(z0);
  Deltaz = J\y; % Newton direction.
  z = z0 - Deltaz;
  err = max(norm(y),norm(z-z0));
  z0 = z;
  k = k+1;
  if k>=kmax;
    disp(['No convergence after ' num2str(kmax) ' iterations.'])
    disp(['Error at this stage is ' num2str(err)])
    return;
  end
end
