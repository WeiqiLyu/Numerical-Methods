function wert_basis = LagrangeBasis(x,n,i,x_node)
% n:Ordnung, i:Index des Polynoms, x_node:Stuetzstellen
% berechnen L_ni(x)
wert_basis = 1;
for k = 1 : n+1
    if k ~= i
        wert_basis = wert_basis .* (x - x_node(k)) ./ (x_node(i) - x_node(k));
        k = k+1;
    else
        k = k+1;
        continue
    end
end

end