function signal_cut = cut2threshold(signal,threshold)
% Cuts the given signal to the value that is above the given threshold

cut_index = -1;

for i=1:length(signal)
	if(signal(i) > threshold)	
		cut_index = i;
		break;
	end
end

if(cut_index == -1)
	error('No signal found over the header threshold')
end

signal_cut = signal(cut_index-1:length(signal));

end
