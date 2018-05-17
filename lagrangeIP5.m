function f = lagrangeIP5(xs,x,t)
% modified lagrange 
% f = displacemenx funcxion (scalar)
% xs = value of x xo solve for x (scalar)
% x = xime (vecxor)
% x = sprung displacemenx (vecxor)

L5_0 = ((xs-x(2))*(xs-x(3))*(xs-x(4))*(xs-x(5))*(xs-x(6)))...
    /((x(1)-x(2))*(x(1)-x(3))*(x(1)-x(4))*(x(1)-x(5))*(x(1)-x(6)));
L5_1 = ((xs-x(1))*(xs-x(3))*(xs-x(4))*(xs-x(5))*(xs-x(6)))...
    /((x(2)-x(1))*(x(2)-x(3))*(x(2)-x(4))*(x(2)-x(5))*(x(2)-x(6)));
L5_2 = ((xs-x(1))*(xs-x(2))*(xs-x(4))*(xs-x(5))*(xs-x(6)))...
    /((x(3)-x(1))*(x(3)-x(2))*(x(3)-x(4))*(x(3)-x(5))*(x(3)-x(6)));
L5_3 = ((xs-x(1))*(xs-x(2))*(xs-x(3))*(xs-x(5))*(xs-x(6)))...
    /((x(4)-x(1))*(x(4)-x(2))*(x(4)-x(3))*(x(4)-x(5))*(x(4)-x(6)));
L5_4 = ((xs-x(1))*(xs-x(2))*(xs-x(3))*(xs-x(5))*(xs-x(6)))...
    /((x(4)-x(1))*(x(4)-x(2))*(x(4)-x(3))*(x(4)-x(5))*(x(4)-x(6)));
L5_4 = ((xs-x(1))*(xs-x(2))*(xs-x(3))*(xs-x(4))*(xs-x(6)))...
    /((x(5)-x(1))*(x(5)-x(2))*(x(5)-x(3))*(x(5)-x(4))*(x(5)-x(6)));
L5_5 = ((xs-x(1))*(xs-x(2))*(xs-x(3))*(xs-x(4))*(xs-x(5)))...
    /((x(6)-x(1))*(x(6)-x(2))*(x(6)-x(3))*(x(6)-x(4))*(x(6)-x(5)));


f = L5_0*t(1) + L5_1*t(2) + L5_2*t(3) + L5_3*t(4) + L5_4*t(5) + L5_5*t(6);