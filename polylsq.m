% Performs a polynomial least squares fit given 
% Git test by Jonathan
function [f,a] = polylsq(x,y,n,m)
    % construct X matrix
    X = zeros(n,m+1);
    for c = 1:m+1
        for r = 1:n
            X(r,c)=x(r).^(c-1);
        end
    end
    
    % transpose X
    X_T = transpose(X);
    
    % construct Gram's matrix
    G = X_T*X;
    
    y = transpose(y);
    B = X_T*y;
    
    % solve the a vector
    a = G\B;

    % construct scatter plot
    figure
    scatter(x,y)
    hold on
    % overlay least squares fit
    maxx = max(x);
    minx = min(x);
    step = (maxx-minx)/50;
    w = (minx:step:maxx);
    if m == 2
        v = a(1,1)+a(2,1)*w+a(3,1)*w.^2;
        f = @(w) a(1,1)+a(2,1)*w+a(3,1)*w.^2;
    end 
    if m == 3
        v = a(1,1)+a(2,1)*w+a(3,1)*w.^2+a(4,1)*w.^3;
        f = @(w) a(1,1)+a(2,1)*w+a(3,1)*w.^2+a(4,1)*w.^3;
    end 
    plot(w,v)
    title('Scatter plot of data and least squares fit')
    xlabel('x')
    ylabel('y')
    hold off
end