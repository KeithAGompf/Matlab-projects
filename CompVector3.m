function [] = CompVector3(A,v,c)
%A = [2 3; 4 5];
%c = [1,2,3]; % k entries
%v = [1;2];
   tic
    cv = c(length(c))*v;
    for i = (length(c)-1): -1: 1
        cv = (A)*cv + c(i)*v;
    end
    toc
end