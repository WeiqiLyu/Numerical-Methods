function x = solveGauss(A, b)
% lösen lineares Gleichungssystem Ax = b mit Gauß'schen Eliminationsverfahren ohne Zeilentausch
% A: Matrix-(n*n)
% b: Vektor-(n*1)
% x: Vektor-(n*1)
n = size(A,1);
x = zeros(n,1);
for i = 1 : n-1                          % for i = 1,...,n
    for j = (i + 1) : n                  % for j = i+1,i+2,...n
        m_ji = A(j,i)/A(i,i);            % Multiplikatoren m_ji = a_ji/a_ii
        A(j,:) = A(j,:) - m_ji * A(i,:);
        b(j) = b(j) - m_ji * b(i);
    end
end
% Rueckwaertseinsetzen 
x(n) = b(n)/A(n,n);                                 
for i = n-1 : -1 : 1
    s = 0;
    for j = i+1 : n
        s = s + A(i,j) * x(j);
    end
    x(i) = (b(i) - s) / A(i,i);
end

end