% Funktion triangulierter plot von quad elemeten
% Parameter:
%    nodes ...      Knotenkoordinaten
%                   (nid, (x = 1,y = 2)-Richtung) (nid = Knotenid)
%    elements ...   Knotenids(nid)
%                   (eid, lnid) (eid = Elementid, lnid = lokale Knotenid)
%    sol ...        Loesungsvektor(nid) (nid = Knotenid)

function quadplotmesh(nodes,elements,sol)

figure()
set(gcf,'defaultlinelinewidth',2);
set(gca,'FontSize',18);
set(gcf, 'Position', [300, 150, 1280, 756]);
set(0,'DefaultAxesFontName','Arial');
set(gcf, 'PaperPositionMode', 'auto');

% Gibt an, aus welchen Knoten des Vierecks die beiden Dreiecke
% gebildet werden
tri = [1,2,3; 3,4,1];
numele = size(elements,1);

for i = 1:numele
    % trisurf(tri, x-Koordinaten des Elements i, y-Koordinaten des Elements i, Funktionswert z=x^2+y^2)
    trisurf(tri,nodes(elements(i,:),1),nodes(elements(i,:),2),sol(elements(i,:))');
    
    % Grafik halten, damit in jeder Schleife das berechnete Dreieck
    % hinzugefuegt werden kann.
    hold on
end

% Elementkanten plotten
quad = [1,2; 2,3; 3,4; 4,1];
for i = 1:numele
    x_ele = nodes(elements(i,:),1);
    y_ele = nodes(elements(i,:),2);
    sol_ele = sol(elements(i,:))';
    
    % Schleife über Elementkanten
    for k = 1:4
        current_edge = quad(k,:);
        plot3(x_ele(current_edge), y_ele(current_edge), sol_ele(current_edge), 'k');
    end
end

% Knoten plotten
sc = scatter3(nodes(:,1), nodes(:,2), sol);
sc.MarkerFaceColor = 'k';
sc.MarkerEdgeColor = 'k';

% Farbschattierung
shading interp
colormap hot

% Colorbar
c = colorbar;
c.FontSize = 18;

% Achsenbeschriftung
xlabel('x', 'FontSize',18);
ylabel('y', 'FontSize',18);
zlabel('T(x,y)', 'FontSize',18);
zlim([300, 650]);

% Kameraposition
campos(1.0e3 * [-0.0003907, 0.0025111, 1.5711258]);
axh = gca;
axh.FontSize = 18;
axh.Position = [0.11 0.1100 0.7166 0.8150];
axh.Colorbar.Position = [0.8845 0.1100 0.0216 0.8150];

end

