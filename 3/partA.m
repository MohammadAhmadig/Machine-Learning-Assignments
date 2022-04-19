
clc;
clear;
close all;
X = [1,0;2,1;2,-1;-1,0;-2,1;-2,-1];
Y = [1 1 1 -1 -1 -1]';

%   primal
[result0,~] = Primal_Func(X,Y);
find_accuracy(Y,result0)

%  dual
[result1,~] = Dual_Func(X,Y);
find_accuracy(Y,result1)
