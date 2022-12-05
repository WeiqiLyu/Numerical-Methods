% Aufgabe 2 des fuenften Blatts
nodes = [2,1;4,1;4,3;2,2];
%% Mehrdimensionale Gauss-Quadratur
% Gauss-Quadratur mit einer Stuetzstellen
gaussx1 = gx2dref(1);                  %Positionen xi,eta für die 2D-Gauss-Integration
gaussw1 = gw2dref(1);                  %Gewichte w für die 2D-Gauss-Integration als Spaltenvektor
N = linquadref(gaussx1(1),gaussx1(2));
[J1, detJ1, invJ1] = getJacobian(nodes,gaussx1(1),gaussx1(2));
m_12G1 = gaussw1 * N(1) * N(2) *  detJ1;

% Gauss-Quadratur mit zwei Stuetzstellen
gaussx2 = gx2dref(2);
gaussw2 = gw2dref(2);
m_12G2 = 0;
for i = 1 : size(gaussx2,1)
    N = linquadref(gaussx2(i,1),gaussx2(i,2));
    [J2, detJ2, invJ2] = getJacobian(nodes,gaussx2(i,1),gaussx2(i,2));
    m_12G2 = m_12G2 + gaussw2(i) * N(1) * N(2) *  detJ2;
end

% Gauss-Quadratur mit drei Stuetzstellen
gaussx3 = gx2dref(3);
gaussw3 = gw2dref(3);
m_12G3 = 0;
for i = 1 : size(gaussx3,1)
    N = linquadref(gaussx3(i,1),gaussx3(i,2));
    [J3, detJ3, invJ3] = getJacobian(nodes,gaussx3(i,1),gaussx3(i,2));
    m_12G3 = m_12G3 + gaussw3(i) * N(1) * N(2) *  detJ3;
end