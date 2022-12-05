function gaussw = gw2dref(n)
% n: Anzahl der Integrationspunkte in einer Richtung, n<4
% die Funktion wird für das Gebiet {(xi,eta)|-1<=xi,eta<=1} erstellt.
% Ausgang: Gewichte w für die 2D-Gauss-Integration als Spaltenvektor.
if n < 4
    if n == 1
        gaussw=4.0;

    elseif n == 2
        gaussw = [1.0;1.0;1.0;1.0];

    else
        gaussw = [25/81;40/81;25/81;40/81;64/81;40/81;25/81;40/81;25/81];
    end
end
end