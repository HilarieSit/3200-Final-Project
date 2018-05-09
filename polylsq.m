% Performs a polynomial least squares fit given 
function a = polylsq(x,y,n,m)
    % construct X matrix
    X = zeros(n,m);
    for c = 1:m
        for r = 1:n
            X(r,c)=x(r).^(c);
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
end