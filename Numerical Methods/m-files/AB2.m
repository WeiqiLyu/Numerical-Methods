function [LHS, RHS] = AB2(timestep,M,B,C,sol)
%Adams-Bashforth-Verfahren 2.Ordnung fuer skalare, lineare DGL Mdphi=B(t)phi(t)+C(t)
% M=M, B=[B(t(n)),B(t(n-1))], C=[C(t(n)),C(t(n-1))],
% sol=[phi(t(n)),phi(t(n-1))]
% Ausgang: Zeilenvektor mit LHS, RHS
LHS = M;
RHS = (M + 1.5*B(1)*timestep)*sol(1) - 0.5*B(2)*timestep*sol(2) + 0.5*(3*C(1)-C(2))*timestep;
end