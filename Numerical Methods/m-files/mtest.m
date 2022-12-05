% pruefen den Rueckgabewert von Funktionen mit vorgegebenen Ergebnis 
tol = 1.0e-12; %toleranz
fprintf('################################## Modultest #######################################\n')

% pruefen Fkt A
if facultaet(0)-1 <= tol
    fprintf('001:     Testing function <Fkt A:    facultaet_0>...passed (= 1, tol = 1e-12)!\n')
else 
    diff = facultaet(0)-1;
    fprintf('003:     Testing function <Fkt A:    facultaet_0>...failed (%d ~= 1,diff=%d)\n',facultaet(0),diff)
end

if facultaet(5)-120 <= tol
    fprintf('002:     Testing function <Fkt A:    facultaet_5>...passed (= 120, tol = 1e-12)!\n')
else
    diff = facultaet(5)-120;
    fprintf('003:     Testing function <Fkt A:    facultaet_0>...failed (%d ~= 1,diff=%d)\n',falcutaet(5),diff)
end

% pruefen Fkt I
diff = norm(linquadref(0,0)- [0.25;0.25;0.25;0.25]);
if diff <= tol
    fprintf('004:     Testing function <Fkt I:    linquadref(0,0)>...passed (= [0.25;0.25;0.25;0.25], tol = 1e-12)!\n')
else 
    fprintf('006:     Testing function <Fkt I:    linquadref(0,0)>...failed (%d ~= [0.25;0.25;0.25;0.25],diff=%d)\n',linquadref(0,0),diff)
end

diff = norm(linquadref(0.577,-0.577)- [0.16676775;0.62173225;0.16676775;0.04473225]);
if diff <= tol
    fprintf('005:     Testing function <Fkt I:    linquadref(0.577,-0.577)>...passed (= [0.16676775;0.62173225;0.16676775;0.04473225], tol = 1e-12)!\n')
else 
    fprintf('006:     Testing function <Fkt I:    linquadref(0.577,-0.577)>...failed (%d ~= [0.16676775;0.62173225;0.16676775;0.04473225],diff=%d)\n',linquadref(0.577,-0.577),diff)
end

% pruefen Fkt II
diff = norm(linquadderivref(0,0)- [-0.25 -0.25;0.25 -0.25;0.25 0.25;-0.25 0.25]);
if diff <= tol
    fprintf('006:     Testing function <Fkt II:   linquadderivref(0,0)>...passed (= [-0.25 -0.25;0.25 -0.25;0.25 0.25;-0.25 0.25], tol = 1e-12)!\n')
else 
    fprintf('008:     Testing function <Fkt II:   linquadderivref(0,0)>...failed (%d ~= [-0.25 -0.25;0.25 -0.25;0.25 0.25;-0.25 0.25],diff=%d)\n',linquadderivref(0,0),diff)
end

diff = norm(linquadderivref(0.577,-0.577)- [-0.39425 -0.10575;0.39425 -0.39425;0.10575 0.39425;-0.10575 0.10575]);
a = 0.10575;
b = 0.39425;
if diff <= tol
    fprintf('007:     Testing function <Fkt II:   linquadderivref(0.577,-0.577)>...passed (= [%d %d;%d %d;%d %d;%d %d], tol = 1e-12)!\n',-b,-a,b,-b,a,b,-a,a)
else 
    fprintf('008:     Testing function <Fkt II:   linquadderivref(0.577,-0.577)>...failed (%d ~= [%d %d;%d %d;%d %d;%d %d],diff=%d)\n',linquadderivref(0.577,-0.577),-b,-a,b,-b,a,b,-a,a,diff)
end

% pruefen Fkt III
diff = norm(gx(3)- [-0.774596669241483,0,0.774596669241483]);
if diff <= tol
    fprintf('008:     Testing function <Fkt III:  gx(3)>...passed (= [-0.774596669241483,0,0.774596669241483], tol = 1e-12)!\n')
else 
    fprintf('010:     Testing function <Fkt III:  gx(3)>...failed (%d ~= [-0.774596669241483,0,0.774596669241483],diff=%d)\n',gx(3),diff)
end

% pruefen Fkt IV
diff = norm(gw(3)- [0.555555555555556,0.888888888888889,0.555555555555556]);
if diff <= tol
    fprintf('009:     Testing function <Fkt IV:   gw(3)>...passed (= [0.555555555555556,0.888888888888889,0.555555555555556], tol = 1e-12)!\n')
else 
    fprintf('010:     Testing function <Fkt IV:   gw(3)>...failed (%d ~= [0.555555555555556,0.888888888888889,0.555555555555556],diff=%d)\n',gw(3),diff)
