function y=plot_ellipse(P)
figure(1);
syms x1 x2;
h=ezplot([x1 x2]*P*[x1 x2]'-1,[-10 10 -10 10]);
grid on;
title('');
end