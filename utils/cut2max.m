function signal_cut = cut2max(signal,end_index)
% Cuts off the signal to the index that has the maximum signal value of the indices 1-end_index

max_index = 1;

for i=1:end_index
	if(signal(i) > signal(max_index))
		max_index = i;
	end
end

signal_cut = signal(max_index:length(signal));


end
