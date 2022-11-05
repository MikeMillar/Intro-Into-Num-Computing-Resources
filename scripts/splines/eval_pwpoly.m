%  CS/Math 375, UNM Fall 2022
%  Evaluates piecewise polynomials. The vector x sections off
%  bins, each with a piecewise polynomial defined thereon. If
%  N = length(x), then the matrix C is (N-1)-by-(P+1), where P
%  is the degree of the polynomial on each bin. Coefficients
%  in the matrix C are assumed to come from a Newton-like
%  basis which allows Horner's rule for evaluation. The Horner
%  geometric multiples for consecutive basis functions alternate
%  between (x-x_L) and (x-x_R). Polynomials are evaluated at X.
%  function[Y] = eval_pwpoly(x,C,X)
   function[Y] = eval_pwpoly(x,C,X)

Y    = zeros(size(X));
N    = length(x);            % Number of bins = N-1.
if size(C,1)~=(N-1);         % Argument check.
   error('# of rows of C must be equal to length(x)-1');
end
if X(1) < x(1) || X(end) > x(end)
   error('trying to extrapolate with piecewise polynomial');
end

P = size(C,2)-1;             % Polynomial order.

[n bins] = histc(X,x);
bins(bins==N) = N-1;         % histc is a little off, so correct.

Y = C([bins],end);           % Perform Horner evaluation:
sideflag = (mod(P,2)==1);    % false = left, true = right.
for q = 1:P;
  if sideflag;
    Y = Y.*(X-x(bins))   + C(bins,end-q);
  else
    Y = Y.*(X-x(bins+1)) + C(bins,end-q);
  end
  sideflag = ~sideflag;
end
