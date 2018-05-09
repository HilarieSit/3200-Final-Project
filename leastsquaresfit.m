clear all
clc
SF = load('springforce.mat');
DF = load('dampingforce.mat');

%-------------------------------------------------------

% spring force data
Fsp = SF.Fsp(1, :); % spring force data
x = SF.Fsp(2, :);   % displacement data
sp_n = length(x);   % number of displacement data points
sp_m = 3;           % sp_m is the number of unknown coefficients

% compute least squares fit on spring force
asp = polylsq(x, Fsp, sp_n, sp_m);
disp(asp)

% plot spring force data and its least squares fit
figure
scatter(x, Fsp)
hold on
maxx = max(x);
minx = min(x);
x_vec = (minx:(maxx-minx)/50:maxx);
Fsp_func = @(w) asp(1,1)*w + asp(2,1)*w.^2 + asp(3,1)*w.^3;
plot(x_vec, Fsp_func(x_vec))
title('Plot of spring force data and its least squares fit')
xlabel('x')
ylabel('F_{sp}')
hold off

%-------------------------------------------------------

% damping force data
Fd = DF.Fd(1, :);       % damping force data
x_dot = DF.Fd(2, :);    % velocity data
d_n = length(x_dot);    % number of velocity data points
d_m = 2;                % d_m is the number of unknown coefficients

% compute least squares fit on damping force
ad = polylsq(x_dot, Fd, d_n, d_m);
disp(ad)

% plot damping force data and its least squares fit
figure
scatter(x_dot, Fd)
hold on
maxxdot = max(x_dot);
minxdot = min(x_dot);
xdot_vec = (minxdot:(maxxdot-minxdot)/50:maxxdot);
Fd_func = @(w) ad(1,1)*w + ad(2,1)*w.^2;
plot(xdot_vec, Fd_func(xdot_vec))
title('Plot of damping force data and its least squares fit')
xlabel('x_dot', 'Interpreter', 'none')
ylabel('F_{d}')
hold off

% make system of ODE equations