function wert_dbasis = LagrangeDerivBasis(x,n,i,x_node)
% n:Ordnung, i:Index des Polynoms, x_node:Stuetzstellen
% berechnen dL_ni(x)/dx
wert_dbasis = 0;

for m = 1 : n+1
    if m ~= i
        Lni = 1;
        for k = 1 : n+1
            if (k ~= i) && (k ~= m)
                Lni = Lni .* (x - x_node(k)) ./ (x_node(i) - x_node(k));
                k = k+1;
            else
                k = k+1;
                continue
            end
        end
        wert_dbasis = wert_dbasis + Lni ./ (x_node(i) - x_node(m));
        m = m+1;
    else
        m = m+1;
        continue
    end
end

end