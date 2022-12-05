%% 2D-Plot
x = -pi:.1:pi;
y = sin(x);
plot(x,y)

% Setting the axis property
title('Plot Function f(x) = sin(x)');
ylabel('f(x) = sin(x)');
xlabel('x [rad]');
grid on;
axis([-pi pi -1.5 1.5]);

%% 3D-Plot
x = [-1; 0; 1];
y = [-1; 0; 1];

nodes =zeros(9,2);
sol =zeros(9,1);
k=1;
while k <= size(nodes,1)
    for m = 1:length(y)
        for n = 1:length(x)
            nodes(k,:) = [x(n),y(m)];
            sol(k) = x(n)^2 + y(m)^2;
            k = k+1;
        end
    end
end

%nodes(1,:) = [-1 , -1];
%nodes(2,:) = [0 , -1];
%nodes(3,:) = [1 , -1];
%nodes(4,:) = [-1 , 0];
%nodes(5,:) = [0 , 0];
%nodes(6,:) = [1 , 0];
%nodes(7,:) = [-1 , 1];
%nodes(8,:) = [0 , 1];
%nodes(9,:) = [1 , 1];

%sol = [2; 1; 2; 1; 0; 1; 2; 1; 2]

elements = zeros(4,4);
elements(1,:) = [1, 2, 5, 4];
elements(2,:) = [2, 3, 6, 5];
elements(3,:) = [4, 5, 8, 7];
elements(4,:) = [5, 6, 9, 8];

quadplot(nodes, elements, sol)



