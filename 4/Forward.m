function [ result ] = Forward( prior,transition,emission,sequence )

result = zeros(size(transition,1),size(sequence,2));
result(1,1) = prior(1)*emission(1,sequence(1));
result(2,1) = prior(2)*emission(2,sequence(1));
for i =2:size(sequence,2)
    temp = (transition(1,1)*result(1,i-1))+(transition(2,1)*result(2,i-1));
    result(1,i) = temp * emission(1,sequence(i));
    temp = (transition(1,2)*result(1,i-1))+(transition(2,2)*result(2,i-1));
    result(2,i) = temp * emission(2,sequence(i));
    
end

end

