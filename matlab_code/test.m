syms x y;
% h1=ezplot('0.1169*x^2+2*0.0627*x*y+0.0558*y^2=1');
% set(h1,'color','r');
% hold on;
% h2=ezplot(0.1089*x^2+2*0.0486*x*y+0.0551*y^2-1);
% set(h2,'color','b');
P=[0.5509 0.2680;0.2680 0.2699];
handle=ezplot([x y]*P*[x y]'-1);
grid on;