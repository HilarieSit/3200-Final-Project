% Simulation of quarter car model (QCM) with 4th order Runge-Kutta
% and forward Euler

% NOTE: in order for simulation for V = 10 km/hr or V = 40 km/hr
% to run correctly, must change V to correct value in the dydtsys
% MATLAB code

% simulate the car at velocities, V, of 10 km/hr and 40 km/hr over
% a time period of 4 seconds; use at least 50 timesteps per 
% characteristic time scale (T), the time it takes for the car to 
% go over the bump

close all
clear all
clc

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
[t10_rk4, x10_rk4] = rk4sys(@dydtsys, tspan, initial_cond, h10);
[t40_rk4, x40_rk4] = rk4sys(@dydtsys, tspan, initial_cond, h40);

% simulate QCM using forward Euler
[t40_euler, x40_euler] = euler(@dydtsys, tspan, initial_cond, h40/10);

% plot 4th order Runge-Kutta displacement and velocities 
% vs time for V = 10 km/hr
figure
hold on
plot(t10_rk4, x10_rk4(:, 1), 'k--')
plot(t10_rk4, x10_rk4(:, 2), 'ko')
plot(t10_rk4, x10_rk4(:, 3), 'k.')
plot(t10_rk4, x10_rk4(:, 4), 'k-')
title('4th order Runge-Kutta displacement/velocity vs time for V = 10 km/hr')
xlabel('displacement/velocity')
ylabel('time')
legend('sprung mass displacement', 'sprung mass velocity', ...
    'unsprung mass displacement', 'unsprung mass velocity')

% plot 4th order Runge-Kutta displacement and velocities 
% vs time for V = 40 km/hr
figure
hold on
plot(t40_rk4, x40_rk4(:, 1), 'k--')
plot(t40_rk4, x40_rk4(:, 2), 'ko')
plot(t40_rk4, x40_rk4(:, 3), 'k.')
plot(t40_rk4, x40_rk4(:, 4), 'k-')
title('4th order Runge-Kutta displacement/velocity vs time for V = 40 km/hr')
xlabel('displacement/velocity')
ylabel('time')
legend('sprung mass displacement', 'sprung mass velocity', ...
    'unsprung mass displacement', 'unsprung mass velocity')

% plot forward Euler displacement and velocities 
% vs time for V = 40 km/hr
figure
hold on
plot(t40_euler, x40_euler(:, 1), 'k--')
plot(t40_euler, x40_euler(:, 2), 'ko')
plot(t40_euler, x40_euler(:, 3), 'k.')
plot(t40_euler, x40_euler(:, 4), 'k-')
title('Forward Euler displacement/velocity vs time for V = 40 km/hr')
xlabel('displacement/velocity')
ylabel('time')
legend('sprung mass displacement', 'sprung mass velocity', ...
    'unsprung mass displacement', 'unsprung mass velocity')