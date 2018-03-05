clc;
clear;
%此代码为找寻合适的线性反馈率F
A=[0 -1;2 -3];
B=[1;1];
%F=[-1,-1];
x_1=[1;3];
I=1;
c=zeros(1,7);
c(1)=1;
setlmis([]);
gama=lmivar(1,[1 0]);
Q=lmivar(1,[2,1]);
G=lmivar(2,[1,2]);
yita=lmivar(1,[1 0]);%yita=F*Q*F'

base1=newlmi;
lmiterm([-base1 1 1 Q],1,1);

base2=newlmi;
lmiterm([-base2 1 1 yita],1,1);

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
lmiterm([b1 1 1 Q],1,A','s');
lmiterm([b1 1 1 G],B,1,'s');
lmiterm([b1 1 1 Q],1,1);

b2=newlmi;
v1=1;
lmiterm([b2 1 1 Q],1,A','s');
lmiterm([b2 1 1 yita],B,B');
lmiterm([b2 1 1 Q],1,1);

c1=newlmi;
lmiterm([-c1 1 1 0],1);
lmiterm([-c1 1 2 G],1,1);
lmiterm([-c1 2 2 Q],1,1);



lmisys=getlmis;
options=[1e-5,0,100,0,0];
[tmin,xfeas]=feasp(lmisys,options,0);
%test code



gama_P=dec2mat(lmisys,xfeas,gama);
Q_P=dec2mat(lmisys,xfeas,Q);
G_P=dec2mat(lmisys,xfeas,G);
disp(inv(Q_P));
figure(1);
plot_ellipse(inv(Q_P));
yita_P=dec2mat(lmisys,xfeas,yita);

syms f1 f2;
figure(2);
ezplot([f1 f2]*Q_P*[f1 f2]'-yita);
grid on;