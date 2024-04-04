function [] = error(n)
% [] = ERROR(N)
% 
% Define values for k and n(1-1000)
% Create arrays of indices for k and n instead of doing a for loop
% repmat(A, m, n) A = input, m = number of times repeated, n = columns
% 
% Calculates the approximation and exact sum
% Calculate absolute and relative errors
% graphs Absolute Error and Relative error vs n
%
% 


kvalues = [1, 2, 3];
nvalues = [1:n];

ni = repmat(nvalues, length(kvalues), 1);
ki = repmat(kvalues', 1, length(nvalues));

approx = ni.^(ki +1) ./ (ki +1)
exact =cumsum(ni.^ki, 2)

absolute_errors = abs(approx - exact);
relative_errors = absolute_errors ./ abs(exact);

% Plot for absolute errors
figure;
plot(nvalues, absolute_errors);
title('Absolute Error Graph');
xlabel('n');
ylabel('Absolute Error');
legend(cellstr(num2str(kvalues')));


% Plot for relative errors
figure; %creates a new window
plot(nvalues, relative_errors);
title('Relative Error Graph');
xlabel('n');
ylabel('Relative Error');
legend(cellstr(num2str(kvalues') ));

