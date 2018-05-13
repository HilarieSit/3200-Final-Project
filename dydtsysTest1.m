% Source: Chapra textbook, example 22.4 

function dy = dydtsysTest1(t, y)
% dydtsys sets up a column vector, dy, of ODEs to solve
% t = time (scalar)
% y is a row vector

dy = [y(2); 9.81 - 0.25/68.1*y(2)^2]; 

end