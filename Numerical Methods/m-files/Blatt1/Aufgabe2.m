
a = rand(1000,1)

if a(1) >= 0.5
    disp('a1 >= 0.5')
else
    disp('a1 < 0.5')
end

% Anzahl der Eintraege ai>=0.5
n05 = 0;
for n = 1:1000
    if a(n) >= 0.5
        n05 = n05 + 1;
    end
end
n05

% erster Eintrag (Index i & Wert a_i), der in [0.499, 0.501] liegt
n=1;
while n <= 1000
    if (a(n) >= 0.499) && (a(n) <= 0.501)
        X1 = ['i=', num2str(n)];
        disp(X1)
        X2 = ['a_i=', num2str(a(n))];
        disp(X2)
        break
    elseif n == 1000
        disp('Kein Element 0.499 <= a_i<= 0.501')
        break
    else
    n = n+1;
    end
end

% Berechnen den Wert n! von ganzzahlige n
 nfac_0 = facultaet(0)
 nfac_5 = facultaet(5)

