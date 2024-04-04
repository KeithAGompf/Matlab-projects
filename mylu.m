function [ m,x ] = mylu( a , b)
% [M,X] = MYLU(A,B)
%
% Computes LU factors of A with pivoting
% assuming that A is invertible and well-conditioned,
% and uses the factors to solve Ax = b.
%
% This program uses row oriented matrix access
%
% Input: square matrix A, column vector b.
%
% Output: square matrix M containing LU factors of A ;
% column vector x: the solution of Ax = b.
% 
% Will need to swap rows if pivot is found

m = a ; x = b ;
[r,c] = size(m) ;
% rows x Cols
for k = 1 : (c-1)
    %Partial pivoting
    for i = k+1 : size(m, 1)
        if abs(m(i,k)) > abs(m(k,k))
           % Swap rows in matrix A
           temp = m(i,:);
           m(i,:) = m(k,:);
           m(k,:) = temp;
           
           % Swap corresponding rows in vector b
           temp = x(i);
           x(i) = x(k);
           x(k) = temp;
        end
        m
    end

    ind = [k+1 : r];
    m(ind,k) = m(ind,k) / m(k,k) ; % compute multipliers
    for i = ind
        m(i,ind) = m(i,ind) - m(i,k) * m(k,ind) ; % row reduction
    end

end

%gets L and U matrix and tests it by mutliplying them together to get
%starting matrix
L = tril(m, -1) + eye(size(m))
U = triu(m)
LU = L * U

%solves for x
for i = 2 : r
    x(i) = x(i) - m(i,1:(i-1)) * x(1:(i-1)) ; % forward-substitution
end

x(r) = x(r) / m(r,r) ;

for i = (r-1) : -1 : 1
    x(i) = ( x(i) - m(i,i+1 : c) * x( i+1 : c ) ) / m(i,i) ; % back-substitution
end

end
