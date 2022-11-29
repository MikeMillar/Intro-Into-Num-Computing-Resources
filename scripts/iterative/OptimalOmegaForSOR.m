% script: OptimalOmegaForSOR
% CS-Math 375, Fall 2022
A = [3 1 -1; 2 4 1; -1 2 5];
b = [4; 1; 1];
xexact = [2; -1; 1];
kmax = 6;
omgs = [1:0.01:1.5];
errs = zeros(size(omgs));
disp(['omega    2-norm error'])
for p = 1:length(omgs)
    omega = omgs(p);
    uold = 0; vold = 0; wold = 0;
    for k = 1:kmax
        u = (1-omega)*uold + (omega/3)*(4 -   vold +   wold);
        v = (1-omega)*vold + (omega/4)*(1 -    2*u -   wold);
        w = (1-omega)*wold + (omega/5)*(1 +      u -    2*v);
        uold = u;
        vold = v;
        wold = w;
    end
    errs(p) = norm([u; v; w] - xexact,inf);
    disp([num2str(omega,'%0.4f'), '   ',num2str(errs(p),'%0.5e')])
end
explot(omgs,errs,'o')
title('\infty-norm error after 6 steps of SOR(\omega)')
xlabel('\omega')
saveas(gcf,'SORerrors.eps','eps')
