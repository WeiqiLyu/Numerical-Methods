function [LHS, RHS] = OST(theta,timestep,M,B,C,sol)
% Einschritt-theta-Verfahren fuer skalare, lineare DGL Mdphi=B(t)phi(t)+C(t)
% M=M, B=[B(t(n+1)),B(t(n))], C=[C(t(n+1)),C(t(n))], sol=phi(t(n))
% Ausgang: Zeilenvektor mit LHS, RHS
LHS = M - theta*timestep*B(1);
RHS = (M + (1-theta)*timestep*B(2))*sol + timestep*(theta*C(1) + (1-theta)*C(2));
end