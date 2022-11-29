% script: Jacobi_GS_SOR_compare
% UNM CS-Math 375, Fall 2022

A = [  3    1   -1    ;           % coefficient matrix
       2    4    1    ;
      -1    2    5    ];
%
b = [  4  ;                       % right-hand side
       1  ;
       1  ];
%
xexact = [  2  ;                  % exact solution
           -1  ;
            1  ];

kmax = 15;                        % number of iterations to perform

%  Jacobi method
uold = 0; vold = 0; wold = 0;
for k = 1:kmax
    u =  (4 -   vold +   wold)/3;
    v =  (1 - 2*uold -   wold)/4;
    w =  (1 +   uold - 2*vold)/5;
    uold = u;
    vold = v;
    wold = w;
end
JacobiErr = num2str(norm([u; v; w] - xexact,inf),'%0.4e');
disp([char(10),'Jacobi inf-norm error       : ',JacobiErr])

%  Gauss-Seidel method
u = 0; v = 0; w = 0;
for k = 1:kmax
    u =  (4 -   v +   w)/3;
    v =  (1 - 2*u -   w)/4;
    w =  (1 +   u - 2*v)/5;
end
GSErr = num2str(norm([u; v; w] - xexact,inf),'%0.4e');
disp(['Gauss-Seidel inf-norm error : ',GSErr])

%  SOR(omega)
omega = 1.25;
uold = 0; vold = 0; wold = 0;
for k = 1:kmax
    u = (1-omega)*uold + (omega/3)*(4 -   vold +   wold);
    v = (1-omega)*vold + (omega/4)*(1 -    2*u -   wold);
    w = (1-omega)*wold + (omega/5)*(1 +      u -    2*v);
    uold = u;
    vold = v;
    wold = w;
end
SORErr=num2str(norm([u; v; w] - xexact,inf),'%0.4e');
disp(['SOR(omega) inf-norm error   : ',SORErr])
