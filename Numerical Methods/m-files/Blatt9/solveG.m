function [x,iter] = solveG(A, b, x0, rtol, itermax)
% lösen lineares Gleichungssystem Ax = b mit Gradienten-Methode
% entlang des steilsten Abstiegs suchen
% A: Matrix-(n*n), symmetrische positive definite Matrizen
% b: Vektor-(n*1)
% x: Vektor-(n*1)
% der maximale Wert der l_2-Norm des Residuenvektors ||r(k)||_2 < rtol
% itermax: maximal Anzahl an Iteration
if A == transpose(A)
    k = 0;
    x = x0;
    r = b - A * x;
    while (norm(r,2) > rtol) && (k < itermax)
        v = A * r;
        alpha = (r' * r) / (r' * v);       % Relaxionsparameter
        x = x + alpha * r;
        r = r - alpha * v;
        k = k + 1;
    end
    iter = k;
else
    disp('Matrizen A sollte  symmetrisch, positiv definit sein.')
end
end