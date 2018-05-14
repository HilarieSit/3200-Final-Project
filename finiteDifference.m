% Section 3, part a

% use O(h^2) centered finite difference scheme to plot sprung mass
% acceleration as a function of time

close all
clear all
clc

% NOTE: The first part of this MATLAB code (up until the "--------"
% is the exact same simulation code used in simulation.m

% define simulation parameters
L = 5.2;	% length  
V = [10, 40];   % velocity
T10 = L/(V(1)*1000/3600);   % characteristic time scale at V = 10 km/hr
T40 = L/(V(2)*1000/3600);   % characteristic time scale at V = 40 km/hr
h10 = T10/100;  % time step at V = 10 km/hr
h40 = T40/50;   % time step at V = 40 km/hr

% time period for simulation
t0 = 0;     % initial simulation time
t_end = 4;  % final simulation time
tspan = [t0 t_end]; % time period for simulation

% initial conditions for simulation
xs0 = 0;        % initial displacement of sprung mass
xdot_s0 = 0;    % initial velocity of sprung mass
xu0 = 0;        % initial displacement of unsprung mass
xdot_u0 = 0;    % initial velocity of unsprung mass
initial_cond = [xs0, xdot_s0, xu0, xdot_u0];    % initial conditions

% simulate QCM using 4th order Runge-Kutta
[t10_rk4, x10_rk4] = rk4sys(@dydtsys10, tspan, initial_cond, h10);
[t40_rk4, x40_rk4] = rk4sys(@dydtsys40, tspan, initial_cond, h40);

% -------------------------------------------------------------------

% compute acceleration for V = 10 km/hr
acceleration10 = zeros(1, length(t10_rk4));
for i = 2:length(t10_rk4)-1
    acceleration10(1, i) = (x10_rk4(i + 1, 1) ...
        - 2*x10_rk4(i, 1) + x10_rk4(i - 1, 1))/h10^2;
end
% remove the first and last entries in acceleration10
% because those acceleration values could not be 
% computed with the centered finite difference scheme
aacceleration10 = acceleration10(1, 2:end-1);

% compute acceleration for V = 40 km/hr
acceleration40 = zeros(1, length(t40_rk4));
for i = 2:length(t40_rk4)-1
    acceleration40(1, i) = (x40_rk4(i + 1, 1) ...
        - 2*x40_rk4(i, 1) + x40_rk4(i - 1, 1))/h40^2;
end
% remove the first and last entries in acceleration40
% because those acceleration values could not be 
% computed with the centered finite difference scheme
acceleration40 = acceleration40(1, 2:end-1);

