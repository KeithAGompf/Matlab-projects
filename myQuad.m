function [r,g] = myQuad(x,Q,b)
% FUNCTION [R,G] = MYQUAD(X,Q,B)
% will evaluate the function .5x^t Qx -b^t x
% r will give the output of x as a scaler
% g will give the gradient at the given x vector
%
%x  = [1;2]
%b = [1;2]
%Q = [2 3; 6 -1]

QX = Q * x;
xt = transpose(x); % these are defined to avoid repetitive code and save computation time.
bt = transpose(b);

g = (QX)- b
r = .5 * (xt * QX) - bt *x
