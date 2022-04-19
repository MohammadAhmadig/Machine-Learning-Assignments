function [ result , pre_result] = Primal_Func( X,Y )

sampleSize = size(X,1);
num_feature = size(X,2);
H=diag([ones(1,num_feature) 0]);
f=zeros(1,num_feature+1);
A=-diag(Y)*[X ones(sampleSize,1)];
a=-ones(sampleSize,1);
z = quadprog(H,f,A,a);
w = z(1:num_feature);
w0 = z(num_feature+1);
pre_result = X*w+w0*ones(sampleSize,1);
result = sign(pre_result);

end
