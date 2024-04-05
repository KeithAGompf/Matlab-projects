function [r,g] = myQuad(x,Q,b)
% will evaluate the function .5x^t Qx -b^t x
%
%
x  = [1;2]
b = [1;2]
Q = [2 3; 6 -1]
QX = Q * x;
g = (QX)- b
xt = transpose(x);
bt = transpose(b);
r = .5 * (xt * QX) - bt *x