function [ result , pre_result] = GuassianKernel_Dual( X,Y,sigma )

kernel_gussian = zeros(size(X,1),size(X,1));
for i=1:size(X,1)
    for j=1:size(X,1)
        temp = X(i,:) - X(j,:);
        kernel_gussian(i,j) = exp( sqrt(temp(1)^2 + temp(2)^2) / -(2 * ((sigma)^2) ) );
    end
end
sampleSize = size(X,1);
H = kernel_gussian.*(Y*Y');
f = -ones(sampleSize,1);
a = zeros(sampleSize,1);
A = -eye(sampleSize);
b = zeros(sampleSize,1);
B = [Y';zeros(sampleSize-1,sampleSize)];
alpha = quadprog(H+eye(sampleSize)*0.001,f,A,a,B,b);
pre_result = ((alpha.*Y)'*kernel_gussian)';
result = sign(pre_result);

end

