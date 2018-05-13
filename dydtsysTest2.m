% Source: Example 1 of "Lecture16.pdf"

function dy = dydtsysTest2(t, y)
% dydtsys sets up a column vector, dy, of ODEs to solve
% t = time (scalar)
% y is a row vector

m = 1;
k = 1;
c = 0.125;
A = 0;
w = 1;
% F = 0;
F = A*sin(w*t);

% dy = [y(2); -k*y(1)/m + F]; 
dy = [y(2); -k*y(1)/m - c*y(2)/m + F]; 

end