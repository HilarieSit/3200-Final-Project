function dx = dydtsys(t,x)
% t = time (scalar)
% x(1) = displacement of sprung mass, x_s
% x(2) = velocity sprung mass, xdot_s
% x(3) = displacement of unspring mass, x_u
% x(4) = velocity unpsrung mass, xdot_u
A = 0.1;
L = 5.2;
V = 10;
T = L/(V*1000/3600);
h = T/50;
w = pi/T;
ms = 236.12;
mu = 23.61;
kt = 181818.88;
ct = 13.854;
k1 = 0.0124*10^6;
k2 = -0.0737*10^6;
k3 = 3.1704*10^6;
c1 = 905.2896;
c2 = 254.2550;
delta_x = x(1) - x(3);
delta_xdot = x(2) - x(4);
Fsp = k1*delta_x + k2*delta_x^2 + k3*delta_x^3;
Fd = c1*delta_xdot + c2*delta_xdot^2;

dx = [];
%{
dx = [x(2); (1/236.12)*(-0.0124e-06*x(2)+0.0737e-6*x(2)-3.1704e-6*x(2)...
    -0.0491-905.2896*x(1)-254.1860*x(1)); x(4); (1/23.61)*(0.0124e-06*x(4)...
    -0.0737e-6*x(4)+3.1704e-6*x(4)+0.0491-905.2896*x(3)+254.1860*x(3)+181818.88...
    *(A*sin(w*t)-x(3))+13.854*(A*w*cos(w*t)-x(4)))];
%}

% dystsys contains the system of 4 ODEs to solve
% plug in velocities of 10 and 40



end