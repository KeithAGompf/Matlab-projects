function [x] = luSolver( l, u, b)
% FUNCTION [X] = LUSOLVER(L,U,X)
% 
% Will be given a L, U matrix, and a b column vector and find x such that 
% A = L*U and Ax = b
%
% Will return x vector 


lm = l
um = u
x = b;
[r,c] = size(lm) ;
% forward-substituion for Lc = b Will find c
for i = 2 : r
    x(i) = x(i) - lm(i,1:(i-1)) * x(1:(i-1)) ; % forward-substitution
end

x(r) = x(r) / um(r,r) ;
% backward-substiution for Ux = C
for i = (r-1) : -1 : 1
    x(i) = ( x(i) - um(i,i+1 : c) * x( i+1 : c ) ) / um(i,i) ; % back-substitution
end
% to check results
A = lm * um
A * x
end