end

% pruefen Fkt V
diff = norm(gx2dref(1)- [0,0]);
if diff <= tol
    fprintf('010:     Testing function <Fkt V:    gx2dref(1)>...passed (= [0,0], tol = 1e-12)!\n')
else 
    fprintf('012:     Testing function <Fkt V:    gx2dref(1)>...failed (%d ~= [0,0],diff=%d)\n',gx2dref(1),diff)
end

a = 0.577350269189626;
diff = norm(gx2dref(2)- [-a,-a;-a,a;a,-a;a,a]);
if diff <= tol
    fprintf('011:     Testing function <Fkt V:    gx2dref(2)>...passed (= [%d %d;%d %d;%d %d;%d %d], tol = 1e-12)!\n',-a,-a,-a,a,a,-a,a,a)
else 
    fprintf('012:     Testing function <Fkt V:    gx2dref(2)>...failed (%d ~= [%d %d;%d %d;%d %d;%d %d],diff=%d)\n',gx2dref(2),-a,-a,-a,a,a,-a,a,a,diff)
end

% pruefen Fkt VI
diff = norm(gw2dref(1)- 4);
if diff <= tol
    fprintf('012:     Testing function <Fkt VI:   gw2dref(1)>...passed (= 4, tol = 1e-12)!\n')
else 
    fprintf('014:     Testing function <Fkt VI:   gw2dref(1)>...failed (%d ~= 4,diff=%d)\n',gw2dref(1),diff)
end

diff = norm(gw2dref(2)- [1;1;1;1]);
if diff <= tol
    fprintf('013:     Testing function <Fkt VI:   gw2dref(2)>...passed (= [1;1;1;1], tol = 1e-12)!\n')
else 
    fprintf('014:     Testing function <Fkt VI:   gw2dref(2)>...failed (%d ~= [1;1;1;1],diff=%d)\n',gw2dref(2),diff)
end

% pruefen Fkt VII
diff = norm(getxPos([2,1;4,1;4,3;2,2],0.577,-0.577)- [3.577,1.37826775]);
if diff <= tol
    fprintf('014:     Testing function <Fkt VII:  getxPos([2,1;4,1;4,3;2,2],0.577,-0.577)>...passed (= [3.577,1.37826775], tol = 1e-12)!\n')
else 
    fprintf('015:     Testing function <Fkt VII:  getxPos([2,1;4,1;4,3;2,2],0.577,-0.577)>...failed (%d ~= [3.577,1.37826775],diff=%d)\n',getxPos([2,1;4,1;4,3;2,2],0.577,-0.577),diff)
end

% pruefen Fkt VIII
[J, detJ, invJ] = getJacobian([2,1;4,1;4,3;2,2],0.577,-0.577);
diff = norm(J- [1,0;0.10575,0.89425]);
if diff <= tol
    fprintf('015:     Testing function <Fkt VIII: getJacobian([2,1;4,1;4,3;2,2],0.577,-0.577)>...passed (= [1,0;0.10575,0.89425], tol = 1e-12)!\n')
else 
    fprintf('018:     Testing function <Fkt VIII: getJacobian([2,1;4,1;4,3;2,2],0.577,-0.577)>...failed (%d ~= [1,0;0.10575,0.89425],diff=%d)\n',J,diff)
end

diff = norm(detJ- 0.89425);
if diff <= tol
    fprintf('016:     Testing function <Fkt VIII: getJacobian([2,1;4,1;4,3;2,2],0.577,-0.577)>...passed (= 0.89425, tol = 1e-12)!\n')
else 
    fprintf('018:     Testing function <Fkt VIII: getJacobian([2,1;4,1;4,3;2,2],0.577,-0.577)>...failed (%d ~= 0.89425,diff=%d)\n',detJ,diff)
end

diff = norm(invJ- [1,0;-0.118255521386637,1.118255521386637]);
if diff <= tol
    fprintf('017:     Testing function <Fkt VIII: getJacobian([2,1;4,1;4,3;2,2],0.577,-0.577)>...passed (= [1,0;-0.118255521386637,1.118255521386637], tol = 1e-12)!\n')
else 
    fprintf('018:     Testing function <Fkt VIII: getJacobian([2,1;4,1;4,3;2,2],0.577,-0.577)>...failed (%d ~= [1,0;-0.118255521386637,1.118255521386637],diff=%d)\n',invJ,diff)
end

% pruefen Fkt IX
[LHS, RHS] = OST(0.5,0.2,[1.1],[1.4,1.5],[1.7,1.8],[2.0]);
diff = norm(LHS- 0.96);
if diff <= tol
    fprintf('018:     Testing function <Fkt IX:   OST(0.5,0.2,[1.1],[1.4,1.5],[1.7,1.8],[2.0])>...passed (= 0.96, tol = 1e-12)!\n')
