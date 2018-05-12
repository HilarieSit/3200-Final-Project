% Forward Euler code
% fyi: need to change time step by 1/10 (h = T40/50/10) to get 
% visually similar results as RK4

function [t,y] = euler(dydt,tspan,y0,h)

t0 = tspan(1);
tend = tspan(length(tspan));
t = t0:h:tend;
t(length(t)+1) = tend;
disp(length(t))
y(1,:) = y0;

for i = 1:1:length(t)-1
    m = dydt(t(i),y(i,:));    % slope; m is a column vector  
    m = transpose(m);
    y(i+1,:) = y(i,:) + m*h;
end 

end