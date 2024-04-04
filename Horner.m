function [y,yp] = Horner(c,x)
%[Y,YP] = HORNER(C,X)
%Uses Horner's mehot and synthetic devision
% to cpmuter the value and derivative of a polynomial
% given in terms of its coefficients, at a set of values of x
%
% c: vector of polynomial coefficents, from of the highest power to constant term
% x: vector of points at which to evaluate the polynomial
%
% y: vector of polynomial values at x
% yp: vector of derivative values at x
% the row/column orientation of vectors y and yp is that of vector x

y = c(1)*ones(size(x));
yp= zeros(size(x));

    for i =2 : length(c)
        yp = yp.*x +y;
        y = y.*x+c(i); 
    
    end

end
