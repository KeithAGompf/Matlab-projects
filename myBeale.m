function [r,g] = myBeale(x)
% Will evaluate the Beale function in the lecture notes
% assymes x is only a 2x1 vector 
%
% r will give the output of the function at x
% g will give the gradient at the given x vector
%
% we know that there is a minimum at (3, .5), testing that gives a 0
% x = [3, .5]

r = (1.5-x(1)*(1-x(2)))^2+(2.25-x(1)*(1-x(2)^2))^2+(2.625-x(1)*(1-x(2)^3))^2;
%to get grad need to compute each partial derivative and evaluate
x1partial = 2*(1.5-x(1)+x(1)*x(2))*(-1+x(2)) +2*(2.25-x(1)+x(1)*x(2)^2)*(-1+x(2)^2) +2*(2.625-x(1)+x(1)*x(2)^3)*(-1+x(2)^3);
x2partial = 2*(1.5-x(1)+x(1)*x(2)) * x(1) + 4*(2.25 -x(1) +x(1)*x(2)^2)*(-x(1)+2*x(1)*x(2)) + 6*(2.625 -x(1) + x(1)*x(2)^3)*(-x(1)+3*x(1)*x(2)^2);

% evaluating the x vector at the partial gives the 0 vector which shows
% that we have the minumum
g = [x1partial; x2partial]
end