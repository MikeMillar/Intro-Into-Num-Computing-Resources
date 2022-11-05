% Evaluates polynomial from nested form using Horner's Method
% Input:   d, degree of polynomial
%          c, array of d+1 coefficients, where c(1) fixes constant term
%          x, coordinate at which to evaluate
%          r, array of d base points, if needed
% Output:  y, value of polynomial at x
% Example: y = c1 + c2(x-r1) + c3(x-r1)(x-r2) + c4(x-r1)(x-r2)(x-r3)
% function y=nest(d,c,x,r)
  function y=nest(d,c,x,r); if nargin < 4, r=zeros(d,1); end
y=c(d+1);
for i = d:-1:1
    y = y.*(x-r(i))+c(i);
end
