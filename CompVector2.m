function [] = CompVector2(A,v,c)
%
%A = [2 3; 4 5];
%c = [1,2,3]; % k entries
%v = [1;2];
%

   tic
   c1v = c(1)*v;
   AV= A * v; % this results in a vector so there is no matrix multiplication

   for i = 2:length(c);
       c1v = c1v + c(i)*AV;
       AV = (A)*AV;
   end
   c1v;
   toc
end
