% Weka Demo
clear;
close all;
clc;

% Add Weka path
javaaddpath('weka.jar');

% Load data set
Data = load('X_train.csv');
labels = load('y_train.csv');
trainwithlabel = [Data labels];


indices = crossvalind('Kfold',labels,5);
% Five fold cross validation
for fold=1:5
      
    fold   
    testI = find(indices == fold);
    test = trainwithlabel(testI,:);
    
    trainI = setdiff([1:size(trainwithlabel,1)],testI) ;
    train = trainwithlabel(trainI,:);
     
    numtrees = [1 5 10 20 30 45 60 100 150 200 250 300 400];

    for n=1:size(numtrees,2)   
       
    
    save train.txt train -ascii
    save test.txt test -ascii
    
    % Convert train and test to ".arff" file
    ArffTrain = convertToArff('train.txt');
    ArffTest = convertToArff('test.txt');
    
    % Train a J48 classifier
    classifier = weka.classifiers.trees.RandomForest();

    classifier.setNumTrees(numtrees(n));
    classifier.buildClassifier(ArffTrain);
    estimatedTestLabels = zeros(size(test,1),1);
    Estlabeltest = zeros(5,size(test,1));
    % Classify test instances
    numInst = ArffTest.numInstances();
    for k=1:numInst
        temp = classifier.classifyInstance(ArffTest.instance(k-1));
        estimatedTestLabels(k,1) = str2num(char(ArffTest.classAttribute().value((temp))));
    end
    Estlabeltest(fold,:)= estimatedTestLabels';
    
    estimatedTrain = zeros(size(train,1),1);
    Estlabeltrain = zeros(5,size(train,1));
    
    % Classify train instances
    numInst = ArffTrain.numInstances();
    for k=1:numInst
        temp = classifier.classifyInstance(ArffTrain.instance(k-1));
        estimatedTrain(k,1) = str2num(char(ArffTrain.classAttribute().value((temp))));
    end
    Estlabeltrain(fold,:)= estimatedTrain';
   
    % Compute accuracy of each fold test 
    
    testLabels = test(:,end);
    Accuracy_test(fold,n) = (sum(estimatedTestLabels == testLabels) / length(testLabels)) * 100;
    
    % Compute accuracy of each fold train
    trainlabel = train(:,end);
    Accuracy_train(fold,n) = (sum(estimatedTrain == trainlabel) / length(trainlabel)) * 100;
    
    end
end

% Display the average accuracy of all five folds
%fprintf('Five fold classification accuracy of RandomForest classifier on test is: ');
mean(Accuracy_test,1)
%fprintf('\nFive fold classification accuracy of RandomForest classifier on train is: ');
mean(Accuracy_train,1)
% figure
% plot(mean(ACCtrain),'r')
% ylabel('Accuracy');xlabel('Number of Trees');
% title('Random forest Train Accuracies for different values of Trees');
% figure
% plot(mean(ACCtest),'b')
% title('Random forest Test Accuracies for different values of Trees');
% ylabel('Accuracy');xlabel('Number of Trees');
