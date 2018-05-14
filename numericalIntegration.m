% Numerically compute the energy loss due to damping by the
% shock absorber over the time interval T the car takes to
% go over the bump. Use composite trapezoidal and 1/3 Simpson's
% rule ensuring that there are an odd number of points.

% for the quarter car model (QCM):
%       x(:, 1) = displacement of sprung mass, x_s, vs time
%       x(:, 2) = velocity of sprung mass, xdot_s, vs time
%       x(:, 3) = displacement of unspring mass, x_u, vs time
%       x(:, 4) = velocity of unsprung mass, xdot_u, vs time

close all
clear all
clc

% NOTE: The first part of this MATLAB code (up until the "--------"
% is the exact same simulation code used in simulation.m, except for
% for the time period of simulation parameters; instead of simulating
% up to t = 4 sec, simulate only up to T10 and T40 because the
% numerical integration will integrate only up to t = T

% define simulation parameters
L = 5.2;	% length
V = [10, 40];   % velocity
% T10 and T40 are also the end times for the numerical integration
T10 = L/(V(1)*1000/3600); % characteristic time scale at V = 10 km/hr
T40 = L/(V(2)*1000/3600); % characteristic time scale at V = 40 km/hr
h10 = T10/100;  % time step at V = 10 km/hr
h40 = T40/50;   % time step at V = 40 km/hr

% time period for simulation
t0 = 0;     % initial simulation and numerical integration time
tspan10 = [t0 T10]; % time period for simulation for V = 10 km/hr
tspan40 = [t0 T40]; % time period for simulation for V = 40 km/hr

% initial conditions for simulation
xs0 = 0;        % initial displacement of sprung mass
xdot_s0 = 0;    % initial velocity of sprung mass
xu0 = 0;        % initial displacement of unsprung mass
xdot_u0 = 0;    % initial velocity of unsprung mass
initial_cond = [xs0, xdot_s0, xu0, xdot_u0];    % initial conditions

% simulate QCM using 4th order Runge-Kutta
[t10_rk4, x10_rk4] = rk4sys(@dydtsys10, tspan10, initial_cond, h10);
[t40_rk4, x40_rk4] = rk4sys(@dydtsys40, tspan40, initial_cond, h40);

% -------------------------------------------------------------------

% Numerical integration

% function to be numerically integrated
c1 = 905.2896;  % coefficients determined using least squares fit
c2 = 254.2550;
f = @(delta_xdot) (c1*delta_xdot + c2*delta_xdot^2)*delta_xdot;
delta_xdot10 = x10_rk4(:, 2) - x10_rk4(:, 4);
delta_xdot40 = x40_rk4(:, 2) - x40_rk4(:, 4);

% -------------------------------------------------------------------

% Composite trapezoidal numerical integration

% for V = 10 km/hr
% N10_trap + 1 = total number of integration points
N10_trap = length(t10_rk4) - 1;
h10_trap = (T10 - t0)/N10_trap; % timestep size for integration
Ed10_trap = (h10_trap/2)*f(delta_xdot10(1, 1));  % integration value
for i = 2:N10_trap
    Ed10_trap = Ed10_trap + (h10_trap/2)*2*f(delta_xdot10(i, 1));
end
Ed10_trap = Ed10_trap + (h10_trap/2)*f(delta_xdot10(N10_trap + 1, 1));

% for V = 40 km/hr
% N40_trap + 1 = total number of integration points
N40_trap = length(t40_rk4) - 1;
h40_trap = (T40 - t0)/N40_trap; % timestep size for integration
Ed40_trap = (h40_trap/2)*f(delta_xdot40(1, 1));  % integration value
for i = 2:N40_trap
    Ed40_trap = Ed40_trap + (h40_trap/2)*2*f(delta_xdot40(i, 1));
end
Ed40_trap = Ed40_trap + (h40_trap/2)*f(delta_xdot40(N40_trap + 1, 1));

% -------------------------------------------------------------------

% 1/3 Simpson's rule numerical integration

% for V = 10 km/hr
% N10_simp + 1 = total number of integration points
N10_simp = length(t10_rk4) - 1;
Ed10_simp = (T10 - t0)/(3*N10_simp)*f(delta_xdot10(1, 1));  % integration value
for i = 2:N10_simp
    if rem(i, 2) ~= 0 % i is odd
        Ed10_simp = Ed10_simp + (T10 - t0)/(3*N10_simp)*4*f(delta_xdot10(i, 1));
    else   % i is even
        Ed10_simp = Ed10_simp + (T10 - t0)/(3*N10_simp)*2*f(delta_xdot10(i, 1));
    end
end
Ed10_simp = Ed10_simp + (T10 - t0)/(3*N10_simp)*f(delta_xdot10(N10_simp + 1, 1));

% for V = 40 km/hr
% N40_simp + 1 = total number of integration points
N40_simp = length(t40_rk4) - 1;
Ed40_simp = (T40 - t0)/(3*N40_simp)*f(delta_xdot40(1, 1));  % integration value
for i = 2:N40_simp
    if rem(i, 2) ~= 0 % i is odd
        Ed40_simp = Ed40_simp + (T40 - t0)/(3*N40_simp)*4*f(delta_xdot40(i, 1));
    else   % i is even
        Ed40_simp = Ed40_simp + (T40 - t0)/(3*N40_simp)*2*f(delta_xdot40(i, 1));
    end
end
Ed40_simp = Ed40_simp + (T40 - t0)/(3*N40_simp)*f(delta_xdot40(N40_simp + 1, 1));

% ------------------------------------------------------------------

% Assess the differences in energy loss/integration value between
% composite trapezoid and 1/3 Simpson's rule

diff10 = (Ed10_trap - Ed10_simp)/Ed10_trap*100;
diff40 = (Ed40_trap - Ed40_simp)/Ed40_trap*100;