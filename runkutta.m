function runkutta

L = 5.2;
V = 10;
T = L/(V*1000/3600);
w = pi/T;
h = T/50;

[t y] = rk4sys(@dydtsys,[0 4],[0 0 0 0],h);

plot(y,t)

end 