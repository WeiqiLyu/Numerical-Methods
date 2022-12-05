function [LHS, RHS] = BDF2(timestep,M,B,C,sol)
% BDF2-Verfahren fuer skalare, lineare DGL Mdphi=B(t)phi(t)+C(t)
% M=M, B=B(t(n+1)), C=C(t(n+1)), sol=[phi(t(n)),phi(t(n-1))]
% Ausgang: Zeilenvektor mit LHS, RHS
LHS = 3/2*M-B*timestep;
RHS = 2*M*sol(1) - 0.5*M*sol(2) +timestep*C;
end