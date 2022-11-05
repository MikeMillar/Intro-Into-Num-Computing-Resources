  function x = iteration(f,x0,tol,kmax)
% function x = iteration(f,x0,tol,kmax)
% Given a (typically continuous) function f, routine, when
% convergent returns an approximate root x obtained via
% fix-point iteration. Other inputs are an error tolerance
% tol (between successive iterations), the max number kmax
% allowed iterations, and initial iteration x0. tol=1e-8
% and kmax = 1e5 are defaults, if left unspecified.
switch nargin
   case 2,
     tol = 1e-8
     kmax = 1e5;
   case 3,
     kmax = 1e5;
   case 4,
     % Fall through.
   otherwise,
     error('iteration called with incorrect number of arguments')
end

x = x0; err=100; k = 0;  % x=x0 here allows return for large tol.
while err >= tol;
  format long g; if k < 20; disp([k x0]); end
  x  = f(x0);
  err = abs(x-x0);
  x0 = x;
  k = k+1;
  if k>=kmax;
    disp(['No convergence after ' num2str(kmax) ' iterations.'])
    disp(['Error at this stage is ' num2str(err)])
    return;
  end
end

if isfinite(x);
  disp(['Converged in ' num2str(k) ' iterations with tol ' num2str(tol)])
else
  disp(['No convergence after ' num2str(k) ' iterations. Iterations' ...
  ' overflowed to infinity.']);
end
