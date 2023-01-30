% Aufgabe3_1(), Lösen das lineare Gleichungssystem aus den Arbeitsblättern 7 

r = 0.02;   % Einheit:m
b = 0.3;    % Einheit:m
h = 0.3;    % Einheit:m

T1 = 600;   % Einheit:K, Dirichlet-Rand 1
T2 = 300;   % Einheit:K, Dirichlet-Rand 2
Tk = 450;   % Einheit:K, maxima; zulaessige Temperatur

nodes = [0,0                            % node 1
         b/3,0                          % node 2
         2*b/3,0                        % node 3
         b,0                            % node 4
         0,h/3                          % node 5
         b/3,h/3                        % node 6
         2*b/3,h/3                      % node 7  
         b,h/3                          % node 8
         0,2*h/3                        % node 9
         b/3,2*h/3                      % node 10
         2*b/3,2*h/3                    % node 11
         b-r*sin(pi/6),h-r*cos(pi/6)    % node 12
         b,h-r                          % node 13
         b-r*cos(pi/6),h-r*sin(pi/6)    % node 14
         0,h                            % node 15
         b/3,h                          % node 16
         b/2,h                          % node 17  
         b-r,h                          % node 18
         ];

elements = [1,2,6,5                     % Zeile: Element, Spalte:Knotenindex
            2,3,7,6
            3,4,8,7
            5,6,10,9
            6,7,11,10
            7,12,14,11
            7,8,13,12
            9,10,16,15
            10,11,17,16
            11,14,18,17];

dbc = [1,T1;2,T1;3,T1;4,T1;12,T2;13,T2;14,T2;18,T2];

sysmat = zeros(18,18);                       % nicht eye-Matrix
rhs = zeros(18,1);

gpx = gx2dref(2);
gpw = gw2dref(2);

for i = 1 : size(elements,1)
    ele = elements(i,:);                     % i-th Element
    [elemat,elevec]=evaluate_stat(nodes(ele,:),gpx,gpw); % berechnen A(e) und f(e)
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele);% berechnen assemblierte globale A und f
end

% beruecksichtigen die Dirichlet Raender in A und f
[sysmat,rhs] = assignDBC(sysmat,rhs,dbc);
for i = 1 : size(dbc,1)                         % bekommen symmetrische sysmat
    a = sysmat(:,dbc(i,1));
    sysmat(:,dbc(i,1))=0;
    sysmat(dbc(i,1),dbc(i,1))=1;
    for j = 1: size(a)
        rhs(j) = rhs(j)- a(j) * dbc(i,2);
    end
    rhs(dbc(i,1))=dbc(i,2);
end

% Loesen das Gleichungssystem AT = f
tic;
T0 = sysmat\rhs;                   
t0 = toc

tic;
T1 = solveGauss(sysmat,rhs);     % Gauß'schen Eliminationsverfahren ohne Zeilentausch
t1 = toc

x0 = zeros(18,1);
rtol = 1e-7;
itermax = 1000;

tic;
[T2, iter2] = solveG(sysmat,rhs,x0,rtol,itermax);   % Gradienten-Methode
t2 = toc

tic;
[T3, iter3] = solveCG(sysmat,rhs,x0,rtol,itermax);  % konjugierte Gradienten-Methode
t3 = toc

% Plotting 
quadplot(nodes, elements, T0)
shading interp;
colormap hot;
colorbar;