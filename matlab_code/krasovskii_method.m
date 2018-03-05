clc;
clear;
A=[1 1.5;0.3 -2];
B=[10;1];
F=[-0.1,-0.1];
x_1=[1;1];
I=1;


setlmis([]);
gama=lmivar(1,[1,0]);
Q=lmivar(1,[2,1]);
G=lmivar(2,[1,2]);
X=lmivar(1,[2,1]);
S=lmivar(1,[1,0]);
%S=sqrt(tau*segma+1)

a1=newlmi;
lmiterm([-a1 1 1 gama],1,1);
lmiterm([-a1 1 2 S],1,x_1');
lmiterm([-a1 2 2 Q],1,1);

a2=newlmi;
lmiterm([-a2 1 1 gama],1,1);
lmiterm([-a2 1 2 S],1,-x_1');
lmiterm([-a2 2 2 Q],1,1);

b1=newlmi;
v0=0;
lmiterm([b1 1 1 Q],A,1,'s');
lmiterm([b1 1 1 G],B*(I-v0),1,'s');

lmiterm([b1 1 1 X],B*v0*F,F'*v0*B');
%lmiterm([b1 1 2 Q],1,1);
%lmiterm([b1 2 2 X],-1,1);

b2=newlmi;
v1=1;
lmiterm([b2 1 1 Q],A,1,'s');
lmiterm([b2 1 1 G],B*(I-v1),1,'s');

lmiterm([b2 1 1 X],B*v1*F,F'*v1*B');
%lmiterm([b2 1 2 Q],1,1);
%lmiterm([b2 2 2 X],-1,1);

c1=newlmi;
lmiterm([c1 1 1 0],1);
lmiterm([c1 1 2 G],1,1);
lmiterm([c1 2 2 Q],1,1);

lmisys=getlmis;
options=[1e-3,0,0,0,0];
[tmin,xfeas]=feasp(lmisys,options,0);
