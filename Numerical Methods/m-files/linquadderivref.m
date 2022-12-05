function deriv = linquadderivref(xi,eta)
% zurueckgeben, alle Ableitungen der Ansatzfunktionen als Matrix
% deriv ist die Ableitungen der Lagrange-Polynome ausgewertet im Punkt (xi,eta)
deriv = zeros(4,2);
%Ableitung nach xi
deriv(1,1) = -1/4 * (1-eta);
deriv(2,1) = 1/4 * (1-eta);
deriv(3,1) = 1/4 * (1+eta);
deriv(4,1) = -1/4 * (1+eta);
%Ableitung nach eta
deriv(1,2) = -1/4 * (1-xi);
deriv(2,2) = -1/4 * (1+xi);
deriv(3,2) = 1/4 * (1+xi);
deriv(4,2) = 1/4 * (1-xi);
end