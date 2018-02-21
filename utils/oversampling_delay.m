function delay = oversampling_delay(early,now,late)
% In an oversampling signal e.g samplerate >> nyqvist frequency,
% this function can be used to decide which sample is best for measurment
% and returns an delay of 1 or -1 if a sample to the right respective 
% to the left is a better sample, 0 otherwise.
% Better sample == higher value

delay = 0;
if(early > now)
	delay = -1;
elseif(late > now)
	delay = 1;
end

end
