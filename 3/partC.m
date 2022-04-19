
clc;
clear;
close all;

data = load('iris2.data');
numOfClass =3;
sampleSize = size(data,1);
trainSize = (sampleSize*(70/100));
testSize = sampleSize - trainSize;
randIndices = randi(sampleSize,sampleSize,1);
trainData = data(randIndices(1:trainSize),:);
testData = data(randIndices(trainSize+1:end));
X = trainData(:,1:end-1);
Y = trainData(:,end);

% primal
% class 1 , 2, 3
sum =0;
label0 = zeros(trainSize,numOfClass);
score0 = zeros(trainSize,numOfClass);
for i=1:numOfClass
    newY = Y;
    newY(newY ~= i) = -1;
    newY(newY == i) = 1;
    [label0(:,i),score0(:,i)] = Primal_Func(X,newY);
    %sum = sum + find_accuracy(newY,label0(:,i));
end
%acc = sum/3
[~,mx] = max(score0, [], 2 );
accc = find_accuracy(Y,mx)



%  dual
sum =0;
label1 = zeros(trainSize,numOfClass);
score0 = zeros(trainSize,numOfClass);
for i=1:numOfClass
    newY = Y;
    newY(newY ~= i) = -1;
    newY(newY == i) = 1;
    %result1(:,i) = Dual_Func(X,newY);
    [label1(:,i),score0(:,i)] = Dual_Func(X,newY);
    %sum = sum + find_accuracy(newY,result1(:,i));
end
%acc = sum/3
[~,mx] = max(score0, [], 2 );
accc = find_accuracy(Y,mx)

% result1 = Dual_Func(X,Y);
% find_accuracy(Y,result1)

% Guassian Kernel sigma =1
sum =0;
label1 = zeros(trainSize,numOfClass);
score0 = zeros(trainSize,numOfClass);
for i=1:numOfClass
    newY = Y;
    newY(newY ~= i) = -1;
    newY(newY == i) = 1;
    [label1(:,i),score0(:,i)] = GuassianKernel_Dual(X,newY,1);% sigma = 1
    %result1(:,i) = GuassianKernel_Dual(X,newY,1);% sigma = 1
    %sum = sum + find_accuracy(newY,result1(:,i));
end
%acc = sum/3
[~,mx] = max(score0, [], 2 );
accc = find_accuracy(Y,mx)

% Guassian Kernel sigma = 0.1
sum =0;
label1 = zeros(trainSize,numOfClass);
score0 = zeros(trainSize,numOfClass);
for i=1:numOfClass
    newY = Y;
    newY(newY ~= i) = -1;
    newY(newY == i) = 1;
    [label1(:,i),score0(:,i)] = GuassianKernel_Dual(X,newY,0.1);% sigma = 0.1
    %result1(:,i) = GuassianKernel_Dual(X,newY,0.1);% sigma = 1
    %sum = sum + find_accuracy(newY,result1(:,i));
end
%acc = sum/3
[~,mx] = max(score0, [], 2 );
accc = find_accuracy(Y,mx)


