% Aufgabe 1 des fuenften Blatts
a = 0; b = 4;           % Intervall [a,b] = [0,4]
I = 0.556543771162832;  % Wert der exakten Integration

%% Einfache Quadraturverfahren
%Mittelpunktregel
I_M = (b-a)* func((a+b)/2);
%Trapezregel
I_T = (b-a)* (func(a)+func(b))/2;

%% 1D Gauss-Quadratur
% Gauss-Quadratur mit einer Stuetzstellen
x = (b-a)/2 .* gx(1) + (a+b)/2;        % von [-1,1] zu beliebigem Intervall
I_G1 = dot((b-a)/2 .* func(x),gw(1));
err_1 = I - I_G1;
% Gauss-Quadratur mit zwei Stuetzstellen
x = (b-a)/2 .* gx(2) + (a+b)/2;        % Transformationsbeziehung
I_G2 = dot((b-a)/2 .* func(x),gw(2));
err_2 = I - I_G2;
% Gauss-Quadratur mit drei Stuetzstellen
x = (b-a)/2 .* gx(3) + (a+b)/2;        % Transformationsbeziehung
I_G3 = dot((b-a)/2 .* func(x),gw(3));
err_3 = I - I_G3;

function f = func(x)
f = (x ./ (1+x)).^5;        % gegebene Funktion
end