function gaussx = gx2dref(n)
% n: Anzahl der Integrationspunkte in einer Richtung, n<4
% die Funktion wird für das Gebiet {(xi,eta)|-1<=xi,eta<=1} erstellt.
% Ausgang: Positionen xi,eta für die 2D-Gauss-Integration auf dem Gebiet
% Zeile: Intrgrationspunkt i; Spalte: xi, eta
if n < 4
    if n == 1
        gaussx = [0,0];

    elseif n == 2
        gaussx = [-1/sqrt(3), -1/sqrt(3)
                  -1/sqrt(3), 1/sqrt(3)
                  1/sqrt(3), -1/sqrt(3)
                  1/sqrt(3), 1/sqrt(3)];

    else
        gaussx = [-sqrt(3/5), -sqrt(3/5)
                  -sqrt(3/5), 0
                  -sqrt(3/5), sqrt(3/5)
                  0, -sqrt(3/5)
                  0, 0
                  0, sqrt(3/5)
                  sqrt(3/5), -sqrt(3/5)
                  sqrt(3/5), 0
                  sqrt(3/5), sqrt(3/5)];
    end
end
end