clc;clear;
%{
此文件针对\dot{x}=A*x(t)-B*F*x(t-\tau)
选取lyapunov方程为V(t)=x^T*Px+\int_{t-\tau}^t x(s)Sx(s)ds+\tau int_-\tau^0
int_{t+\theta}^t {\dot{x}R\dot{x}}ds d\theta
%}
A=[0 1;1 0];
B=[1;1];
F=[-1,-1];
tau=0.5;

setlmis([]);
P=lmivar(1,[2,1]);
P2=lmivar(1,[2,1]);
P3=lmivar(1,[2,1]);
R=lmivar(1,[2,1]);
S=lmivar(1,[2,1]);

base1=newlmi;
lmiterm([-base1 1 1 P],1,1);

base2=newlmi;
lmiterm([-base2 1 1 R],1,1);

base3=newlmi;
lmiterm([-base3 1 1 S],1,1);

a1=newlmi;

lmiterm([a1 1 1 R],-1,1);
lmiterm([a1 1 1 S],1,1);
lmiterm([a1 1 1 P2],1,A,'s');



lmiterm([a1 1 2 P2],-1,1);
lmiterm([a1 1 2 P],1,1);
lmiterm([a1 1 2 P3],A',1);


lmiterm([a1 1 3 P2],1,B*F);
lmiterm([a1 1 3 R],1,1);

lmiterm([a1 2 2 P3],-1,1,'s');
lmiterm([a1 2 2 R],tau*tau,1);

lmiterm([a1 2 3 P3],1,B*F);

lmiterm([a1 3 3 R],-1,1);
lmiterm([a1 3 3 S],-1,1);


lmisys=getlmis;
options=[0,0,0,0,0];
[tmin,xfeas]=feasp(lmisys,options,-1);