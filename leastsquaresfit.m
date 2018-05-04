SF = load('springforce.mat');
DF = load('dampingforce.mat');

Fsp = SF.Fsp(1,:);
x_dot = SF.Fsp(2,:);
sp_n = length(x_dot);
sp_m = 3;

[f,sp_a,sp_X,sp_G] = polylsq(x_dot,Fsp,sp_n,sp_m);

disp(f)

Fd = DF.Fd(1,:);
x = DF.Fd(2,:);
d_n = length(x);
d_m = 2;

[f,d_a,d_X,d_G] = polylsq(x,Fd,d_n,d_m);

disp(f)