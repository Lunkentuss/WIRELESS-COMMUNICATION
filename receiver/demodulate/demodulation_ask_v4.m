function data = demodulation_ask_v4(signal,frequency,samplerate,nbrOfBits,maxValue,oscPerBit,nbrOfSymbols)
% Returns an array of 1's and 0's representing the data of a on-off-keying modulated signal
% TODO:
% Implement clock recovery
% Without clock recovery, this function wont work good unless samplerate % frequency == 0

	nbrOfMeans = 200;

	data = zeros(1,nbrOfBits);
	BIT_SEKV_LEN = log2(nbrOfSymbols);

	samplesPerBit = samplerate/frequency; 
	sampleShift = 1;

	
	deci_sekv = ppm_round(signal(1),maxValue,nbrOfSymbols);
	data(1:BIT_SEKV_LEN) = de2bi0(gray2bin(deci_sekv,'pam',nbrOfSymbols),BIT_SEKV_LEN);	

	% Mean
	meanArray = java.util.LinkedList;
	meanSum = 0;

	for i=2:nbrOfMeans+1

		sampleShift = sampleShift + samplesPerBit;
		sampleShift = sampleShift + oversampling_delay(signal(sampleShift-1),signal(sampleShift),signal(sampleShift+1));
		deci_sekv = ppm_round(signal(sampleShift),maxValue,nbrOfSymbols);
		data(1+(i-1)*BIT_SEKV_LEN:i*BIT_SEKV_LEN) = de2bi0(gray2bin(deci_sekv,'pam',nbrOfSymbols),BIT_SEKV_LEN);

		% Mean 
		mean0 = nbrOfSymbols/(deci_sekv + 1) * signal(sampleShift);
		meanArray.add(mean0);
		meanSum = meanSum + mean0;
		
	end

	% Mean
	meanValue = meanSum / nbrOfMeans;

	% Debugger
	%dbvec = zeros(1,nbrOfBits);

	for i=nbrOfMeans+2:nbrOfBits/BIT_SEKV_LEN

		sampleShift = sampleShift + samplesPerBit;
		sampleShift = sampleShift + oversampling_delay(signal(sampleShift-1),signal(sampleShift),signal(sampleShift+1));
		deci_sekv = ppm_round(signal(sampleShift),meanValue,nbrOfSymbols);
		data(1+(i-1)*BIT_SEKV_LEN:i*BIT_SEKV_LEN) = de2bi0(gray2bin(deci_sekv,'pam',nbrOfSymbols),BIT_SEKV_LEN);

		% Calculate new mean
		mean0 = nbrOfSymbols/(deci_sekv+1) * signal(sampleShift);
		meanValue = (mean0-meanArray.remove(0))/nbrOfMeans + meanValue;	
		meanArray.add(mean0);

		% Debugger
		%dbvec(i) = meanValue;		
	end
	% Debugger
	%plot(dbvec);
end

%de2bi0(gray2bin(amp,'pam',nbrOfSymbols),BIT_SEKV_LEN);
