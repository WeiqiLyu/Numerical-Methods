function []=FD(x0,h)
g1 = h; g2 = h.^2; g3 = h.^4;   %drei Referenzkurven
[f_x0,df_x0] = func(x0);
x_node =zeros(5,length(h));
f =zeros(5,length(h));
df =zeros(5,length(h));
df_2P =zeros(1,length(h));
df_3PE =zeros(1,length(h));
df_3PM =zeros(1,length(h));
df_5PM =zeros(1,length(h));
for i = 1 : length(h) 
    x_node(:,i) = [x0-2.*h(i),x0-h(i),x0,x0+h(i),x0+2.*h(i)];
    [f(:,i),df(:,i)] = func(x_node(:,i));
    df_2P(i) = (f(3,i)-f(2,i))./h(i);
    df_3PE(i) = 1./(2.*h(i)) .* (-3.*f(3,i)+4.*f(4,i)-f(5,i));
    df_3PM(i) = 1./(2.*h(i)) .* (f(4,i)-f(2,i));
    df_5PM(i) = 1./(12.*h(i)) .* (f(1,i)-8.*f(2,i)+8.*f(4,i)-f(5,i));  
end
FD2P = abs(df_x0-df_2P);
FD3PE = abs(df_x0-df_3PE);
FD3PM = abs(df_x0-df_3PM);
FD5PM = abs(df_x0-df_5PM);
loglog(h,g1,'g:',h,g2,'r-.',h,g3,'k--',Linewidth=1.5)
hold on
loglog(h,FD2P,h,FD3PE,h,FD3PM,h,FD5PM,Linewidth=1.5)
legend('h','h^2','h^4','FD2P','FD3PE','FD3PM','FD5PM');
xlabel('h'); ylabel('|f''(x=x0) - f''_{approx}(x=x0)|');
title('Konvergenzplot Finite Differenzen');
zoom on; grid on;
hold off
end

function [f,df] = func(x)
f = (x ./ (1+x)).^5;        % gegebene Funktion
df = 5 .* x.^4 ./ (1+x).^6; % exakte Ableitng der gegebenen Funktion an der Stelle x
end