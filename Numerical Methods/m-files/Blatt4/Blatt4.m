% Skript, das alle Aufgaben des vierten Arbeitsblattes berechnet!
clc;
clear all;
close all;

format long;

addpath('C:\Users\xshys\Desktop\2022WS\Numerical Methods\m-files\Blatt4\');

%% Aufgabe 1: Finite-Differenzen-Approximation
x0 = 0.6;
[f_x0,df_x0] = func(x0);      % exakte Werte der Funktion und Funktionsableitung an der Stelle x0

h = 0.1;
x_node = [x0-2*h,x0-h,x0,x0+h,x0+2*h];
[f,df] = func(x_node);        % df=[f(x0-2h),f(x0-h),f(x0),f(x0+h),f(x0+2h)]    

% Zweipunkte-Formel 
df_2P = (f(3)-f(2))./h;                             % f'_2P = (f(x0)-f(x0-h))/h

% Dreipunkt-Endpunkt-Formel
df_3PE = 1./(2.*h) .* (-3.*f(3)+4.*f(4)-f(5));      %f'_3PE = 1/2h*(-3f(x0)+4f(x0+h)-f(x0+2h))

% Dreipunkt-Mittelpunkt-Formel
df_3PM = 1./(2.*h) .* (f(4)-f(2));                  %f'_3PE = 1/2h*(f(x0+h)-f(x0-h))

% Fünfpunkt-Mittelpunkt-Formel
df_5PM = 1./(12.*h) .* (f(1)-8.*f(2)+8.*f(4)-f(5)); %f'_3PE = 1/12h*(f(x0-2h)-8f(x0-h)+8f(x0+h)-f(x0+2h))

%% Aufgabe 2: Konvergenz der Finite-Differenzen-Approximation
h_neu = logspace(-5,0,500);
% Plot 1 fuer x0=0.6
x0_1 = 0.6;
figure(1)
FD(x0_1,h_neu)

% Plot 2 fuer x0=2
x0_2 = 2;
figure(2)
FD(x0_2,h_neu)

function [f,df] = func(x)
f = (x ./ (1+x)).^5;        % gegebene Funktion
df = 5 .* x.^4 ./ (1+x).^6; % exakte Ableitng der gegebenen Funktion an der Stelle x
end