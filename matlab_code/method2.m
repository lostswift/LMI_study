clc;
clear;

%方法错误，理论推不过去
A=[1 1.5;0.3 -2];
B=[10;1];
F=[-1,-1];
x_1=[1;-1];
I=1;
c=zeros(1,7);
c(1)=1;
setlmis([]);
gama=lmivar(1,[1 0]);
Q=lmivar(1,[2,1]);
G=lmivar(2,[1,2]);
S=lmivar(1,[2,1]);

base1=newlmi;
lmiterm([-base1 1 1 Q],1,1);

base2=newlmi;
lmiterm([-base2 1 1 S],1,1);

a1=newlmi;
lmiterm([-a1 1 1 gama],1,1);
lmiterm([-a1 2 1 0],x_1);
lmiterm([-a1 2 2 Q],1,1);

a2=newlmi;
lmiterm([-a2 1 1 gama],1,1)
lmiterm([-a2 2 1 0],-x_1);
lmiterm([-a2 2 2 Q],1,1);

b1=newlmi;
v0=0;
lmiterm([b1 1 1 Q],A,1,'s');
lmiterm([b1 1 1 G],B*(I-v0),1,'s');
lmiterm([b1 1 1 S],B*v0*F,1,'s');

b2=newlmi;
v1=1;
lmiterm([b2 1 1 Q],A,1,'s');
lmiterm([b2 1 1 G],B*(I-v1),1,'s');
lmiterm([b2 1 1 S],B*v1*F,1,'s');

c1=newlmi;
lmiterm([-c1 1 1 0],1);
lmiterm([-c1 1 2 G],1,1);
lmiterm([-c1 2 2 Q],1,1);

lmisys=getlmis;
options=[1e-5,0,10,0,0];
[tmin,xfeas]=feasp(lmisys,options,0);

Q_P=dec2mat(lmisys,xfeas,Q);
S_P=dec2mat(lmisys,xfeas,S);
disp(Q_P);
plot_ellipse(inv(Q_P));