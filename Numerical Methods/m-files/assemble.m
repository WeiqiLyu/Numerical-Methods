function [sysmat,rhs] = assemble(elemat,elevec,sysmat,rhs,ele)
% elemat: Elementsteifigkeitsmatrix A(e):(4*4)-Matrix(i,j) fuer lineares Viereckselement
% elevec: Elementlastvektor f(e): (4*1)-Matrix
% sysmat: Systematrix A: (n*n)-Matrix
% rhs: Systemvektor f:(n*1)-Matrix
% ele: globale Knotenindex(als Zeilenvektor):(1,4)-Matrix
% Ausgang: Systemmatrix A:(n*n)-Matrix
% Ausgang: Systemvektor f:(n*1)-Matrix

for i = 1 : length(ele)
    rhs(ele(i)) = rhs(ele(i)) + elevec(i);
    for j = 1 : length(ele)
    sysmat(ele(i),ele(j)) = sysmat(ele(i),ele(j)) + elemat(i,j);
    end
end

end