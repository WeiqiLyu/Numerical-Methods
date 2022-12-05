% Aufgabe 1 des zweiten Blatts
delta = logspace(-20,5,1000);
P1 = [0.0; 1.0];
P_2 = [delta; 1.0 + delta];

P_ex = [1.0; 2.0];                      %analytische exakte Schnittpunkt
x_ex = P_ex(1);
x_num = zeros(1,length(delta));
for i = 1 : length(delta) 
    P2 = P_2(:,i);
    x_num(i) = lineintersection(P1,P2);   
end

y = abs(x_ex - x_num);

% Plotting 
loglog(delta, y, 'b')    % Plotting function  
zoom on; grid on; hold on;                       % Enable zoom, grid and hold on
xlabel('\delta'); ylabel('Absoluter Fehler |x_{ex} - x_{num}|');               % Labelling X-axis and Y-axis


