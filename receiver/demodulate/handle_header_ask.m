function [signal_clip,nbrOfBits,meanEnv] = handle_header_ask(signal,frequency,samplerate)
%~TODO~
% Fix algorithm so it works when samplerate % frequency != 0
%~TODO~

% The threshold for detecting the signal
THRESHOLD_CONST = 0.07;	
% Numbers of bits in the header for representing the number of bits the real signal is sending
NBR_OF_BITS = 32;	

NBR_OF_INITIAL_BITS = 20;

samplesPerBit = samplerate/frequency;

% index of first value of signal that is above the threshold
t_index = -1;
for i=1:length(signal)
	if(signal(i) > THRESHOLD_CONST)	
		t_index = i;		
		break;	
	end
end	

if(t_index == -1)
	error('No signal found over the header threshold')
end

% Finds the peak of the first on-off state of the header
meanEnv = mean(signal(t_index:(t_index + samplesPerBit * NBR_OF_INITIAL_BITS)));

% Clip of the part of the signal before and the first header on-state
signal_clip = signal((t_index + NBR_OF_INITIAL_BITS*samplesPerBit):length(signal));

% Decode the amount of bits in the sent signal of the header
nbrOfBits = bi2de( demodulation_ask(signal_clip,frequency,samplerate,NBR_OF_BITS,meanEnv) );

% Remove the header from the signal
signal_clip = signal_clip( (samplesPerBit * NBR_OF_BITS):length(signal_clip) );


disp(nbrOfBits)
end
