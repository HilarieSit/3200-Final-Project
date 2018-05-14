function dy = dydtsys40(t, y)
% dydtsys sets up a column vector, dy, of ODEs to solve
% t = time (scalar)
% y is a row vector
% specifically for the quarter car model (QCM):
%       y(1) = displacement of sprung mass, x_s
%       y(2) = velocity of sprung mass, xdot_s
%       y(3) = displacement of unspring mass, x_u
%       y(4) = velocity of unsprung mass, xdot_u


% given values of mass, stiffness, and damping coefficients
ms = 236.12;
% ms = 1;
% mu = 1;
mu = 23.61;
% kt = 0;
% ct = 0;
% kt = 1;
kt = 181818.88;
ct = 13.854;
% ct = 0.125;

% coefficients of spring force and damping force equations
% deteremined using least squares fit
k1 = 0.0124e+06;
k2 = -0.0737e+06;
k3 = 3.1704e+06;
c1 = 905.2896;
c2 = 254.2550;
% k1 = 1;
% k2 = 1;
% k3 = 1;
% c1 = 1;
% c2 = 1;

delta_x = y(1) - y(3);      % aggregate displacement
delta_xdot = y(2) - y(4);   % aggregate velocity

% spring force and damping force equations
% Fsp = 0;
% Fd = 0;
Fsp = k1*delta_x + k2*delta_x^2 + k3*delta_x^3;
Fd = c1*delta_xdot + c2*delta_xdot^2;

% road profile characteristics
% A = 0;
A = 0.1;    % amplitude
L = 5.2;    % length
V = 40;     % velocity = 40 km/hr
T = L/(V*1000/3600);    % time needed for car to go over bump
w = pi/T;   % natural frequency
% w = 0.5;

if t > T
    A = 0;      % eliminates sinusoidal road profile after T
end

q = A*sin(w*t);     % road profile displacement
% qdot = 0;
qdot = A*w*cos(w*t);    % road profile velocity

% define system of 4 ODEs to solve
% dy = [y(2); -kt*y(1)/ms - ct*y(2)/ms + q; y(4); -kt*y(3)/mu - ct*y(4)/mu + q];
% dy = [y(2); -kt*y(1)/ms; y(4); -kt*y(3) - c*y(4)/m];
% dy = [y(2); (-Fsp - Fd)/ms; y(2); (-Fsp - Fd)/ms];
dy = [y(2); (-Fsp - Fd)/ms; y(4); (kt*(q - y(3)) + ...
    ct*(qdot - y(4)) + Fsp + Fd)/mu];


% Test parameters: 
%{
m = 1;
k = 1;
c = 0.125;
A = 0.5;
w = 0.5;
% F = 0;
F = A*sin(w*t);

% dy = [y(2); -k*y(1)/m + F]; 
dy = [y(2); -k*y(1)/m - c*y(2)/m + F; y(2); -k*y(1)/m - c*y(2)/m + F]; 
%}
end