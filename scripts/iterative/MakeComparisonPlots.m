Solvers=['J'; 'G']; kmax = 20;                    % Solvers and max iteration number.
plotform = char('g-','r--','k:','b-.');           % Zoo of plotting formats.

N  = 100; dd = logspace(-1,2,4);    Ld = length(dd); % First experiment.  Fixed N, various dd.
DD = 5;   nn = [10 100 1000 10000]; Ln = length(nn); % Second experiment. Fixed DD, various nn.

for s = 1:length(Solvers)
     switch Solvers(s)
          case 'J',
               RunIterativeSolver=@(A,b,x0,kmax)RunJacobi(A,b,x0,kmax);
               TopSubplot=1; BottomSubplot=3; Method='JACOBI';
          case 'G'
               RunIterativeSolver=@(A,b,x0,kmax)RunGaussSeidel(A,b,x0,kmax);
               TopSubplot=2; BottomSubplot=4; Method='GAUSS-SEIDEL';
          otherwise,
               error='Only Jacobi and Gauss-Seidel coded'; pause
     end

     %%%%%%%%%%%%%%% FIRST EXPERIMENT.
     x0 = zeros(N,1); b = rand(N,1);
     reshist=zeros(kmax+1,Ld);
     for j = 1:Ld
         A = getDiagDomA(N,dd(j));
         [x reshist(:,j)] = RunIterativeSolver(A,b,x0,kmax);
     end
     subplot(2,2,TopSubplot); hold off
     for j = 1:Ld
         exsemilogy([0:kmax],reshist(:,j),plotform(j,:)); hold on
     end
     axis([0 20 1e-16 1e4 ])
     legend(num2str(dd(1)),num2str(dd(2)),num2str(dd(3)),num2str(dd(4)))
     title({Method,[num2str(N),'-by-',num2str(N),' matrices with various dd']})
     xlabel('iterations'); ylabel('2-norm of residual');

     %%%%%%%%%%%%%%% SECOND EXPERIMENT.
     reshist=zeros(kmax+1,Ln);
     for j = 1:Ln
         x0 = zeros(nn(j),1); b = rand(nn(j),1);
         A = getDiagDomA(nn(j),DD);
         [x reshist(:,j)] = RunIterativeSolver(A,b,x0,kmax);
     end
     subplot(2,2,BottomSubplot); hold off
     for n = 1:Ln
         exsemilogy([0:kmax],reshist(:,n),plotform(n,:)); hold on
     end
     axis([0 20 1e-17 10 ])
     legend(num2str(nn(1)),num2str(nn(2)),num2str(nn(3)),num2str(nn(4)))
     title(['dd = ',num2str(DD),' matrices with various n'])
     xlabel('iterations'); ylabel('2-norm of residual');
end
saveas(gcf,'JacobiGaussSeidelComparison.eps','epsc');
