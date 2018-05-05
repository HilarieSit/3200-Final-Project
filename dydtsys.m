function dy = dydtsys(t,y)

if t < T
    A = 0.1;
else
    A = 0;
end

dy = [y(2); (1/236.12)*(-0.0124e-06*y(2)+0.0737e-6*y(2)-3.1704e-6*y(2)...
    -0.0491-905.2896*y(1)-254.1860*y(1)); y(4); (1/23.61)*(0.0124e-06*y(4)...
    -0.0737e-6*y(4)+3.1704e-6*y(4)+0.0491-905.2896*y(3)+254.1860*y(3)+181818.88...
    *(A*sin(w*t)-y(3))+13.854*(A*w*cos(w*t)-y(4)))];
% dystsys contains the system of 4 ODEs to solve
% plug in velocities of 10 and 40