  function Q = OpenQNC(f,a,b,m)
% function Q = OpenQNC(f,a,b,m)
% Integrates a function of the form f(x) passed as a handle from a to b.
% f must be defined on [a,b] and it must return a column vector if x is a
% column vector. m is an integer that satisfies 2 <= m <= 7. Q is the
% m-point open Newton-Cotes approximation of the integral int_a^b f(x)dx.
  w  = NewtonCotesOpenWeights(m);
  h  = (b-a)/(m+1);
  x  = [a+h:h:b-h]';
  fx = f(x);
  Q = (b-a)*(w*fx);  % w is a row vector and fx a column vector.
