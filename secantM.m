function [x] = secantM(a, b, conv, iter)
%FUNCION [X] = SECANTM(A, B, CONV, ITER)
% Input:
%   a, b are initial guesses with a < b
%   conv is the relative error allowed
%   iter is the maximum number of iterations allowed
% 
% Output:
%   x = point of intersection (estimated root)

x = a;
k = 0;

function [f] = myFunction(x)
    %f = x^3 - 2*(x) - 5;
    %f = -(x-1)^3;
    %f = x - 0.1 * sin(x) - 24.851090;
    %f = sqrt(1 - x) + sqrt(1 - (2 * x^2)) + sqrt(1 - (3 * x^3)) - 2;
    f = cos(x) * cosh(x) - 1;
end

while true
    k = k + 1;
    fx = myFunction(x);% keeps as variable to save time

    %if point is found, point is close to convergence or iterations
    if fx == 0 || abs(fx) < conv || iter < k
        break;
    end
    
    % Calculate the next approximation
    xn1 = x - (fx * (x - b) / (fx - myFunction(b)));
    
    % Update the variables for the next iteration
    b = x;
    x = xn1;
end

end
