  function [m k] = bisection(f,a,b,tol,kmax)
% function [m k] = bisection(f,a,b,tol,kmax)
% Given an interval [a,b] which brackets at least one root of
% a continuous function f, routine returns an approximate root
% m obtained via bisection algorithm. Other user inputs are an
% error tolerance tol and the maximum number kmax of allowed
% steps (total function evaluations then capped at kmax + 2).
% |m-r| < tol2 should hold upon termination. Here r is a root
% on [a,b] and tol2 = tol + (machine epsilon)*max(|a|,|b|).
% Using tol2 instead of tol prevents loss of convergence if
% tol is smaller than the spacing of the floating point numbers
% between a and b (tol2 is adjusted with a and b). See Van
% Loan's textbook, p.280. tol=1e-8 and kmax = 1e5 are defaults,
% if left unspecified. Also returns the number k of bisections.

switch nargin
  case 4,
    kmax = 1e5;
  case 3,
    tol = 1e-8; kmax = 1e5;
  case 5,
    % Fall through.
  otherwise,
    error('bisection called with incorrect number of arguments')
end

if b <= a                   % Tests for early quits
  error('b > a not satisfied');
end
%
fa = f(a); if fa == 0, m = a; return; end;
fb = f(b); if fb == 0, m = b; return; end;
%
if fa*fb>=0
  error('Initial interval is not bracketing.');
end

k = 0;
m = 0.5*(a+b);
err = 0.5*(b-a);
tol2 = tol+eps*max(abs(a),abs(b));

while err>=tol2;
  fm = f(m); k = k+1;       % k+2 is number of function evaluations,
                            % with 2 from original f(a) f(b) above.

  if fm == 0, return; end;  % Return if m is a root.
  if fa*fm<0;               % New bracket-interval is [a,m] or [m,b].
    b = m; fb = fm;
  else
    a = m; fa = fm;
  end

  m = 0.5*(a+b);
  err = 0.5*(b-a);
  tol2 = tol+eps*max(abs(a),abs(b));

  if k>=kmax;              % Terminate if too many iterations.
    disp(['Reached max iterations ',num2str(kmax),'. Error is ',num2str(err)]);
    return;
  end
end
disp(['Converged in ',num2str(k),' iterations with tol ',num2str(tol2,'%1.1e')])
