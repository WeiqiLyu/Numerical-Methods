function [elemat,elevec] = evaluate_stat(elenodes,gpx,gpw)
% elenodes: Knotenpositionen(Zeile:Knoten i, Spalte:x,y):(4*2)-Matrix
% gpx: Positionen xi(k) Gauss-Integration
% gpw: Gewichte w(k) Gauss-Integration
% Ausgang: Elementsteifigkeitsmatrix A(e):(4*4)-Matrix(i,j) fuer lineares Viereckselement
% Ausgang: Elementlastvektor f(e), fuer allgemeinen Fall(instationaer)

% Gauss-Quadratur mit zwei Stuetzstellen
lambda = 48.0;                                                         % lamba(x,y) = 48.0 W/mK
gaussx = gpx;
gaussw = gpw;
elemat = zeros(4,4);
elevec = zeros(4,1);
for k = 1 : size(gaussx,1)                                             % Schleife ueber alle Gaysspunkte in Element
    deriv = linquadderivref(gaussx(k,1),gaussx(k,2));                  % 4*2
    [J, detJ, invJ] = getJacobian(elenodes,gaussx(k,1),gaussx(k,2));   % 2*2
    for i = 1 : 4                                                      % Schleife ueber alle Zeilen der A(e)
        for j = 1 : 4                                                  % Schleife ueber alle Spalten der A(e)
            ansatz = (deriv(i,:)*invJ)*(deriv(j,:)*invJ).';            % 1*1
            elemat(i,j) = elemat(i,j) +  ansatz * detJ * gaussw(k);
        end
    end
end
elemat = elemat * lambda;
end