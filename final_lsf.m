SF = load('springforce.mat');
DF = load('dampingforce.mat');

Fsp = SF.Fsp(1,:);
x_dot = SF.Fsp(2,:);
sp_n = 3;

Fd = DF.Fd(1,:);
x = DF.Fd(2,:);

[a,X,G] = polylsq(x_dot,Fsq,sp_n,m);