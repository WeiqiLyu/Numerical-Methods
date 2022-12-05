% Skript, das alle Aufgaben des sechsten Arbeitsblattes berechnet!
clc;
clear;
close all;

format long;

addpath('C:\Users\xshys\Desktop\2022WS\Numerical Methods\m-files\Blatt6\');

%% Aufgabe 1 des sechsten Blatts
phi0 = 0;                      % Anfangswert
t1 = 0 : 0.1 : 2;              % Zeitschrittlaenge delta_t = 0.1, 0.2, 0.4
t2 = 0 : 0.2 : 2;
t3 = 0 : 0.4 : 2;
phi_exakte1 = ExakteL(t1);
phi_exakte2 = ExakteL(t2);
phi_exakte3 = ExakteL(t3);

% Vorwaerts-Euler-Verfahren                     
phi_vor_euler1 =  VorEuler(0.1,phi0);  
phi_vor_euler2 =  VorEuler(0.2,phi0);
phi_vor_euler3 =  VorEuler(0.4,phi0);

% Rueckwerts-Euler-Verfahren
phi_rueck_euler1 =  RueckEuler(0.1,phi0);  
phi_rueck_euler2 =  RueckEuler(0.2,phi0);
phi_rueck_euler3 =  RueckEuler(0.4,phi0);

% Trapezregel
phi_trapez1 =  Trapez(0.1,phi0);  
phi_trapez2 =  Trapez(0.2,phi0);
phi_trapez3 =  Trapez(0.4,phi0);

%% Aufgabe 2 des sechsten Blatts
M = 1;                                    % bezug auf Aufgabe 1
B = -6;
theta = 0.5;
% Einschritt-theta-Verfahren
phi_OST1 = func_OST(theta,0.1,phi0,M,B);
phi_OST2 = func_OST(theta,0.2,phi0,M,B);
phi_OST3 = func_OST(theta,0.4,phi0,M,B);
% Adams-Bashforth-Verfahren 2.Ordnung
phi_AB2_1 = func_AB2(0.1,phi0,M,B);
phi_AB2_2 = func_AB2(0.2,phi0,M,B);
phi_AB2_3 = func_AB2(0.4,phi0,M,B);
% Adams-Moulton-Verfahren 3.Ordnung
phi_AM3_1 = func_AM3(0.1,phi0,M,B);
phi_AM3_2 = func_AM3(0.2,phi0,M,B);
phi_AM3_3 = func_AM3(0.4,phi0,M,B);
% BDF2-Verfahren
phi_BDF2_1 = func_BDF2(0.1,phi0,M,B);
phi_BDF2_2 = func_BDF2(0.2,phi0,M,B);
phi_BDF2_3 = func_BDF2(0.4,phi0,M,B);

mtest();
%% Plotting
% plotting fuer delta_t = 0.1
figure(1)
plot(t1,phi_vor_euler1,t1,phi_trapez1,t1,phi_rueck_euler1,LineWidth=1)
hold on; zoom on; grid on;
plot(t1,phi_OST1,t1,phi_AB2_1,t1,phi_AM3_1,t1,phi_BDF2_1,LineWidth=1)
plot(t1,phi_exakte1,'--k',LineWidth=2)
xlim([0,2]);ylim([0,4*10^(-3)]);
xlabel('t'); ylabel("\phi(t)");
title("Lösungen mit Zeitschrittlänge: 0.1");
legend("Euler Expl.","Trapez","Euler Impl.","OST_0.5","AB2","AM3","BDF2","exakt");

% plotting fuer delta_t = 0.2
figure(2)
plot(t2,phi_vor_euler2,t2,phi_trapez2,t2,phi_rueck_euler2,LineWidth=1)
hold on; zoom on; grid on;
plot(t2,phi_OST2,t2,phi_AB2_2,t2,phi_AM3_2,t2,phi_BDF2_2,LineWidth=1)
plot(t2,phi_exakte2,'--k',LineWidth=2)
xlim([0,2]);ylim([0,4*10^(-3)]);
xlabel('t'); ylabel("\phi(t)");
title("Lösungen mit Zeitschrittlänge: 0.2");
legend("Euler Expl.","Trapez","Euler Impl.","OST_0.5","AB2","AM3","BDF2","exakt");

% plotting fuer delta_t = 0.4
figure(3)
plot(t3,phi_vor_euler3,t3,phi_trapez3,t3,phi_rueck_euler3, LineWidth=1)
hold on; zoom on; grid on;
plot(t3,phi_OST3,t3,phi_AB2_3,t3,phi_AM3_3,t3,phi_BDF2_3,LineWidth=1)
plot(t3,phi_exakte3,'--k',LineWidth=2)
xlim([0,2]);ylim([0,9*10^(-3)]);
xlabel('t'); ylabel("\phi(t)");
title("Lösungen mit Zeitschrittlänge: 0.4");
legend("Euler Expl.","Trapez","Euler Impl.","OST_0.5","AB2","AM3","BDF2","exakt");

%% Funktionen
function dphi = DGL(t,phi)
dphi = t.^2 .* exp(-5.*t) - 6.*phi;
end

function phi = ExakteL(t)
phi = exp(-5.*t) .* (t.^2-2.*t+2) - 2.*exp(-6.*t);
end

% Vorwaerts-Euler-Verfahren
function phi =  VorEuler(delta_t,phi0)            
phi = zeros(1, 2/delta_t+1);
phi(1) = phi0;
t = 0 : delta_t : 2;
for k = 1 : 1 : length(t)-1 
    phi(k+1) = phi(k) + delta_t * DGL(t(k),phi(k));
end
end

% Rueckwerts-Euler-Verfahren
function phi =  RueckEuler(delta_t,phi0)          
phi = zeros(1, 2/delta_t+1);
phi(1) = phi0;
t = 0 : delta_t : 2;
for k = 1 : 1 : length(t)-1
    LHS = 1+6*delta_t;
    RHS = phi(k) + delta_t * t(k+1)^2 * exp(-5*t(k+1));
    phi(k+1) = RHS/LHS;
end
end

% Trapezregel
function phi =  Trapez(delta_t,phi0)              
phi = zeros(1, 2/delta_t+1);
phi(1) = phi0;
t = 0 : delta_t : 2;
for k = 1 : 1 : length(t)-1
    LHS = 1+3*delta_t;
    RHS = (1-3*delta_t)*phi(k) + 0.5*delta_t * ((t(k+1))^2*exp(-5*t(k+1)) + (t(k))^2*exp(-5*t(k)));
    phi(k+1) = RHS/LHS;
end
end

% Einschritt-theta-Verfahren
function phi = func_OST(theta,delta_t,phi0,M,B)
phi = zeros(1, 2/delta_t+1);
phi(1) = phi0;
t = 0 : delta_t : 2;
C = t.^2 .* exp(-5.*t);
for k = 1 : 1 : length(t)-1
    [LHS, RHS] = OST(theta,delta_t,M,[B,B],[C(k+1),C(k)],phi(k));
    phi(k+1)= RHS/LHS;
end
end

% Adams-Bashforth-Verfahren 2.Ordnung
function phi = func_AB2(delta_t,phi0,M,B)
phi = zeros(1, 2/delta_t+1);
phi(1) = phi0;
t = 0 : delta_t : 2;
C = t.^2 .* exp(-5.*t);
L = 1+3*delta_t;
R = (1-3*delta_t)*phi(1) + 0.5*delta_t * ((t(2))^2*exp(-5*t(2)) + (t(1))^2*exp(-5*t(1)));
phi(2) = R/L;
for k = 2 : 1 : length(t)-1
    [LHS, RHS] = AB2(delta_t,M,[B,B],[C(k),C(k-1)],[phi(k),phi(k-1)]);
    phi(k+1)= RHS/LHS;
end
end

% Adams-Moulton-Verfahren 3.Ordnung
function phi = func_AM3(delta_t,phi0,M,B)
phi = zeros(1, 2/delta_t+1);
phi(1) = phi0;
t = 0 : delta_t : 2;
C = t.^2 .* exp(-5.*t);
L = 1+3*delta_t;
R = (1-3*delta_t)*phi(1) + 0.5*delta_t * ((t(2))^2*exp(-5*t(2)) + (t(1))^2*exp(-5*t(1)));
phi(2) = R/L;
for k = 2 : 1 : length(t)-1
    [LHS, RHS] = AM3(delta_t,M,[B,B,B],[C(k+1),C(k),C(k-1)],[phi(k),phi(k-1)]);
    phi(k+1)= RHS/LHS;
end
end

% BDF2-Verfahren
function phi = func_BDF2(delta_t,phi0,M,B)
phi = zeros(1, 2/delta_t+1);
phi(1) = phi0;
t = 0 : delta_t : 2;
C = t.^2 .* exp(-5.*t);
L = 1+3*delta_t;
R = (1-3*delta_t)*phi(1) + 0.5*delta_t * ((t(2))^2*exp(-5*t(2)) + (t(1))^2*exp(-5*t(1)));
phi(2) = R/L;
for k = 2 : 1 : length(t)-1
    [LHS, RHS] = BDF2(delta_t,M,B,C(k+1),[phi(k),phi(k-1)]);
    phi(k+1)= RHS/LHS;
end
end