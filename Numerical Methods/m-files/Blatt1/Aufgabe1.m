
A = 3 * eye(4)
v = (1:4)'

a = dot(v,v)

B = v * v'

C = A * B

lambda = eig(C)

x = (C-A)\(a*v)

C(:,2) = v

b = C(3,:)'

c = (10:0.5:100)

%f= zeros(1,length(c));
%for n = 1:length(c)
%    f(n) = c(n)*(5+c(n)) +1/c(n) + 2^(c(n));
%end

f = c .* (5 + c) + 1 ./ c + 2.^c

lf = length(f)

