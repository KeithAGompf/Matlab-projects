function [ sol, flag ] = newtonx( sx, relerr, maxit, func )
% [SOL,FLAG] = NEWTONX( SX, RELERR, MAXIT, FUNC)
%
% Solves f(x) = 0 using Newton=s method
%
% Input: scalar sx - starting point of the iteration
%   small positive scalar relerr - desired relative error
%   positive integer maxit - maximum no. of iterations permitted
%   func: name of the program that defines f(x);
%
%   Note: when running newtonx on the problem defined by func, you
%   must enter @func (func with symbol @ attached) in the input line.
%   The calling sequence for the program func must have the format
%   [yval, yder] = func(x)
%   where x is the point used to compute yval = f(x) and yder = f'(x).
%
% Output: scalar sol - solution found
%   scalar flag - flag = 0 indicates solution successfully found
%       flag = 1 indicates derivative too small; halt
%       flag = 2 indicates too many iterations; halt
% 


function [yval, yder] = myFunction(x)
    %yval = x^3 -2*(x) -5;
    %yder = 3*(x)^2 -2;
    yval = -(x-1)^3;
    yder = -3 * (x-1)^2;
    %yval = x - .1 * sin(x) - 24.851090;
    %yder = -.1*cos(x) +1;
    %yval =sqrt(1-x) + sqrt(1-2*x^2)+ sqrt(1- 3 * x^3) -2;
    %yder = -1/2*sqrt(-x+1) - ((2*x)/ sqrt(-2*x^2 + 1)) - (9*x^2)/(2*sqrt(-3*x^3 + 1));
    %yval = cos(x)*cosh(x)-1;
    %yder = sinh(x)*cos(x)-sin(x)*cosh(x);
end

sol = [ ] ; % default setting: no result
k = 0 ;
while ( k < maxit)
    k = k + 1;
    [yval, yder] = myFunction(sx) ;  % evaluate f(x) and f=(x)
    if ( abs(yder) < abs(yval) * sqrt(eps) )
        flag = 1 ; return % halt : derivative too small
    end
    % check for (too ?) small function value
    sx = sx - (yval / yder);  % take the Newton step
    sol = sx;
    if yval == 0 || abs(yval) < relerr % yval = 0 then intersection found or if value is smaller than error its approximated
        sol = sx ; flag = 0 ; return % succesful termination
    end
end
%end
flag = 2; % failure: too many steps
end

