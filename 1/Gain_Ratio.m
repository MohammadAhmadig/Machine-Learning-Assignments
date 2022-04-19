function [ gain_ratio ] = Gain_Ratio( data , label )

    %data = [1 2 2 1 2 1 1 1 2 1;1 2 1 2 1 2 2 2 2 2;...
    %    1 2 2 1 2 2 1 2 1 2;1 2 2 1 2 1 2 2 2 1];
    %label = [1 1 1 1 1 2 2 2 2 2];
    %data=data'
    %label=label'
    
    %initialize
    samples_size = length(label);% number of samples
    attrs_size = size(data,2);% number of attributes
    
    split_info = zeros(attrs_size,1);
    gain_split = zeros(attrs_size,1);
    Ent_Root = Entropy(label);
    % calculate gain of Attribute
    for i=1:attrs_size
        sum_entrpy = 0;
        values = unique(data(:,i));
        % calculate Entropy of each value for this attribute
        for j=1:length(values)
           subtree_labels = label(data(:,i) == values(j),:);
           subtree_size = length(subtree_labels);%number of samples that they have this value of attribute
           sum_entrpy = sum_entrpy + (subtree_size/samples_size)*Entropy(subtree_labels);
           split_info(i) = split_info(i) - (subtree_size/samples_size) * log2(subtree_size/samples_size); 
        end
        gain_split(i) = Ent_Root - sum_entrpy;
    end
    % calculate gain ratio
    gain_ratio = gain_split./split_info;
end
