function [B] = matrixInverter(l, u)
% FUNCTION[X] = MATRIXINVERTER(L,U)
% given L and U will provde an inverse of A given L*U = A
% 
% L times first col of U will give first column of identity
%
%

% labeling just to make it easier to read
lm = l;
um = u;
% does this calculation just to compare actual inverse vs calculated one at
% the end
A = lm*um;
invA = inv(A)

idm = eye(size(A));
r = length(A);
B = zeros(size(A));

% forward-substitution to get cols of inversed A
    for i = 2 : r
        x = idm(:, i-1);%gets cols of idm
        x(i) = x(i) - A(i,1:(i-1)) * x(1:(i-1)) ; 
        x(r) = x(r) / A(r,r)
        B(: , i-1) = x;

    end

end