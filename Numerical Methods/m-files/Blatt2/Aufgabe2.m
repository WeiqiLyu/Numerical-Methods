% Aufgabe 1 des zweiten Blatts
x = 0.6;
df = 5 * x^4 / (1+x)^6;
x_node = [0.0, 1.0, 2.0, 3.0, 4.0];
f_node = (x_node ./ (1+x_node)).^5;
%f_node = [0.000000, 0.031250, 0.131687, 0.237304, 0.327680];
df_node = 5 .* x_node.^4 ./ (1+x_node).^6;
%% berechnen den Funktionswert der Polynome an der Stelle x = 0.6
fL1 = LagrangePolynom(x,1,x_node,f_node);
fL4 = LagrangePolynom(x,4,x_node,f_node);
% neue Verteilung von Stuetzstellen
x_node_neu = linspace(0.0, 4.0, 81);
f_node_neu = (x_node_neu ./ (1+x_node_neu)).^5;
df_node_neu = 5 .* x_node_neu.^4 ./ (1+x_node_neu).^6;
fL80 = LagrangePolynom(x,80,x_node_neu,f_node_neu);
%% berechnen die Ableitung der Polynome an der Stelle x = 0.6
dfL1 = LagrangeDerivPolynom(x,1,x_node,f_node);
dfL4 = LagrangeDerivPolynom(x,4,x_node,f_node);
dfL80 = LagrangeDerivPolynom(x,80,x_node_neu,f_node_neu);
%% Plotting
x_plot = linspace(0,4,100);
f_plot = (x_plot ./ (1+x_plot)).^5;                                        % exakte Funktion f(x)
df_plot = 5 .* (x_plot.^4) ./ (1+x_plot).^6;                               % exakte Funktion df(x)/dx

P1 = zeros(1,length(x_plot));
P4 = zeros(1,length(x_plot));
P80 = zeros(1,length(x_plot));
dP1 = zeros(1,length(x_plot));
dP4 = zeros(1,length(x_plot));
dP80 = zeros(1,length(x_plot));
for i = 1:length(x_plot)
    P1(i) = LagrangePolynom(x_plot(i),1,x_node,f_node);                    % Polynom vom Grad 1
    P4(i) = LagrangePolynom(x_plot(i),4,x_node,f_node);                    % Polynom vom Grad 4
    P80(i) = LagrangePolynom(x_plot(i),80,x_node_neu,f_node_neu);          % Polynom vom Grad 80

    dP1(i) = LagrangeDerivPolynom(x_plot(i),1,x_node,f_node);              % erste Ableitung Polynom 1
    dP4(i) = LagrangeDerivPolynom(x_plot(i),4,x_node,f_node);              % erste Ableitung Polynom 1
    dP80(i) = LagrangeDerivPolynom(x_plot(i),80,x_node_neu,f_node_neu);    % erste Ableitung Polynom 1
end

% Figure fuer Grad 1
figure (1)                                                                 
plot(x_node(1:2),f_node(1:2),'o', 'Markerfacecolor','k')                   % Stuetzstellen
hold on;
plot(x_plot,P1,'g',x_plot,dP1,'m',Linewidth=2) 
plot(x_plot,f_plot,'k',x_plot,df_plot,'k--',Linewidth=2)
legend('Stützstellen','Polynom P1','erste Ableitung Polynom P1','exakte Funktion f(x)','exakte Funktion df(x)/dx');
xlabel('x'); ylabel('f(x)');                                               % Labelling X-axis and Y-axis
title('Lagrangesches Interpolationspolynom vom Grad 1')
zoom on; grid on;                                                          % Enable zoom, grid 

% Figure fuer Grad 4
figure (2)                                                                
plot([x_node,x_node],[f_node,df_node],'o','Markerfacecolor','k');          % Stuetzstellen
hold on;
plot(x_plot,P4,'g',x_plot,dP4,'m',Linewidth=2)                                        
plot(x_plot,f_plot,'k',x_plot,df_plot,'k--',Linewidth=2)           
legend('Stützstellen','Polynom P4','erste Ableitung Polynom P4','exakte Funktion f(x)','exakte Funktion df(x)/dx');
xlabel('x'); ylabel('f(x)');                                               % Labelling X-axis and Y-axis
title('Lagrangesches Interpolationspolynom vom Grad 4')
zoom on; grid on;                                                          % Enable zoom, grid 

% Figure fuer Grad 80
figure (3)                                                                 
plot([x_node_neu,x_node_neu],[f_node_neu,df_node_neu],'o')                                            % Stuetzstellen
hold on;
plot(x_plot,P80,'g',x_plot,dP80,'m')                                        
plot(x_plot,f_plot,'k',x_plot,df_plot,'k--',Linewidth=2)           
legend('Stützstellen','Polynom P80','erste Ableitung Polynom P80','exakte Funktion f(x)','exakte Funktion df(x)/dx');
xlabel('x'); ylabel('f(x)');                                               % Labelling X-axis and Y-axis
title('Lagrangesches Interpolationspolynom vom Grad 80')
axis([0 4 0 0.5])
zoom on; grid on;                                                          % Enable zoom, grid 