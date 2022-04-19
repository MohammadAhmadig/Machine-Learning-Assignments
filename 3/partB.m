
clc;
clear;
close all;
X=[2 2; 2 1; 2 3; 1 2; 3 2 ; -2 -2; -2 -1; -2 -3; -1 -2;...
-3 -2 ; 2 -2; 2 -1;2 -3; 1 -2; 3 -2 ; -2 2; -2 1; -2 3; -1 2; -3 2];
Y = -sign(X(:,1).*X(:,2));%XOR


newX = [X X(:,1).*X(:,2)];% kernel 1
% kernel 1  primal
[result0,~] = Primal_Func(newX,Y);
find_accuracy(Y,result0)

% kernel 1  dual
[result1,~] = Dual_Func(newX,Y);
find_accuracy(Y,result1)

% kernel 2  dual
sigma=1;
[result2,~] = GuassianKernel_Dual(X,Y,sigma);
find_accuracy(Y,result2)


