function data = demodulation_ask(signal,frequency,samplerate,nbrOfBits,maxValue)
% Returns an array of 1's and 0's representing the data of a on-off-keying modulated signal
% TODO:
% Implement clock recovery
% Without clock recovery, this function wont work good unless samplerate % frequency == 0

	data = zeros(1,nbrOfBits);

	threshold = maxValue/2;		
	samplesPerBit = samplerate/frequency; 
	sampleShift = samplesPerBit/2;

	for i=1:nbrOfBits
		%disp(sampleShift)
		if(signal(sampleShift) > threshold)
			data(i) = 1;	
		end
		sampleShift = sampleShift + samplesPerBit;
	end
end
