function [x, iter] = solveCG(A, b, x0, rtol, itermax)
% lösen lineares Gleichungssystem Ax = b mit konjugierten Gradienten-Methode
% A: Matrix-(n*n), symmetrische positive definite Matrizen
% b: Vektor-(n*1)
% x: Vektor-(n*1)
% der maximale Wert der l_2-Norm des Residuenvektors ||r(k)||_2 < rtol
% itermax: maximal Anzahl an Iteration
if A == transpose(A)
    k = 0;
    x = x0;
    r0 = b - A * x;
    p = r0;
    while (norm(r0,2) > rtol) && (k < itermax)
        v = A * p;
        alpha = (r0' * r0) / (p' * v);       % Relaxionsparameter
        x = x + alpha * p;
        r1 = r0 - alpha * v;
        beta = (r1' * r1) / (r0' * r0);
        p = r1 + beta * p;
        k = k + 1;
        r0 = r1;
    end
    iter = k;
else
    disp('Matrizen A sollte  symmetrisch, positiv definit sein.')
end
end