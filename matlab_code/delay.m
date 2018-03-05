function dx=delay(t,x,z)
tau=z(:,1);
A=[0 1;1 0];
B=[1;1];
F=[-1,-1];

dx=[ A(1)*x(1)+A(2)*x(2)+B(1)*sat(F(1)*tau(1)+F(2)*tau(2))
    A(3)*x(1)+A(4)*x(2)+B(2)*sat(F(1)*tau(1)+F(2)*tau(2))];
end


