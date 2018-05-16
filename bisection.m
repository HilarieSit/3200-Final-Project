function xs = bisection(xl,xu,t,x)
threshold = 1e-3; 
error = 1;
xr = 0;             %x calculated with bisection
oldxr = 0;          %store old xr
fl = 0;             %function evaluated at xl
fr = 0;             %function evaluated at xu
k = 0;              %number of iterations

while error > threshold
    fl = lagrangeIP5(xl,x,t);             %evaluate function at lower bound
    oldxr = xr;                         %store old xr 
    xr = (xl+xu)/2;                     %calculate midpoint
    fr = lagrangeIP5(xr,x,t);               %evaluate function at xr
    
    k = k+1;
    fprintf('For iteration %d\n',k);
    fprintf('xl: %d\n',xl);
    fprintf('xu: %d\n',xu);
    fprintf('xr: %d\n',xr);
    if fl*fr < 0                        %if root not between xl and xr
        xu = xr;                        %set xu as xr
    else
        xl = xr;                        %otherwise, set xl as xr
    end 
   
    if k > 1
        error = abs(xr-oldxr)/xr;       %calculate approximate relative error
        fprintf('error: %d\n',error);
    end
    fprintf('f(xr): %d\n\n',fr);
end 
xs = xr;
end