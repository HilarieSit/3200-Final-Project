% euler 
function [t,y] = euler(dydt,tspan,y0,h)

t0 = tspan(1);
tend = tspan(length(tspan));
t = t0:h:tend;
t(length(t)+1) = tend;
disp(length(t))
y(1,:) = y0;

for i = 1:1:length(t)-1
    m = dydt(t(i),y(i,:));    % slope  
    m = transpose(m);
    y(i+1,:) = y(i,:) + m*h;
end 
end