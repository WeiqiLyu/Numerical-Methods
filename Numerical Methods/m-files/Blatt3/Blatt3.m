% Skript, das alle Aufgaben des dritten Arbeitsblattes berechnet!
clc;
clear all;
close all;

format long;

addpath('C:\Users\xshys\Desktop\2022WS\Numerical Methods\m-files\Blatt3\');

%% testen Funktion I und Fkuntion II
val1 = linquadref(0,0);
val2 = linquadref(0.577,-0.577);
deriv1 = linquadderivref(0,0);
deriv2 = linquadderivref(0.577,-0.577);
mtest();    % Modultest

%% Approximieren die Funktionswert f 
f = [0.0 1.0 3.0 1.0];                       % Funktionswerte an den vier Knoten
fL = @(xi,eta)dot(f,linquadref(xi,eta));     % fL = fi * Ni
fL1 = fL(0,0);
fL2 = fL(0.577,-0.577);

%% Approximieren die Ableitungen der Funktion f
dfL = @(xi,eta)(f*linquadderivref(xi,eta));  % dfL = [dfL/dxi, dfL/deta]
dfL1 = dfL(0,0);                      
dfL2 = dfL(0.577,-0.577);




