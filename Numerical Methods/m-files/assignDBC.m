function [sysmat,rhs] = assignDBC(sysmat,rhs,dbc)
% sysmat: assemblierte globale Systemmatrix A: (n*n)-Matrix
% rhs: assemblierte globale Systemvektor f:(n*1)-Matrix
% dbc: Zeile:Dirichlet Randbedingung-Matrix; Spalte:[Knotenindex,Wert]
% Ausgang: Systemmatrix A:(n*n)-Matrix
% Ausgang: Systemvektor f:(n*1)-Matrix
eyematrix = eye(size(sysmat,1),size(sysmat,1));
for i = 1 : size(dbc,1)
    rhs(dbc(i,1)) = dbc(i,2);
    for j = 1 : size(dbc,1)
    sysmat(dbc(i,1),:) = eyematrix(dbc(i,1),:);
    end
end

end