
clear
load('mydata1.mat');%load data

%%initialize
samples_size = length(labels);
indices = K_Fold(samples_size,10);
Gain_r_Acc = zeros(10,1);
Gain_s_Acc = zeros(10,1);
%% ten fold calculate accuracy of decision tree
for fold=1:10
    fold
    % set train and test data with this tenFold
    Train_data = [Data(indices(:,1:fold-1),:) ; Data(indices(:,fold+1:10),:)];
    Train_labels = [labels(indices(:,1:fold-1),:) ; labels(indices(:,fold+1:10),:)];
    Test_data = Data(indices(:,fold),:);
    Test_labels = labels(indices(:,fold),:);
    
    Gain_R_DT = Decision_Tree( Train_data,Train_labels,1,Data );
    Gain_S_DT = Decision_Tree( Train_data,Train_labels,0,Data );
    % calculate each fold Accuracy
    for j=1:length(Test_labels)
        class = Gain_R_DT.Classifier( Test_data(j,:),Train_data );
        Gain_r_Acc(fold) = Gain_r_Acc(fold) + (class == Test_labels(j));
    end
    for j=1:length(Test_labels)
        class = Gain_S_DT.Classifier( Test_data(j,:),Train_data );
        Gain_s_Acc(fold) = Gain_s_Acc(fold) + (class == Test_labels(j));
    end
end
%%
Gain_r_Acc = Gain_r_Acc/812;
Gain_s_Acc = Gain_s_Acc/812;
% calculate final Accuracy
accuracy_Gain_Ratio = mean(Gain_r_Acc) * 100
accuracy_Gain_Split = mean(Gain_s_Acc) * 100
