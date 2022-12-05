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

%Pruefe Fkt II
diff = norm(linquadderivref(0,0)- [-0.25 -0.25;0.25 -0.25;0.25 0.25;-0.25 0.25]);
if diff <= tol
    fprintf('006:     Testing function <Fkt II:    linquadderivref(0,0)>...passed (= [-0.25 -0.25;0.25 -0.25;0.25 0.25;-0.25 0.25], tol = 1e-12)!\n')
else 
    fprintf('008:     Testing function <Fkt II:    linquadderivref(0,0)>...failed (%d ~= [-0.25 -0.25;0.25 -0.25;0.25 0.25;-0.25 0.25],diff=%d)\n',linquadderivref(0,0),diff)
end

diff = norm(linquadderivref(0.577,-0.577)- [-0.39425 -0.10575;0.39425 -0.39425;0.10575 0.39425;-0.10575 0.10575]);
a = 0.10575;
b = 0.39425;
if diff <= tol
    fprintf('007:     Testing function <Fkt II:    linquadderivref(0.577,-0.577)>...passed (= [%d %d;%d %d;%d %d;%d %d], tol = 1e-12)!\n',-b,-a,b,-b,a,b,-a,a)
else 
    fprintf('008:     Testing function <Fkt II:    linquadderivref(0.577,-0.577)>...failed (%d ~= [%d %d;%d %d;%d %d;%d %d],diff=%d)\n',linquadderivref(0.577,-0.577),-b,-a,b,-b,a,b,-a,a,diff)
end