   function w = NewtonCotesOpenWeights(m)
%  function w = NewtonCotesOpenWeights(m)
%  w is a column m-vector consisting of the weights for the m-point closed
%  Newton-Cotes rule. m is an integer that satisfies 2 <= m <= 7. From
%  M. Abramowitz and I. Stegun.
   switch m,
     case 1,
       w = [1];
     case 2,
       w = [1 1]/2;
     case 3,
       w = [2 -1 2]/3;
     case 4,
       w = [11 1 1 11]/24;
     case 5,
       w = [11 -14 26 -14 11]/20;
     case 6,
       w = [611 -453 562 562 -453 611]/1440;
     case 7,
       w = [460 -954 2196 -2459 2196 -954 460]/945;
     otherwise,
       error = 'm not between 2 and 7 in NewtonCotesOpenWeights'
       pause
   end
