% UNM CS/Math 375, UNM Fall 2022
% See "Lecture linalg2"
%
% x array and spacing h.
%
n = 10500; x = linspace(0,pi,n)'; h = pi/(n-1); % x array and spacing h.
%
% righthand side in Eq. (13).
%
b = -h^2*sin(x); b(1) = 0; b(n) = 0; % righthand side in Eq. (13).
%
%  Tridiagonal matrix (only form diagonal, super and sub diagonals).
%
d = -2*ones(n,1);
e = ones(n,1);
f = ones(n,1);
d(1) = 1; f(1) = 0;
d(n) = 1; e(n) = 0;
T = diag(d,0)+diag(f(1:n-1),1)+diag(e(2:n),-1);
%
% Solve the system. Either keep lines A,B,C (tridiagonal solver)
% or keep line D (general purpose solver) but NOT both.
%
tic
[l, u] = TriDiLU(d,e,f);  % A
y = LBiDiSol(l,b);        % B
v = UBiDiSol(u,f,y);      % C
%v = T\b;                 % D
t_taken = toc
%
%  Plot the error.
%
explot(x,v-sin(x))
axis tight
xlabel('x')
ylabel('v_k - sin(x_k)')
title('Numerical error')
