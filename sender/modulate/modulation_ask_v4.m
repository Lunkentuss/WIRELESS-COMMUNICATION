function signal = modulation_ask_v4(data,frequency,samplerate,oscPerBit,nbrOfSymbols,scaleArray)
% @param data
%	an array of bits that is to be encoded in the modulation
% @param frequency 
%	the bit frequency e.g bitrate = 1/frequency	
% @param samplerate
%	sample frequency (if samplerate % frequency = 0)
% @param oscPerBit
%	numbers of revolutions per bit e.g f_carrier = frequency * oscPerBit (should be an integer)
% @param scaleArray 
%	scales the amplitudes of all symbol-amplitudes (this fixes the laser not being linear in all current-regions.)

%if mod(samplerate,frequency) == 0 there's is potential for speed up the algorithm using a look up table for sin
if(samplerate ~= 0 && rem(samplerate,1) == 0 && rem(frequency,1) == 0 && mod(samplerate,frequency) == 0  && rem(oscPerBit,1) == 0 && rem(log2(nbrOfSymbols),1) == 0 && rem(length(data),log2(nbrOfSymbols)) == 0 )

	BIT_SEKV_LEN = log2(nbrOfSymbols);
	samplesPerBit = samplerate/frequency; % e.g samplesPerSymbol

	% Create look up table
	sin_vector=zeros(1,samplesPerBit);
	for i=1:samplesPerBit
		sin_vector(i) = sin(oscPerBit*2*pi*((i-1)/samplesPerBit));
	end	

	signal = zeros(1,length(data)/BIT_SEKV_LEN*samplesPerBit+1); 

	for i=0:length(data)/BIT_SEKV_LEN - 1
		bin = data(i*BIT_SEKV_LEN+1:(i+1)*BIT_SEKV_LEN);
		amplitude = bin2gray(bi2de(bin),'pam',nbrOfSymbols);
		amplitude = (amplitude + 1)/nbrOfSymbols * scaleArray(amplitude+1); % REMEMBER TO DO THE SAME THING IN DEMODULATOR!! :D
		for j=1:length(sin_vector)
			signal((i)*length(sin_vector)+j) = sin_vector(j) * amplitude;
		end
	end

else
	disp('error')
end
