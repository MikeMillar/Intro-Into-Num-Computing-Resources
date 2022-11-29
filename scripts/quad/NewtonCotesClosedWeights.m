   function w = NewtonCotesClosedWeights(m)
%  function w = NewtonCotesClosedWeights(m)
%  w is a column m-vector consisting of the weights for the m-point closed
%  Newton-Cotes rule. m is an integer that satisfies 2 <= m <= 11. From
%  M. Abramowitz and I. Stegun.
   switch m,
     case 2,
       w = [1 1]/2;
     case 3,
       w = [1 4 1]/6;
     case 4,
       w = [1 3 3 1]/8;
     case 5,
       w = [7 32 12 32 7]/90;
     case 6,
       w = [19 75 50 50 75 19]/288;
     case 7,
       w = [41 216 27 272 27 216 41]/840;
     case 8,
       w = [751 3577 1323 2989 2989 1323 3577 751]/17280;
     case 9,
       w = [989 5888 -928 10496 -4540 10496 -928 5888 989]/28350;
     case 10,
      w = [2857 15741 1080 19344 5778 5778 19344 1080 15741 2857]/89600;
     case 11,
       w = [16067 106300 -48525 272400 -260550 427368 ...
          -260550 272400 -48525 106300 16067]/598752;
      otherwise,
       error = 'm not between 2 and 11 in NewtonCotesClosedWeights'
       pause
   end
