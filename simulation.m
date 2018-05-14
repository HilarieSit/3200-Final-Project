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
[t10_rk4, x10_rk4] = rk4sys(@dydtsys10, tspan, initial_cond, h10);
[t40_rk4, x40_rk4] = rk4sys(@dydtsys40, tspan, initial_cond, h40);

% simulate QCM using forward Euler
[t40_euler, x40_euler] = euler(@dydtsys40, tspan, initial_cond, h40);

% plot 4th order Runge-Kutta displacement and velocities
% vs time for V = 10 km/hr
figure
hold on
line(tspan,[0 0],'LineWidth',2)
plot(t10_rk4, x10_rk4(:, 1), 'k--')
plot(t10_rk4, x10_rk4(:, 2), 'ko')
plot(t10_rk4, x10_rk4(:, 3), 'k.')
plot(t10_rk4, x10_rk4(:, 4), 'k-')
title('4th order Runge-Kutta displacement/velocity vs time for V = 10 km/hr')
xlabel('time')
ylabel('displacement/velocity')
legend('zero crossing', 'sprung mass displacement', 'sprung mass velocity', ...
    'unsprung mass displacement', 'unsprung mass velocity')

% plot 4th order Runge-Kutta displacement and velocities
% vs time for V = 40 km/hr
figure
hold on
line(tspan,[0 0],'LineWidth',2)
plot(t40_rk4, x40_rk4(:, 1), 'k--')
plot(t40_rk4, x40_rk4(:, 2), 'ko')
plot(t40_rk4, x40_rk4(:, 3), 'k.')
plot(t40_rk4, x40_rk4(:, 4), 'k-')
title('4th order Runge-Kutta displacement/velocity vs time for V = 40 km/hr')
xlabel('time')
ylabel('displacement/velocity')
legend('zero crossing', 'sprung mass displacement', 'sprung mass velocity', ...
    'unsprung mass displacement', 'unsprung mass velocity')

% plot comparision of sprung mass displacement for V = 10 km/hr
% and V = 40 km/hr
figure
hold on
plot(t10_rk4, x10_rk4(:, 1), 'k--')
plot(t40_rk4, x40_rk4(:, 1), 'ko')
title('Comparison of 4th order Runge-Kutta sprung mass displacement')
xlabel('time')
ylabel('displacement')
legend('V = 10 km/hr', 'V = 40 km/hr')

% plot comparision of sprung mass velocity for V = 10 km/hr
% and V = 40 km/hr
figure
hold on
plot(t10_rk4, x10_rk4(:, 2), 'k--')
plot(t40_rk4, x40_rk4(:, 2), 'ko')
title('Comparison of 4th order Runge-Kutta sprung mass velocity')
xlabel('time')
ylabel('velocity')
legend('V = 10 km/hr', 'V = 40 km/hr')

% plot forward Euler displacement and velocities
% vs time for V = 40 km/hr
figure
hold on
plot(t40_euler, x40_euler(:, 1), 'k--')
plot(t40_euler, x40_euler(:, 2), 'ko')
plot(t40_euler, x40_euler(:, 3), 'k.')
plot(t40_euler, x40_euler(:, 4), 'k-')
title('Forward Euler displacement/velocity vs time for V = 40 km/hr')
xlabel('time')
ylabel('displacement/velocity')
legend('sprung mass displacement', 'sprung mass velocity', ...
    'unsprung mass displacement', 'unsprung mass velocity')

% comparison of 4th order Runge-Kutta and forward Euler
% solutions for sprung and unsprung mass displacements and
% velocities for V = 40 km/hr
figure
subplot(2, 2, 1)
plot(t40_rk4, x40_rk4(:, 1), 'k-', ...
    t40_euler, x40_euler(:, 1), 'k--')
title('Sprung mass displacement')
xlabel('time')
ylabel('displacement')
legend('rk4', 'euler')
axis([t0 t_end -1.5 1.5])

subplot(2, 2, 2)
plot(t40_rk4, x40_rk4(:, 2), 'k-', ...
    t40_euler, x40_euler(:, 2), 'k--')
title('Sprung mass velocity')
xlabel('time')
ylabel('velocity')
legend('rk4', 'euler')
axis([t0 t_end -1.5 1.5])

subplot(2, 2, 3)
plot(t40_rk4, x40_rk4(:, 3), 'k-', ...
    t40_euler, x40_euler(:, 3), 'k--')
title('Unsprung mass displacement')
xlabel('time')
ylabel('displacement')
legend('rk4', 'euler')
axis([t0 t_end -1.5 1.5])

subplot(2, 2, 4)
plot(t40_rk4, x40_rk4(:, 4), 'k-', ...
    t40_euler, x40_euler(:, 4), 'k--')
title('Unprung mass velocity')
xlabel('time')
ylabel('velocity')
legend('rk4', 'euler')
axis([t0 t_end -1.5 1.5])

% absolute difference between 4th order Runge-Kutta and
% forward Euler for 4 unknown variables (displacements and
% velocities of sprung and unsprung masses
time = 2*T40;
index = (time - t0)/h40 + 1;
diff = abs(x40_rk4(index, :) - x40_euler(index, :))