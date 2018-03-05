clc;clear;
for i=0:pi/8:pi
    x=[sin(i),cos(i)]';
    hu_convex_solution(x);
end
