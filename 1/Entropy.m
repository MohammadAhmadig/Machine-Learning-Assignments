function [ entrpy ] = Entropy( label )

    %label = [1 1 1 1 1 2 2 ]
    Ulabels = unique(label);
    len=length(Ulabels);
    counters = zeros(length(Ulabels),1);
    % calculate frequency of each value
    for i = 1:len
       for j =1:length(label) 
           if(label(j)==Ulabels(i))
               counters(i)= counters(i)+1;
           end
       end
    end
    sample_size = length(label);
    entrpy = sum(-(counters./sample_size).*log2(counters./sample_size));

end
