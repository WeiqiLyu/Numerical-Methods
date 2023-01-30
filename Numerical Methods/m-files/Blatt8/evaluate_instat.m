function [elemat,elevec] = evaluate_instat(elenodes,gpx,gpw,elesol,eleosol,timInt_m,timestep,theta,firststep)
% elenodes: Knotenpositionen(Zeile:Knoten i, Spalte:x,y):(4*2)-Matrix
% gpx: Positionen xi(k) Gauss-Integration
% gpw: Gewichte w(k) Gauss-Integration
% elesol: Loesung Zeitschritt(n)-Spaltenvektor
% eleosol: Loesung Zeitschritt(n-1)-Spaltenvektor
% timIn_m: Zeitintegrationsverfahren: 1 = OST, 2 = AB2, 3 = AM3, 4 = BDF2
% timestep: Zeitschrittlaenge delta_t
% theta: theta fuer OST
% firststep: erste Zeitschritt

% Ausgang: Elementsteifigkeitsmatrix A(e):(4*4)-Matrix(i,j) fuer lineares Viereckselement
% Ausgang: Elementlastvektor f(e), fuer allgemeinen Fall(instationaer)

% Gauss-Quadratur mit n Stuetzstellen
lambda = 48.0;                                                         % lamba(x,y) = 48.0 W/mK
rho = 7800;                                                            % Dichte,Einheit: kg/m^3
c = 452;                                                               % spezifische Kapazitaet, Einheit: J/(kg*K)
gaussx = gpx;
gaussw = gpw;
elemat = zeros(4,4);
elevec = zeros(4,1);
B = zeros(4,4);
M = zeros(4,4);
rhs = zeros(4,4);

if firststep ~= 0
    for n = 1 : size(gaussx,1)                                             % Schleife ueber alle Gaysspunkte in Element
        xi = gaussx(n,1);
        eta = gaussx(n,2);
        deriv = linquadderivref(xi,eta);                 % 4*2
        N = linquadref(xi,eta);                           % 4*1
        [J, detJ, invJ] = getJacobian(elenodes,xi,eta);   % 2*2
        for i = 1 : 4                                                      % Schleife ueber alle Zeilen der A(e)
            for j = 1 : 4                                                  % Schleife ueber alle Spalten der A(e)
                %s1 = 0; 
                %s2 = 0;
                ansatz = (deriv(i,:)*invJ)*(deriv(j,:)*invJ).';            % 1*1
                B(i,j) =  B(i,j) - ansatz * detJ * gaussw(n) * lambda;
                M(i,j) =  M(i,j) + N(i)* N(j) * detJ * gaussw(n) * rho * c;
                if timInt_m == 1                                           % Anwenden der Zeitintegrationsmethoden
                %[LHS,RHS] = OST(theta,timestep,M,B,C,elesol);
                   [elemat(i,j),rhs(i,j)] = OST(theta,timestep,M(i,j),[B(i,j),B(i,j)],[0,0],elesol(j));
                elseif timInt_m == 2
                   [elemat(i,j),rhs(i,j)] = AB2(timestep,M(i,j),[B(i,j),B(i,j)],[0,0],[elesol(j),eleosol(j)]);
                %[LHS,RHS] = AB2(timestep,M,B,C,[elesol,eleosol]);
                elseif timInt_m == 3
        %[LHS,RHS] = AM3(timestep,M,B,C,[elesol,eleosol]);
                   [elemat(i,j),rhs(i,j)] = AM3(timestep,M(i,j),[B(i,j),B(i,j),B(i,j)],[0,0,0],[elesol(j),eleosol(j)]);             
                elseif timInt_m == 4
          %[LHS,RHS] = BDF2(timestep,M,B,C,[elesol,eleosol]);
                   [elemat(i,j),rhs(i,j)] = BDF2(timestep,M(i,j),B(i,j),0,[elesol(j),eleosol(j)]);               
                else
                   print('Bitte geben Sie ein ganzzahliges Zahl von 1 bis 4')
                end
            end
        end
    end
    for k = 1 : 4
        elevec(k) = rhs(k,1) + rhs(k,2) + rhs(k,3) + rhs(k,4);
    end

    %elemat=LHS;
    %elevec=RHS;

end