function [sysmat,rhs] = assignDBC(sysmat,rhs,dbc)
% sysmat: assemblierte globale Systemmatrix A: (n*n)-Matrix
% rhs: assemblierte globale Systemvektor f:(n*1)-Matrix
% dbc: Zeile:Dirichlet Randbedingung-Matrix; Spalte:[Knotenindex,Wert]
% Ausgang: Systemmatrix A:(n*n)-Matrix
% Ausgang: Systemvektor f:(n*1)-Matrix

for i = 1 : size(dbc,1)
    sysmat(dbc(i,1),:)=0;
    sysmat(dbc(i,1),dbc(i,1))=1;
    rhs(dbc(i,1))=dbc(i,2);
end

end