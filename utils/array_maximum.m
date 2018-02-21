function [index value] = array_maximum(a)
% Returns the index and maxvalue of the maximum value of the array a

index = 1;
value = a(1);

for i=2:length(a)
	if(a(i) > value)	
		index = i;
		value = a(i);
	end
end

end
