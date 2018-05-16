function f = lagrangeIP5(ts,t,x)
% modified lagrange 
% f = displacement function (scalar)
% ts = value of t to solve for x (scalar)
% t = time (vector)
% x = sprung displacement (vector)

L5_0 = ((ts-t(2))*(ts-t(3))*(ts-t(4))*(ts-t(5))*(ts-t(6)))...
    /((t(1)-t(2))*(t(1)-t(3))*(t(1)-t(4))*(t(1)-t(5))*(t(1)-t(6)));
L5_1 = ((ts-t(1))*(ts-t(3))*(ts-t(4))*(ts-t(5))*(ts-t(6)))...
    /((t(2)-t(1))*(t(2)-t(3))*(t(2)-t(4))*(t(2)-t(5))*(t(2)-t(6)));
L5_2 = ((ts-t(1))*(ts-t(2))*(ts-t(4))*(ts-t(5))*(ts-t(6)))...
    /((t(3)-t(1))*(t(3)-t(2))*(t(3)-t(4))*(t(3)-t(5))*(t(3)-t(6)));
L5_3 = ((ts-t(1))*(ts-t(2))*(ts-t(3))*(ts-t(5))*(ts-t(6)))...
    /((t(4)-t(1))*(t(4)-t(2))*(t(4)-t(3))*(t(4)-t(5))*(t(4)-t(6)));
L5_4 = ((ts-t(1))*(ts-t(2))*(ts-t(3))*(ts-t(5))*(ts-t(6)))...
    /((t(4)-t(1))*(t(4)-t(2))*(t(4)-t(3))*(t(4)-t(5))*(t(4)-t(6)));
L5_4 = ((ts-t(1))*(ts-t(2))*(ts-t(3))*(ts-t(4))*(ts-t(6)))...
    /((t(5)-t(1))*(t(5)-t(2))*(t(5)-t(3))*(t(5)-t(4))*(t(5)-t(6)));
L5_5 = ((ts-t(1))*(ts-t(2))*(ts-t(3))*(ts-t(4))*(ts-t(5)))...
    /((t(6)-t(1))*(t(6)-t(2))*(t(6)-t(3))*(t(6)-t(4))*(t(6)-t(5)));


f = L5_0*x(1) + L5_1*x(2) + L5_2*x(3) + L5_3*x(4) + L5_4*x(5) + L5_5*x(6);
disp(f)