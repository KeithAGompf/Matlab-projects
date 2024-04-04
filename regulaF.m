function [x] = regulaF(a,b, conv )
% [SOL,FLAG] = regulaF( A, B, CONV)
% Input:
%   a, b with a < b, assumes intersection point is between a and b,
%   a and b should have different signs
%   conv is relative error allowed
%
% Ouput:
%   xnew is the new point calculated
%   fx is the function at xnew

function [f] = myFunction(x)
    %f = x^3 -2*(x) - 5;
    %f = x - .1*sin(x) - 24.851090;
    %f =sqrt(1-x) + sqrt(1-2*x^2)+ sqrt(1- 3 * x^3) -2;
    f = cos(x)*cosh(x)-1;
    %f = -(x-1)^3;
end

while (true)
    if myFunction(a) == 0 || myFunction(b) == 0 
        break; % Exit the loop if either is zero
    end
    fa = myFunction(a);
    fb = myFunction(b); %function calls are stored as varibles for multiple uses not to waste flops

    xnew = b - fb * ( (b - a)/ (fb - fa) );%calculates step
    fx = myFunction(xnew);
    if(fx > fb)
        a = xnew; % case if left side has moved
    else
        b = xnew; % case if righht side has moved
    end 
    if(abs(fx) < conv) %if fx is smaller than converge then intersection has been approximated
        break;
    end
    
end
x = xnew;
end
