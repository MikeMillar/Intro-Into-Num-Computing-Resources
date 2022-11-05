%  CS/Math 375, UNM Fall 2022
%  Calculates the piecewise-cubic Hermite interpolation
%  coefficients from the nodal data set (x,y,s). s are
%  the slope values at x. C is a 4-by-(length(x)-1)
%  matrix with the cubic coefficients corresponding to
%  a Newton-type basis with alternating geometric
%  multiples of (x-x_L) and (x-x_R) as the Horner additions.
%  function[C] = pwchermite_coeffs(x,y,s);
   function[C] = pwchermite_coeffs(x,y,s);

N = length(x);             % Argument check
if ~((N==length(y))&(N==length(s)));
   error('Inputs x, y, and s must be of the same size');
end

C = zeros([N-1 4]);        % Allocate output

inds = 1:(N-1);            % Precompute interval widths
dx = x(inds+1) - x(inds);

C(:,1) = y(inds);          % Explicitly-calculated coefficients
C(:,2) = (y(inds+1)-y(inds))./dx;
C(:,3) = (C(:,2) - s(inds))./dx;
C(:,4) = (s(inds+1) - C(:,2) - C(:,3).*dx)./(dx.^2);
