% Aufgabe3_2(), Lösen das lineare Gleichungssystem aus den Arbeitsblättern 8 

r = 0.02;   % Einheit:m
b = 0.3;    % Einheit:m
h = 0.3;    % Einheit:m

T0 = 300;   % Einheit:K, ganze Funktionsraum, t = 0.0
T1 = 600;   % Einheit:K, Dirichlet-Rand 1
T2 = 300;   % Einheit:K, Dirichlet-Rand 2
Tk = 450;   % Einheit:K, maxima; zulaessige Temperatur

theta = 0.5;                       % theta-Wert bei Einschritt-theta-Verfahren

timestep = 500;                    % Zeitschrittlaenge
t_end = 5000;
t = 0 : timestep : t_end;          % Zeitintervall

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

T_0 = zeros(18,length(t));
T_0(:,1) = T0;
t_0 = zeros(length(t),1);

T_1 = zeros(18,length(t));
T_1(:,1) = T0;
t_1 = zeros(length(t),1);

T_2 = zeros(18,length(t));
T_2(:,1) = T0;
t_2 = zeros(length(t),1);
iter2 = zeros(length(t),1);

T_3 = zeros(18,length(t));
T_3(:,1) = T0;
t_3 = zeros(length(t),1);
iter3 = zeros(length(t),1);

eleosol = T0 * ones(18,1);                 
elesol = T0 * ones(18,1);

rtol = 1e-7;
x0 = eleosol;
x0(1:4) = 600;
itermax = 2000;

gpx = gx2dref(2);
gpw = gw2dref(2);

timInt_m = 1;                             % Zeitintegrationsverfahren: 1 = OST, 2 = AB2, 3 = AM3, 4 = BDF2
firststep = 1;

if timInt_m == 1 
    for k = 1 : length(t)-1                          % k-th Zeitschritt
        sysmat = zeros(18,18);                  
        rhs = zeros(18,1);
        for i = 1 : size(elements,1)                 % i-th Element
            ele = elements(i,:);                     
            [elemat,elevec]=evaluate_instat(nodes(ele,:),gpx,gpw,elesol(ele),eleosol(ele),timInt_m,timestep,theta,firststep); % berechnen A(e) und f(e)
            [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele);% berechnen assemblierte globale A und f
        end    
        [sysmat,rhs] = assignDBC(sysmat,rhs,dbc);    % beruecksichtigen die Dirichlet Raender in A und f
        
        for i = 1 : size(dbc,1)                      % bekommen symmetrische sysmat
            a = sysmat(:,dbc(i,1));
            sysmat(:,dbc(i,1))=0;
            sysmat(dbc(i,1),dbc(i,1))=1;
            for j = 1: size(a)
                rhs(j) = rhs(j)- a(j) * dbc(i,2);
            end
            rhs(dbc(i,1))=dbc(i,2);
        end

        tic;
        T_0(:,k+1) = sysmat\rhs;                    % Loesen das Gleichungssystem AT = f
        t_0(k+1) = toc;
        tic;
        T_1(:,k+1) = solveGauss(sysmat,rhs);               % Gauß'schen Eliminationsverfahren ohne Zeilentausch
        t_1(k+1) = toc;
        tic;
        [T_2(:,k+1), iter2(k+1)] = solveG(sysmat,rhs,x0,rtol,itermax);   % Gradienten-Methode
        t_2(k+1) = toc;
        tic;
        [T_3(:,k+1), iter3(k+1)] = solveCG(sysmat,rhs,x0,rtol,itermax);  % konjugierte Gradienten-Methode
        t_3(k+1) = toc;

        eleosol = elesol;
        elesol=T_0(:,k+1);
    end
end

%Plotting 
quadplot(nodes, elements, T_0(:,length(t)) )
shading interp;
colormap hot;
colorbar;