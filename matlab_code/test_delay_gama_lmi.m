function [flag]=test_delay_gama_lmi(gama)
A=[1.1,-0.6;0.5,-1];
B=[1;1];
F=[-2,-1];
x_1=[3;1];
I=1;
% c=zeros(1,9);
% c(1)=1;
setlmis([]);
% gama=lmivar(1,[1 0]);
Q=lmivar(1,[2,1]);
G=lmivar(2,[1,2]);
W=lmivar(1,[2,1]);

base1=newlmi;
lmiterm([-base1 1 1 Q],1,1);

a1=newlmi;
lmiterm([-a1 1 1 0],gama);
lmiterm([-a1 2 1 0],x_1);
lmiterm([-a1 2 2 Q],1,1);

a2=newlmi;
lmiterm([-a2 1 1 0],gama)
lmiterm([-a2 2 1 0],-x_1);
lmiterm([-a2 2 2 Q],1,1);

b1=newlmi;
v0=0;
lmiterm([b1 1 1 Q],1,A','s');
lmiterm([b1 1 1 G],B*(I-v0),1,'s');
lmiterm([b1 1 1 W],B*v0*F,F'*v0*B');
lmiterm([b1 1 1 Q],1,1);

b2=newlmi;
v1=1;
lmiterm([b1 1 1 Q],1,A','s');
lmiterm([b1 1 1 G],B*(I-v1),1,'s');
lmiterm([b1 1 1 W],B*v1*F,F'*v1*B');
lmiterm([b1 1 1 Q],1,1);

c1=newlmi;
lmiterm([-c1 1 1 0],1);
lmiterm([-c1 2 1 -G],1,1);
lmiterm([-c1 2 2 Q],1,1);

d1=newlmi;
lmiterm([d1 1 1 Q],1,1);
lmiterm([d1 1 1 W],-1,1);

lmisys=getlmis;
options=[1e-5,0,10,0,0];
%[tmin,xfeas]=mincx(lmisys,c,options);
[tmin,xfeas]=feasp(lmisys,[0,0,5,0,1],-2);
%test code
if tmin<0
    flag=1;
else
    flag=0;
end



% gama_P=dec2mat(lmisys,xfeas,gama);
% Q_P=dec2mat(lmisys,xfeas,Q);
% G_P=dec2mat(lmisys,xfeas,G);
% disp(inv(Q_P));
% plot_ellipse(inv(Q_P));
% disp(norm(inv(Q_P)));
end