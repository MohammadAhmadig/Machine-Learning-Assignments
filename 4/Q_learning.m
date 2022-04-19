
clc;clear;close all;
num_of_states = 12;
num_of_actions = 4;
gama = 0.9;
%initialize
Reward = zeros(num_of_states,num_of_actions);
Q1 = zeros(num_of_states,num_of_actions);
Reward(3,2)=100;
Reward(6,4)=100;
Reward(11,1)=100;
Reward(8,3)=100;
Reward(7,:) = 0;% 0 for illegal moves state 7
Reward([1 2 3 4],1) = -99;%up
Reward([9 10 11 12],2) = -99;%down
Reward([1 5 9],3) = -99;%left
Reward([4 8 12],4) = -99;%rigth

adj = [0 5 0 2;0 6 1 3;0 7 2 4;0 8 3 0;1 9 0 6;2 10 5 7;3 11 6 8
    ;4 12 7 0;5 0 0 10;6 0 9 11;7 0 10 12;8 0 11 0] ;
 
Q1(7,:) = 0;% -99 for illegal moves
Q1([1 2 3 4],1) = -99;%up
Q1([9 10 11 12],2) = -99;%down
Q1([1 5 9],3) = -99;%left
Q1([4 8 12],4) = -99;%rigth
counter = 0;
stopFlag = 0;

for j = 1:100
    %temp = Q1;
for i = 1:num_of_states
    counter = counter +1;
    temp = Q1;
    if(i ~= 7)%dont update Q for state7
        ind = randi(4);
        while(adj(i,ind) == 0)
            ind = randi(4);
        end

        Q1(i,ind) = Reward(i,ind) + (gama * max(Q1(adj(i,ind),:)));

    end
    
    if( isequal(Q1,temp) )
        stopFlag = stopFlag + 1;
    else
        stopFlag = 0;
    end

    sum1(1,counter) = sum(sum(abs(Q1-temp)));% j shavad bara halate dovom
    if (stopFlag == 50)
        break;
    end
end
% in 3 khat comment shavad bara halate nemudare dovom
if (stopFlag == 50)
    break;
end
end
Q1(7,:)=-99;
figure;
plot(sum1(1:end));


