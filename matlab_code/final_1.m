clc;clear;
%wait to fix
A=[0 1;1 0];
B=[1;1];
F=[-1,-1];
tau=0.5;
alpha=0;
E=exp(-2*alpha*tau);

setlmis([]);
P_=lmivar(1,[2,1]);
S_=lmivar(1,[2,1]);
R_=lmivar(1,[2,1]);
G=lmivar(2,[1,2]);
Q=lmivar(1,[2,1]);

base1=newlmi;
lmiterm([-base1 1 1 P_],1,1);
base2=newlmi;
lmiterm([-base2 1 1 S_],1,1);
base3=newlmi;
lmiterm([-base3 1 1 R_],1,1);
base4=newlmi;
lmiterm([-base4 1 1 Q],1,1);

a1=newlmi;
%a1时D_取0
lmiterm([a1 1 1 S_],1,1);
lmiterm([a1 1 1 P_],2*tau,1);
lmiterm([a1 1 1 R_],-1,E);
lmiterm([a1 1 1 Q],A,1,'s');
lmiterm([a1 1 1 G],B,1,'s');

lmiterm([a1 1 2 Q],1,A');
lmiterm([a1 1 2 P_],1,1);

lmiterm([a1 1 3 R_],1,E);

lmiterm([a1 2 2 R_],tau*tau,1);
lmiterm([a1 2 2 Q],-1,1,'s');

lmiterm([a1 3 3 S_],-1,E);
lmiterm([a1 3 3 R_],-1,E);

a2=newlmi;
%a2时D_取1
lmiterm([a2 1 1 S_],1,1);
lmiterm([a2 1 1 P_],2*tau,1);
lmiterm([a2 1 1 R_],-1,E);
lmiterm([a2 1 1 Q],A,1,'s');

lmiterm([a2 1 2 Q],1,A');
lmiterm([a2 1 2 P_],1,1);
lmiterm([a2 1 2 -G],1,B');

lmiterm([a2 1 3 R_],1,E);
lmiterm([a2 1 3 Q],B*F,1);

lmiterm([a2 2 2 R_],tau*tau,1);
lmiterm([a2 2 2 Q],-1,1,'s');

lmiterm([a2 2 3 Q],B*F,1);

lmiterm([a2 3 3 -S_],-1,E);
lmiterm([a2 3 3 -R_],-1,E);

lmisys=getlmis;
options=[0 0 0 0 0];
[tmin,xfeas]=feasp(lmisys,options,-1);