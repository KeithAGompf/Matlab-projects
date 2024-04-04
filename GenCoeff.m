function [c] = Gencoeff(n)
% [C] = GenCoeff(N)
%
% n represents number of terms(0-5)
% c is the vector for coefficients
% Used for the horner method
%
% 
% 
   i = [0:n];
   c = (-1).^i .* factorial(n) ./ (factorial(i) .* factorial(n-i));

% Generates x values
x = -3:0.1:3;

% Evaluate the polynomial for each x
y = polyval(c, x);

% Plot
plot(x, y, 'LineWidth', 2);
title('Graph of Polynomial');
xlabel('x');
ylabel('y');
grid on;

end
