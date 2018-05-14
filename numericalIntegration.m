% Numerically compute the energy loss due to damping by the
% shock absorber over the time interval T the car takes to
% go over the bump. Use composite trapezoidal and 1/3 Simpson's
% rule while ensuring that there are an odd number of points.

% damping force equation
c1 = 905.2896;  % coefficients determined using least squares fit
c2 = 254.2550;
delta_xdot = y(2) - y(4);   % aggregate velocity
Fd = c1*delta_xdot + c2*delta_xdot^2; % damping force equation

