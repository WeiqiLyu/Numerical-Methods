function x_num = lineintersection(P1, P2)

% die erste Gerade
k1 = (P2(2) - P1(2)) / (P2(1) - P1(1));
b1 = P1(2) - k1 * P1(1);
%f1 = k1 * x + b1;

% die zweite Gerade
k2 = 0; 
b2 = 2;
%f2 = k2 * x + b2;

% Schnittpunkt  zweier Geraden
x_num = -(b1 - b2)/(k1 - k2);
f_num = (k1*b2 - b1*k2) / (k1 - k2);
end