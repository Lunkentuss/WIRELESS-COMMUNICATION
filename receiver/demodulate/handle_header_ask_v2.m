function [signal_clip,nbrOfBits,meanEnv] = handle_header_ask_v2(signal,frequency,samplerate,oscPerBit)
%~TODO~
% Fix algorithm so it works when samplerate % frequency != 0
%~TODO~

% Numbers of bits in the header for representing the number of bits the real signal is sending
NBR_OF_BITS = 32;	

% Number of initial bits that are sent to make a estimate of the peak2peak-value of the sinus wave (just 1's  are sent)
NBR_OF_INITIAL_BITS = 20;

samplesPerBit = samplerate/frequency;

% Finds the peak of the first on-off state of the header
meanEnv = mean_even_space(signal,oscPerBit*NBR_OF_INITIAL_BITS,samplesPerBit/oscPerBit);

% Decode the amount of bits in the sent signal of the header
nbrOfBits = bi2de( demodulation_ask_v2(signal(1+samplesPerBit*NBR_OF_INITIAL_BITS:length(signal)),frequency,samplerate,NBR_OF_BITS,meanEnv,oscPerBit) );

% Remove the header from the signal
signal_clip = signal( (1+samplesPerBit * (NBR_OF_INITIAL_BITS + NBR_OF_BITS)) : length(signal) );


disp(['Number of bits sent: ',num2str(nbrOfBits)])
disp(['Mean value of maximum amplitude from header: ',num2str(meanEnv)])
end
