function dx=ddefun(t,x,z)
tau1=z(:,1);
tau2=z(:,1);
dx=[1-3*x(1)-tau1(2)-0.2*tau2(1)^3-tau2(1)
    x(3)
    4*x(1)-2*x(2)-3*x(3)];
end

