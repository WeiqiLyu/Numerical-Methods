function [LHS, RHS] = AM3(timestep,M,B,C,sol)
% Adams-Moulton-Verfahren 3.Ordnung fuer skalare, lineare DGL Mdphi=B(t)phi(t)+C(t)
% M=M, B=[B(t(n+1)),B(t(n)),B(t(n-1))], C=[C(t(n+1)),C(t(n)),C(t(n-1))],
% sol=[phi(t(n)),phi(t(n-1))]
% Ausgang: Zeilenvektor mit LHS, RHS
LHS = M - 5/12*B(1)*timestep;
RHS = (M + 2/3*B(2)*timestep)*sol(1) - 1/12*B(3)*timestep*sol(2) + timestep*(5/12*C(1)+2/3*C(2)-C(3)/12);
end