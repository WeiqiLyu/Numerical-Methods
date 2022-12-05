function gaussx = gx(n)
% n: Anzahl der Integrationspunkte, n<4
% die Funktion wird für den Intervall [a,b] = [-1,1] erstellt.
% Ausgang: Positionen ksi für die 1D-Gauss-Integration als Zeilenvektor
if n < 4
    if n == 1
        gaussx = 0;

    elseif n == 2
        gaussx = [-1/sqrt(3), 1/sqrt(3)];

    else
        gaussx = [-sqrt(3/5), 0, sqrt(3/5)];
    end
end

end