
clear

fi1 = fopen('dataset.txt');
uniques = cell(1, 23);

line = fgetl(fi1);

data = {};
index = 1;
is_discrete = [];
counter = 1;

while (ischar(line))
    counter = counter + 1;
    
    token = strread(line, '%s', 'delimiter', ',');
    
    for i=1:length(token)
        if(~isfield(data, char(i+64)))
            data = setfield(data, char(i+64), {token{i}});
        else
            data.(char(i+64)){end+1} = token{i};
        end
    end
    
    line = fgetl(fi1);
end

Data = zeros(length(data.A),length(fieldnames(data)));
for i = 1:length(fieldnames(data))
    s1 = str2double(data.(char(i+64)){1});
    s2 = str2double(data.(char(i+64)){2});
    
    % delete '?'
    ind = find(ismember(data.(char(i+64)), '?'));
    for j = 1:length(ind)
        data.(char(i+64)){ind(j)} = '-1';
    end
    
    if(~isnan(s1) || ~isnan(s2))
        col = cellfun(@(x) str2double(x), data.(char(i+64)));
    else
        [col, unq] = converter(data.(char(i+64)));
        is_discrete(end + 1) = i;
        % save uniques index
        uniques{index} = unq;
        index = index + 1;
    end
    
    Data(:, i) = col;
end


labels = Data(:, 1);
Data = [Data(:, 2:end)];

% replace ? with mode
[indices,~] = find(ismember(Data(:,11),-1));

[indices1,~] = find(ismember(labels,1));
mode1 = mode(Data(indices1,11));
[indices2,~] = find(ismember(labels,2));
mode2 = mode(Data(indices2,11));
if(mode1 ~= -1 && mode2 ~= -1)
for i = 1:size(indices,1)
    if(labels(indices(i)) == 1)
        Data(indices(i),11) = mode1;
    elseif(labels(indices(i)) == 2)
        Data(indices(i),11) = mode2;
    end
end
end


save('mydata1','Data','labels');

