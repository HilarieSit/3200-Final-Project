% Nonlinear root finding technique applied on constructed 5th degree 
% Langrange Interpolating Polynomial

% for V = 10
V10B = t10_rk4 < 1.8748;    % observed zero crossing
ind_num = length(find(V10B));
V10_times = [t10_rk4(ind_num-2) t10_rk4(ind_num-1) t10_rk4(ind_num)...
    t10_rk4(ind_num+1) t10_rk4(ind_num+2) t10_rk4(ind_num+3)];
V10_values = [x10_rk4(ind_num-2,1) x10_rk4(ind_num-1,1) x10_rk4(ind_num,1)...
    x10_rk4(ind_num+1,1) x10_rk4(ind_num+2,1) x10_rk4(ind_num+3,1)];

% bisection
xl = x10_rk4(ind_num,1);
xu = x10_rk4(ind_num+1,1);
v40_xs = bisection(xl,xu,V10_times,V10_values);
disp(v40_xs)

% for V = 40
V40B = t40_rk4 < 0.5520;    % observed zero crossing
ind_num = length(find(V40B));
V40_times = [t40_rk4(ind_num-2) t40_rk4(ind_num-1) t40_rk4(ind_num)...
    t40_rk4(ind_num+1) t40_rk4(ind_num+2) t40_rk4(ind_num+3)];
V40_values = [x40_rk4(ind_num-2,1) x40_rk4(ind_num-1,1) x40_rk4(ind_num,1)...
    x40_rk4(ind_num+1,1) x40_rk4(ind_num+2,1) x40_rk4(ind_num+3,1)];

% bisection
xl = x40_rk4(ind_num,1);
xu = x40_rk4(ind_num+1,1);
v10_xs = bisection(xl,xu,V40_times,V40_values);
disp(v10_xs)
