% Aufgabe4(), Berechnet alle Aufgabenstellungen aus Aufgabe 4
n = 300;                           % Anzahl der Zustand x: x1,...,xn
b = ones(n,1);
v = -2 * ones(1,n-1);
phi = [10.0, 6.0, 5.1, 5.01, 5.001, 5.00001, 5.0000001, 5.000000001, 5.00000000001];

k = zeros(length(phi),1);          % Konditionszahl

iter = zeros(length(phi),2);       % Iterationszeit fuer Gradient und konj.Gradient
t = zeros(length(phi),4);          % Loesungszeit fuer Gauss, Gradient, konj.Gradient,Matlab-Loeser

rtol = 1e-7;
itermax = 1000;
x0 = zeros(n,1);

for i = 1 : length(phi)
    A = diag(v,1) + diag(v,-1) + diag(phi(i) * ones(1,n));
    A(1,1) = 1;
    k(i) = norm(A) * norm(inv(A));              
    
    tic; 
    x = solveGauss(A,b);
    t(i,1) = toc;
    
    tic; 
    [x,iter(i,1)] = solveG(A,b,x0,rtol,2000);
    t(i,2) = toc;
    
    tic; 
    [x,iter(i,2)] = solveCG(A,b,x0,rtol,itermax);
    t(i,3) = toc;
    
    tic; 
    x = A \ b;
    t(i,4) = toc;

end

figure(1)
plot(k,iter(:,1),LineWidth=1);
hold on;
plot(k,iter(:,2),LineWidth=1);
ax = gca;
ax.YLim = [0 1000];
ax.XScale = 'log';
legend('Gradienten','CG');
xlabel('Konditionszahl \kappa(A)'); ylabel("Iterationszahl");
grid on; zoom on;
hold off;

figure(2)
plot(k,t(:,1),LineWidth=1);
hold on 
plot(k,t(:,3),LineWidth=1);
plot(k,t(:,4),LineWidth=1);
ax = gca;
ax.YLim = [10^-4,10^-1];
ax.YScale = 'log';
ax.XScale = 'log';
legend('Gauss','CG','Matlab');
xlabel('Konditionszahl \kappa(A)'); ylabel("Zeit t in [s]");
grid on; zoom on;
hold off

%% Erhoehung der Systemgroesse n
tn = zeros(400,4);
for n = 1:400
    v = -2 * ones(1,n-1);
    b = ones(n,1);
    x0 = zeros(n,1);
    A = diag(v,1) + diag(v,-1) + diag(phi(i) * ones(1,n));
    A(1,1) = 1;

    tic;
    x = solveGauss(A,b);
    tn(n,1) = toc;
    
    tic; 
    x = solveG(A,b,x0,rtol,2000);
    tn(n,2) = toc;
    
    tic; 
    x = solveCG(A,b,x0,rtol,itermax);
    tn(n,3) = toc;
    
    tic; 
    x = A \ b;
    tn(n,4) = toc;
end

figure(3)
n = linspace(1,400,400);
y = 1e-9 .* n.^3;
plot(n,tn(:,1),LineWidth=1);
hold on;
plot(n,tn(:,2),LineWidth=1);
plot(n,tn(:,3),LineWidth=1);
plot(n,tn(:,4),LineWidth=1);
plot(n,y,'--',LineWidth=1);
grid on
ylim([0,0.06]);
legend('Gauss','Gradienten','CG','Matlab','c*n^3');
xlabel('Matrixgröße n'); ylabel("Zeit t in [s]");
hold off