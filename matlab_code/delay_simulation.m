tau=[0.1 2];
history=[0.5 1]';
tspan=[0 50];
sol=dde23(@delay,tau,history,tspan);
figure('numbertitle','off','name','delay_simulation')
plot(sol.x,sol.y(1,:),'--r');
hold on;
plot(sol.x,sol.y(2,:),'-b');