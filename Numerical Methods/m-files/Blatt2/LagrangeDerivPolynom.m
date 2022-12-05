function wert_dpoly = LagrangeDerivPolynom(x,n,x_node,f_node)
% n:Ordnung, x_node:Stuetzstellen, f_node:funktionswert
% berechnen Ableitung des Lagrange-Polynoms mit Grad n
wert_dpoly = 0;
dLni = ones(1,n+1);
for i = 1 : n+1
    dLni(i) = LagrangeDerivBasis(x,n,i,x_node);
    wert_dpoly = wert_dpoly + dLni(i) .* f_node(i);
    i = i+1;
end

end