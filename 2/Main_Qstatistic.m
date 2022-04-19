% Weka Demo
clear;close all;clc;


% Add Weka path
%WEKA_HOME = 'C:\Program Files\Weka-3-7';
javaaddpath('\weka.jar');
T=5;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load data set
X = load('X_train.csv');
labels = load('y_train.csv');
%Train = [X(1:700,:) labels(1:700,:)];
%Test = [X(701:801,:) labels(701:801,:)];
temptest = zeros(T,floor(801/5));%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

samples_size = length(labels);
indices = K_Fold(samples_size,5);
ACC = zeros(5,1);

for fold=1:5
    fold
    % set train and test data with this tenFold
    Train = [X(indices(:,1:fold-1),:) ; X(indices(:,fold+1:end),:)];
    Train_labels = [labels(indices(:,1:fold-1),:) ; labels(indices(:,fold+1:end),:)];
    Test = X(indices(:,fold),:);
    Test_labels = labels(indices(:,fold),:);
    Train = [Train Train_labels];
    Test = [Test Test_labels];
    positives = {};
    negatives = {};
    
for i = 1 : T%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    classifiers = {};
    indices2 = randi(4*floor(801/5),4*floor(801/5),1);
    Train = Train(indices2,:);
    
    %Save train and test data
    save train.txt Train -ascii
    save test.txt Test -ascii
    
    ArffTrain = convertToArff('train.txt');
    ArffTest = convertToArff('test.txt');
    
    % Train a J48 classifier
    classifier = weka.classifiers.trees.J48();
    classifier.buildClassifier(ArffTrain);
    classifiers{i} = classifier;
    
    % Classify test instances
    numInst = ArffTest.numInstances();
    for k=1:numInst
        
        temp = classifiers{i}.classifyInstance(ArffTest.instance(k-1));
        estimatedTestLabels(k,1) = str2num(char(ArffTest.classAttribute().value((temp)))); % Predicted labels
        
    end
    temptest(i,:) = estimatedTestLabels';
    testLabels = Test(:,end);
    positives{i} = find(estimatedTestLabels == testLabels);
    negatives{i} = find(estimatedTestLabels ~= testLabels);
end
%fprintf('Five fold classification accuracy of J48 classifier is: %f',mean(ACC));
est_labesl = mode(temptest,1);
est_labesl = est_labesl';
% Compute accuracy of each fold
testLabels = Test(:,end);

%positives{i} = find(est_labesl == testLabels);
%negatives{i} = find(est_labesl ~= testLabels);

ACC(fold) = (sum(est_labesl == testLabels) / length(testLabels)) * 100;


sum_Qik = 0;

for i = 1:T-1
    
    for k = i+1:T
        N11 = length(intersect(positives{i},positives{k}));
        N00 = length(intersect(negatives{i},negatives{k}));
        N01 = length(intersect(negatives{i},positives{k}));
        N10 = length(intersect(positives{i},negatives{k}));
        
        Qik = ((N11*N00)-(N01*N10))/((N11*N00)+(N01*N10));
        sum_Qik = sum_Qik + Qik;
    end
end
Qav(fold)= (2/(T*(T-1)) ) * sum_Qik;


end

mean(ACC)
var(ACC)    
   
mean(Qav)


