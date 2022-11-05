n = 6;
xmin=1.2; xmax=4.3;
x = transpose(linspace(xmin,xmax,n));
y = sin(2*x);
s = rand(n,1); %%% JUST PICK RANDOM SLOPES.
%s = 2*cos(2*x); %%% PICK EXACT SLOPES.
C = pwchermite_coeffs(x,y,s); % Get piecewise cubics.
%
% Plot piecewise cubic and error. To plot individual pieces
% with different colors, set up X and Y as blocks.
%
X = zeros(100,n-1);
Y = zeros(100,n-1);
for k = 1:n-1
    X(:,k) = linspace(x(k),x(k+1),100)';
    Y(:,k) = eval_pwpoly(x,C,X(:,k));
end
subplot(2,1,1)
explot(X,Y)
title('Piecewise cubic approximating sin(2X)')
ylabel('Y')
axis tight
subplot(2,1,2)
explot(X,Y-sin(2*X))
title('Error in piecewise cubic')
xlabel('X')
ylabel('Y-Y_e_x_a_c_t')
axis tight

