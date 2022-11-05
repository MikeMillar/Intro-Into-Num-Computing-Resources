%  Matlab script: IndeterminateFormTable.
%  Generates a table of values for the expressions E1 and E2 as x-->0+.
%  Example from "Numerical Analysis," Timothy Sauer; p18, 2nd edition.
%  For more about format control see the following URL
%  http://www.cplusplus.com/reference/cstdio/fprintf/
%
x = logspace(0,-12,13);        % Creates the array x = [10^0 10^(-1) ... 10^(-12)]
E1 = (1-cos(x))./(sin(x).^2);  % Note the use of ./ for elementwise division
E2 = 1./(1+cos(x));
fid=fopen('IndeterminateFormTable.txt','w');  % filename for output
fprintf(fid,'----------------------------------------------------------------------------------\n');
fprintf(fid,'|        x         |        E1        | error(E1) |        E2        | error(E2) |\n');
fprintf(fid,'----------------------------------------------------------------------------------\n');
for k = 1:length(x)
  % See URL above for explanation of these format statements. Here 1.14f means fixed
  % (decimal) point format, with 14 digits past the decimal point, while 1.3e means
  % scientific notation, with 3 digits past the decimal point.
  errE1=abs(E1(k)-0.5);
  errE2=abs(E2(k)-0.5); % Define these errors here to shorten next line.
  fprintf(fid,'| %1.14f | %1.14f | %1.3e | %1.14f | %1.3e |\n',x(k),E1(k),errE1,E2(k),errE2);
end
fprintf(fid,'----------------------------------------------------------------------------------\n');
fprintf(fid,'Compares absolute errors of E1=(1-cos(x))/sin^2(x) and E2=1/(1+cos(x)) for small x\n');
fclose(fid);
