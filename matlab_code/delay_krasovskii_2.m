clear;clc;
%{
此文件为纯时滞环节的完全体lmi方程
%}
A=[0 1;1 0];
B=[1;1];
F=[-1,-1];
tau=0.5;
alpha=0.1;
E=exp(-2*alpha*tau);

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

a=newlmi;
lmiterm([a 1 1 S],1,1);
lmiterm([a 1 1 P],2*alpha,1);
lmiterm([a 1 1 R],-1,E);
lmiterm([a 1 1 P2],1,A,'s');

lmiterm([a 1 2 P],1,1);
lmiterm([a 1 2 P2],-1,1);
lmiterm([a 1 2 P3],A',1);

lmiterm([a 1 3 R],1,E);
lmiterm([a 1 3 P2],1,B*F);

lmiterm([a 2 2 P3],-1,1,'s');
lmiterm([a 2 2 R],tau,tau);

lmiterm([a 2 3 P3],1,B*F);

lmiterm([a 3 3 S],-1,E);
lmiterm([a 3 3 R],-1,E);

lmisys=getlmis;
options=[0 0 0 0 0];
[tmin,xfeas]=feasp(lmisys,options,-1);