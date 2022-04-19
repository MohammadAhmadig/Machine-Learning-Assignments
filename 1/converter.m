function [nList, unq] = converter(list)

unq = unique(list);
nList = zeros(length(list), 1);
counter = 1;
flag = 0;

for i=1:length(unq)
	if(str2double(unq(i)) ~= -1.0)
		ind = find(ismember(list, unq(i)));
		nList(ind) = counter;
		counter = counter + 1;
	else
		flag = 1;
		ind = find(ismember(list, unq(i)));
		nList(ind) = -1;
	end
end

% remove -1 from unq
if(flag == 1) 
	% unq is sorted auto!
	unq = unq(2:end);
end

end