clc;clear;
A=[0 1;1 0];
B=[1;1];
F=[-1 -1];
tau=0.05;
I=eye(2);

setlmis([]);
Q=lmivar(1,[2 1]);
M1=lmivar(1,[2 1]);
M2=lmivar(1,[2 1]);

base1=newlmi;
lmiterm([-base1 1 1 Q],1,1);

base2=newlmi;
lmiterm([-base2 1 1 M1],1,1);

base3=newlmi;
lmiterm([-base3 1 1 M2],1,1);


a1=newlmi;
lmiterm([a1 1 1 Q],A+B*F,1,'s');
lmiterm([a1 1 1 Q],2*tau,1);
lmiterm([a1 1 1 M1],tau*B*F,F'*B');
lmiterm([a1 1 1 M2],tau*B*F,F'*B');

b1=newlmi;
lmiterm([-b1 1 1 Q],1,1);
lmiterm([-b1 2 1 Q],A,1);
lmiterm([-b1 2 2 M1],1,1);

b2=newlmi;
lmiterm([-b2 1 1 Q],1,1);
lmiterm([-b2 2 1 Q],B*F,1);
lmiterm([-b2 2 2 M2],1,1);


lmisys=getlmis;
options=[1e-3,0,0,0,0];
[tmin,xfeas]=feasp(lmisys,options,-1);
Q_P=dec2mat(lmisys,xfeas,Q);
M1_P=dec2mat(lmisys,xfeas,M1);

disp(eig(Q_P));
