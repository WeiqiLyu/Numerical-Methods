function x = getxPos(nodes,xi,eta)
% nodes: eine Matrix mit den globalen Positionen der Ecken des Elements.
% Zeilen : Knoten i; Spalten: x,y
% Ausgang: Spaltenvektor Position im (x,y)-Koordinatensystem
x = [0,0];
N = linquadref(xi,eta);
x(1)=dot(N,nodes(:,1));
x(2)=dot(N,nodes(:,2));
%for i = 1:length(N)
    %x = x + N(i).* nodes(i,:);
%end