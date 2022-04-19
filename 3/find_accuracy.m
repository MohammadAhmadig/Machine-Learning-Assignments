function [ result ] = find_accuracy( y,label )
    n = length(y);
    nCorrect = sum(y==label);
    result = (nCorrect/n)*100;
end

