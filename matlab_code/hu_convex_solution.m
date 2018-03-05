function []=hu_convex_solution(x_1)
A=[0,1;1,0];
B=[0;5];
F=[-2,-1];
%x_1=[-1;0.8];

I=1;
c=[1 0 0 0 0 0];
setlmis([]);
gama=lmivar(1,[1 0]);
Q=lmivar(1,[2,1]);
G=lmivar(2,[1,2]);

a1=newlmi;
lmiterm([-a1 1 1 gama],1,1)
lmiterm([-a1 2 1 0],x_1);
lmiterm([-a1 2 2 Q],1,1);

a2=newlmi;
lmiterm([-a2 1 1 gama],1,1);
lmiterm([-a2 2 1 0],-x_1);
lmiterm([-a2 2 2 Q],1,1);

b1=newlmi;
v0=0;
lmiterm([b1 1 1 Q],1,A','s');
lmiterm([b1 1 1 Q],B*v0*F,1,'s');
lmiterm([b1 1 1 G],B*(I-v0),1,'s');


b2=newlmi;
v1=1;
lmiterm([b2 1 1 Q],1,A','s');
lmiterm([b2 1 1 Q],B*v1*F,1,'s');
lmiterm([b2 1 1 G],B*(I-v1),1);
lmiterm([b2 1 1 -G],1,(I-v1)*B');

c1=newlmi;
lmiterm([-c1 1 1 0],1);
lmiterm([-c1 1 2 G],1,1);
lmiterm([-c1 2 2 Q],1,1);

d1=newlmi;
lmiterm([-d1 1 1 gama],1,1);

lmisys=getlmis;
options=[1e-5,0,0,0,0];
[tmin,xfeas]=mincx(lmisys,c,options);
%[tmin,xfeas]=feasp(lmisys,[0,0,20,0,0],-2);
gama_P=dec2mat(lmisys,xfeas,gama);
Q_P=dec2mat(lmisys,xfeas,Q);
G_P=dec2mat(lmisys,xfeas,G);
disp(inv(Q_P));
plot_P=inv(Q_P);
plot_ellipse(plot_P);
hold on;
end