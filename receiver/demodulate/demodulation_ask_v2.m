function data = demodulation_ask_v2(signal,frequency,samplerate,nbrOfBits,maxValue,oscPerBit)
% Returns an array of 1's and 0's representing the data of a on-off-keying modulated signal
% TODO:
% Implement clock recovery
% Without clock recovery, this function wont work good unless samplerate % frequency == 0

	data = zeros(1,nbrOfBits);

	threshold = maxValue/2;		
	samplesPerBit = samplerate/frequency; 
	sampleShift = 0;

	
	if(signal(1) > threshold)
		data(1) = 1;	
	end
	
	for i=2:nbrOfBits
		% fix this so it doesn't check every time
		sampleShift = sampleShift + samplesPerBit;
		if(signal(1+sampleShift) > threshold)
			data(i) = 1;	
			sampleShift = sampleShift + oversampling_delay(signal(sampleShift),signal(sampleShift+1),signal(sampleShift+2));
		end
	end
end
