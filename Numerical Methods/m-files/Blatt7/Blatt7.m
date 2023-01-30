% Skript, das alle Aufgaben des siebsten Arbeitsblattes berechnet!
clc;
clear;
close all;

format long;

addpath('C:\Users\xshys\Desktop\2022WS\Numerical Methods\m-files\Blatt7\');

r = 0.02;   % Einheit:m
b = 0.3;    % Einheit:m
h = 0.3;    % Einheit:m
r_neu = r + 0.01*6;

T1 = 600;   % Einheit:K, Dirichlet-Rand 1
T2 = 300;   % Einheit:K, Dirichlet-Rand 2
Tk = 450;   % Einheit:K, maxima; zulaessige Temperatur

nodes = [0,0                            % node 1
         b/3,0                          % node 2
         2*b/3,0                        % node 3
         b,0                            % node 4
         0,h/3                          % node 5
         b/3,h/3                        % node 6
         2*b/3,h/3                      % node 7  
         b,h/3                          % node 8
         0,2*h/3                        % node 9
         b/3,2*h/3                      % node 10
         2*b/3,2*h/3                    % node 11
         b-r_neu*sin(pi/6),h-r_neu*cos(pi/6)    % node 12
         b,h-r_neu                          % node 13
         b-r_neu*cos(pi/6),h-r_neu*sin(pi/6)    % node 14
         0,h                            % node 15
         b/3,h                          % node 16
         b/2,h                          % node 17  
         b-r_neu,h                          % node 18
         ];

elements = [1,2,6,5                     % Zeile: Element, Spalte:Knotenindex
            2,3,7,6
            3,4,8,7
            5,6,10,9
            6,7,11,10
            7,12,14,11
            7,8,13,12
            9,10,16,15
            10,11,17,16
            11,14,18,17];

dbc = [1,T1;2,T1;3,T1;4,T1;12,T2;13,T2;14,T2;18,T2];

elenodes = zeros(4,2);
sysmat = zeros(18,18);                       % nicht eye-Matrix
rhs = zeros(18,1);

gpx = gx2dref(2);
gpw = gw2dref(2);
for i = 1 : size(elements,1)
    ele = elements(i,:);                     % i-th Element
    for j = 1 : length(ele)
        elenodes(j,:) = nodes(ele(j),:);     % j-th Node
    end
    [elemat,elevec]=evaluate_stat(elenodes,gpx,gpw); % berechnen A(e) und f(e)
    [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele);% berechnen assemblierte globale A und f
end
%%% auf anderer Weise
% for i = 1:size(ele,1)
%     [elemat,elevec] = evaluate(nodes(ele(i,:),:),gx2dref(2),gw2dref(2));
%     [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele(i,:));
% end

% beruecksichtigen die Dirichlet Raender in A und f
[sysmat,rhs] = assignDBC(sysmat,rhs,dbc);

% Loesen das Gleichungssystem AT = f
T = sysmat\rhs;

% Plotting 
quadplot(nodes, elements, T)
shading interp;
colormap hot;
colorbar;