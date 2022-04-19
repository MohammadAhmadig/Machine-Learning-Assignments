function [ result , pre_result] = Dual_Func( X,Y )

sampleSize = size(X,1);

H = (X*X').*(Y*Y');
f = -ones(sampleSize,1);
a = zeros(sampleSize,1);
A = -eye(sampleSize);
b = zeros(sampleSize,1);
B = [Y';zeros(sampleSize-1,sampleSize)];
alpha = quadprog(H+eye(sampleSize)*0.001,f,A,a,B,b);
w = (alpha.*Y)'*X;
pre_result = X*w';
result = sign(pre_result);

end
