function gaussw = gw(n)
% n: Anzahl der Integrationspunkte, n<4
% die Funktion wird für den Intervall [a,b] = [-1,1] erstellt.
% Ausgang: Gewichts w für die 1D-Gauss-Integration als Zeilenvektor
if n < 4
    if n == 1
        gaussw = 2;

    elseif n == 2
        gaussw = [1, 1];

    else
        gaussw = [5/9, 8/9, 5/9];
    end
end

end