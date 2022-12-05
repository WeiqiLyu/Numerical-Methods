function quadplot(nodes, elements, sol)
T=[1,2,3;3,4,1];
for n = 1 : size(elements,1)
    x_plot = nodes(elements(n,:),1);
    y_plot = nodes(elements(n,:),2);
    z_plot = sol(elements(n,:));
    trisurf(T,x_plot,y_plot,z_plot)
    hold on
end

xlabel('x');
ylabel('y');
zlabel('f(x,y)');
axis([-1 1 -1 1 0 2.5]);
    
    %for n = 1:2:2*size(elements,1)
    %T(n,:) = elements(k, 1:3);
    %T(n+1,:) = elements(k, 2:4);
    %k = k+1;
    %end
end