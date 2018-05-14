% Source: Chapra textbook, example 22.4 

% Simulation with 4th order Runge-Kutta and forward Euler

close all
clear all
clc

h = 2;  % timestep size

t0 = 0;     % initial simulation time
t_end = 10;  % final simulation time
tspan = [t0 t_end]; % time period for simulation

x0 = 0;
xdot_0 = 0;
initial_cond = [x0, xdot_0];    % initial conditions

% simulate using 4th order Runge-Kutta
[t_rk4, x_rk4] = rk4sys(@dydtsysTest1, tspan, initial_cond, h);

% simulate using forward Euler
[t_euler, x_euler] = euler(@dydtsysTest1, tspan, initial_cond, h);

disp([t_rk4' x_rk4(:, 1) x_euler(:, 1)])
disp([t_rk4' x_rk4(:, 2) x_euler(:, 2)])

% comparison of 4th order Runge-Kutta and forward Euler 
% solutions for sprung and unsprung mass displacements and 
% velocities
figure
subplot(2, 1, 1)
plot(t_rk4, x_rk4(:, 1), 'k-', ...
    t_euler, x_euler(:, 1), 'k--')
title('displacement')
xlabel('time')
ylabel('displacement')
legend('rk4', 'euler')
axis tight

subplot(2, 1, 2)
plot(t_rk4, x_rk4(:, 2), 'k-', ...
    t_euler, x_euler(:, 2), 'k--')
title('velocity')
xlabel('time')
ylabel('velocity')
legend('rk4', 'euler')
axis tight