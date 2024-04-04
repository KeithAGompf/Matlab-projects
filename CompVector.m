function [] = CompVector(A,v,c)
%[C] =COMPVECTOR(A,V,C)
%
%
%A = [2 3; 4 5];
%v = [1;2]; My testing cases
%c = [1,2,3]; % k entries

   tic
   result = c(1)* eye(size(A)); % Initialize result to identity matrix
   AK = A;
   for k = 2:length(c)
       result = result + (c(k) * AK); % Update result using previous A^k
       AK = AK*A; % Compute the next power of A
   end
   Bv = result*v;
   toc
end
