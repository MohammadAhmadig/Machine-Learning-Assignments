
clc;clear;close all;

transition = [7/13 6/13;1/3 2/3];% s1s1 s1s2;s2s1 s2s2
prior = [3/5 2/5];
emission = [5/7 2/7;1/4 3/4];% row for s1 s2
seq = [1 2 1 1];% good is 1 and bad is 2

alphas = Forward(prior,transition,emission,seq)

sum1 = sum(alphas(:,end))
[~,states] = max(alphas)% cold is state1 and Hot is state2  

[scores,path] = Viterbi(prior,transition,emission,seq);
%find best path
best_path = zeros(1,size(seq,2));
[~,best_path(end)] = max(scores(:,end));

i = size(seq,2)-1;
while(i~=0)    
    best_path(i) = path(best_path(i+1),i);
    i = i-1;
end
scores
max(scores(:,end))
best_path
    
