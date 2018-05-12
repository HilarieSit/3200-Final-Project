function dy = dydtsys(t, y)
% t = time (scalar)
% y(1) = position of sprung mass, x_s
% y(2) = velocity sprung mass, xdot_s
% y(3) = position of unspring mass, x_u
% y(4) = velocity unpsrung mass, xdot_u


% given values of mass, stiffness, and damping coefficients
ms = 236.12;
mu = 23.61;
kt = 181818.88;
ct = 13.854;

% coefficients of spring force and damping force equations
% deteremined using least squares fit
k1 = 0.0124*10^6;
k2 = -0.0737*10^6;
k3 = 3.1704*10^6;
c1 = 905.2896;
c2 = 254.2550;

delta_x = y(1) - y(3);      % aggregate displacement
delta_xdot = y(2) - y(4);   % aggregate velocity

% spring force and damping force equations
Fsp = k1*delta_x + k2*delta_x^2 + k3*delta_x^3;
Fd = c1*delta_xdot + c2*delta_xdot^2;

% road profile characteristics
A = 0.1;
L = 5.2;
V = 10;
T = L/(V*1000/3600);
w = pi/T;
q = A*sin(w*t);
qdot = A*w*cos(w*t);

% define system of 4 ODEs to solve
dy = [y(2); (-Fsp - Fd)/ms; y(4); (kt*(q - y(3)) + ...
    ct*(qdot - y(4)) + Fsp + Fd)/mu];

% CAN DELETE THIS PART?
%{
dx = [x(2); (1/236.12)*(-0.0124e-06*x(2)+0.0737e-6*x(2)-3.1704e-6*x(2)...
    -0.0491-905.2896*x(1)-254.1860*x(1)); x(4); (1/23.61)*(0.0124e-06*x(4)...
    -0.0737e-6*x(4)+3.1704e-6*x(4)+0.0491-905.2896*x(3)+254.1860*x(3)+181818.88...
    *(A*sin(w*t)-x(3))+13.854*(A*w*cos(w*t)-x(4)))];
%}
end