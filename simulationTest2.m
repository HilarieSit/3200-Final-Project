% Source: Example 1 of "Lecture16.pdf"

% Simulation with 4th order Runge-Kutta and forward Euler

close all
clear all
clc

h = 0.01;  % timestep size

t0 = 0;     % initial simulation time
t_end = 50;  % final simulation time
tspan = [t0 t_end]; % time period for simulation

x0 = 2;
xdot_0 = 0;
initial_cond = [x0, xdot_0];    % initial conditions

% simulate using 4th order Runge-Kutta
[t_rk4, x_rk4] = rk4sys(@dydtsysTest2, tspan, initial_cond, h);

% simulate using forward Euler
[t_euler, x_euler] = euler(@dydtsysTest2, tspan, initial_cond, h);

figure
plot(t_rk4, x_rk4(:,1), t_rk4, zeros(1, length(t_rk4)))
title('rk4')
xlabel('time')
legend('displacement', 'velocity')
axis tight

figure
plot(t_euler, x_euler(:,1), t_rk4, zeros(1, length(t_rk4)))
title('euler')
xlabel('time')
legend('displacement', 'velocity')
axis tight

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