else 
    fprintf('020:     Testing function <Fkt IX:   OST(0.5,0.2,[1.1],[1.4,1.5],[1.7,1.8],[2.0])>...failed (%d ~= 0.96,diff=%d)\n',LHS,diff)
end

diff = norm(RHS- 2.85);
if diff <= tol
    fprintf('019:     Testing function <Fkt IX:   OST(0.5,0.2,[1.1],[1.4,1.5],[1.7,1.8],[2.0])>...passed (= 2.85, tol = 1e-12)!\n')
else 
    fprintf('020:     Testing function <Fkt IX:   OST(0.5,0.2,[1.1],[1.4,1.5],[1.7,1.8],[2.0])>...failed (%d ~= 2.85,diff=%d)\n',RHS,diff)
end

% pruefen Fkt X
[LHS, RHS] = AB2(0.2,[1.1],[1.5,1.6],[1.8,1.9],[2.0,2.1]);
diff = norm(LHS- 1.1);
if diff <= tol
    fprintf('020:     Testing function <Fkt X:    AB2(0.2,[1.1],[1.5,1.6],[1.8,1.9],[2.0,2.1])>...passed (= 1.1, tol = 1e-12)!\n')
else 
    fprintf('022:     Testing function <Fkt X:    AB2(0.2,[1.1],[1.5,1.6],[1.8,1.9],[2.0,2.1])>...failed (%d ~= 1.1,diff=%d)\n',LHS,diff)
end

diff = norm(RHS- 3.114);
if diff <= tol
    fprintf('021:     Testing function <Fkt X:    AB2(0.2,[1.1],[1.5,1.6],[1.8,1.9],[2.0,2.1])>...passed (= 3.114, tol = 1e-12)!\n')
else 
    fprintf('022:     Testing function <Fkt X:    AB2(0.2,[1.1],[1.5,1.6],[1.8,1.9],[2.0,2.1])>...failed (%d ~= 3.114,diff=%d)\n',RHS,diff)
end

% pruefen Fkt XI
[LHS, RHS] = AM3(0.2,[1.1],[1.4,1.5,1.6],[1.7,1.8,1.9],[2.0,2.1]);
diff = norm(LHS- 0.983333333333333);
if diff <= tol
    fprintf('022:     Testing function <Fkt XI:   AM3(0.2,[1.1],[1.4,1.5,1.6],[1.7,1.8,1.9],[2.0,2.1])>...passed (= 0.983333333333333, tol = 1e-12)!\n')
else 
    fprintf('024:     Testing function <Fkt XI:   AM3(0.2,[1.1],[1.4,1.5,1.6],[1.7,1.8,1.9],[2.0,2.1])>...failed (%d ~= 0.983333333333333,diff=%d)\n',LHS,diff)
end

diff = norm(RHS- 2.894);
if diff <= tol
    fprintf('023:     Testing function <Fkt XI:   AM3(0.2,[1.1],[1.4,1.5,1.6],[1.7,1.8,1.9],[2.0,2.1])>...passed (= 2.894, tol = 1e-12)!\n')
else 
    fprintf('024:     Testing function <Fkt XI:   AM3(0.2,[1.1],[1.4,1.5,1.6],[1.7,1.8,1.9],[2.0,2.1])>...failed (%d ~= 2.894,diff=%d)\n',RHS,diff)
end

% pruefen Fkt XII
[LHS, RHS] = BDF2(0.2,[1.1],[1.4],[1.7],[2.0,2.1]);
diff = norm(LHS- 1.37);
if diff <= tol
    fprintf('024:     Testing function <Fkt XII:  BDF2(0.2,[1.1],[1.4],[1.7],[2.0,2.1])>...passed (= 1.37, tol = 1e-12)!\n')
else 
    fprintf('026:     Testing function <Fkt XII:  BDF2(0.2,[1.1],[1.4],[1.7],[2.0,2.1])>...failed (%d ~= 1.37,diff=%d)\n',LHS,diff)
end

diff = norm(RHS- 3.585);
if diff <= tol
    fprintf('025:     Testing function <Fkt XII:  BDF2(0.2,[1.1],[1.4],[1.7],[2.0,2.1])>...passed (= 3.585, tol = 1e-12)!\n')
else 
    fprintf('026:     Testing function <Fkt XII:  BDF2(0.2,[1.1],[1.4],[1.7],[2.0,2.1])>...failed (%d ~= 3.585,diff=%d)\n',RHS,diff)
end