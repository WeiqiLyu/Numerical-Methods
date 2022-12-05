function [J, detJ, invJ] = getJacobian(nodes,xi,eta)
% nodes: eine Matrix mit den globalen Positionen der Ecken des Elements.
% Zeilen : Knoten i; Spalten: x,y
% Ausgang: Jacobi-Matrix, Determinante, Inverse
deriv = linquadderivref(xi,eta);
dxdxi = dot(deriv(:,1),nodes(:,1));
dydxi = dot(deriv(:,1),nodes(:,2));
dxdeta = dot(deriv(:,2),nodes(:,1));
dydeta = dot(deriv(:,2),nodes(:,2));
J = [dxdxi, dxdeta; dydxi, dydeta];
detJ = det(J);
invJ = inv(J);
end