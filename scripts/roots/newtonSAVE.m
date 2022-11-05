  function [x iters] = newtonSAVE(f,df,x0,tol,kmax);
% function [x iters] = newtonSAVE(f,df,x0,tol,kmax);
% Given a differentiable function f with df = df/dx, routine,
% when convergent returns an approximate root x obtained via
% Newton-Raphson iteration. Other inputs are an error tolerance
% tol (max over error between successive iterations and abs(f)),
% the max number kmax allowed iterations, and initial iteration
% x0. tol=1e-8 and kmax = 1e5 are defaults, if left unspecified.
switch nargin
   case 3,
     tol = 1e-8
     kmax = 1e5;
   case 4,
     kmax = 1e5;
   case 5,
     % Fall through.
   otherwise,
     error('newton called with incorrect number of arguments')
end
iters = zeros(kmax+1,1);
x = x0; err=100; k = 0;  % x=x0 here allows return for large tol.
iters(1) = x;
while err >= tol
  y = f(x0);
  x = x0 - y/df(x0);
  err = max(abs(y),abs(x-x0));
  x0 = x;
  k = k+1;
  iters(k+1) = x;
  if k>=kmax
    disp(['No convergence after ' num2str(kmax) ' iterations.'])
    disp(['Error at this stage is ' num2str(err)])
    return
  end
end

if isfinite(x)
  disp(['Converged in ' num2str(k) ' iterations with tol ' num2str(tol)])
else
  disp(['No convergence after ' num2str(k) ' iterations. Iterations' ...
  ' overflowed to infinity.']);
end
