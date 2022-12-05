 function wert_poly = LagrangePolynom(x,n,x_node,f_node)
% n:Ordnung, x_node:Stuetzstellen, f_node:funktionswert
% berechnen Lagrange-Polynom mit Grad n
wert_poly = 0;
Lni = ones(1,n+1);
for i = 1 : n+1
    Lni(i) = LagrangeBasis(x,n,i,x_node);
    wert_poly = wert_poly + Lni(i) .* f_node(i);
    i = i+1;
end
end