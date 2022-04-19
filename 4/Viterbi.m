function [ scores , path ] = Viterbi( prior,transition,emission,sequence )

    scores = zeros(size(transition,1),size(sequence,2));
    path = zeros(size(transition,1),size(sequence,2)-1);
    
    scores(1,1) = prior(1)* emission(1,sequence(1));
    scores(2,1) = prior(2)* emission(2,sequence(1));
    
    for i =2:size(sequence,2)
        temp = [scores(1,i-1)*transition(1,1) , scores(2,i-1)*transition(2,1)];
        [val,ind] = max(temp);
        path(1,i-1)=ind;
        scores(1,i) = val * emission(1,sequence(i));
        
        temp = [scores(1,i-1)*transition(1,2) , scores(2,i-1)*transition(2,2)];
        [val,ind] = max(temp);
        path(2,i-1)=ind;
        scores(2,i) = val * emission(2,sequence(i));

    end

end

