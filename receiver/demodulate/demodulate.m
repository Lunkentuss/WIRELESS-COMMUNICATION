% Strategy-ish pattern for demodulation technique
function data = demodulate(signal,frequency,samplerate,threshold,demodulation,varargin);

if(strcmp(demodulation,'ook_envelope'))
	% Envelopes the upper bound of the signal (should implement a faster envelope function, but works for now)
	[signal,null] = envelope(signal); 
	%plot(signal);

	% Removes the beginning of the signal which is nonsense and calculates nbrOfBits and the maxvoltage of the signal from the header 
	[signal,nbrOfBits,maxValue] = handle_header_ask(signal,frequency,samplerate);
	%plot(signal)

	% demodulates the signal the clipped signal	
	data = demodulation_ask(signal,frequency,samplerate,nbrOfBits,maxValue);
	%plot(signal)

elseif(strcmp(demodulation,'am'))
	data = am_demodulation(signal,frequency,samplerate);

elseif(strcmp(demodulation,'ook'))
	%varargin{1} = oscPerBit

	% Removes the beginning of the signal which is nonsense 
	signal = cut2threshold(signal,threshold);

	signal = cut2max(signal,samplerate/(frequency * varargin{1} * 2));

	[signal,nbrOfBits,maxValue] = handle_header_ask_v2(signal,frequency,samplerate,varargin{1});
	%plot(signal)

	% demodulates the signal the clipped signal	
	data = demodulation_ask_v2(signal,frequency,samplerate,nbrOfBits,maxValue,varargin{1});
	%plot(signal)

elseif(strcmp(demodulation,'ask'))
	%varargin{1} = oscPerBit
	%varargin{2} = nbrOfSymbols 

	% Removes the beginning of the signal which is nonsense 
	signal = cut2threshold(signal,threshold);

	signal = cut2max(signal,samplerate/(frequency * varargin{1} * 2));

	[signal,nbrOfBits,maxValue] = handle_header_ask_v2(signal,frequency,samplerate,varargin{1}); % Same header as OOK
	%plot(signal)

	% demodulates the signal the clipped signal	
	data = demodulation_ask_v4(signal,frequency,samplerate,nbrOfBits,maxValue,varargin{1},varargin{2});
	%plot(signal)

elseif(strcmp(demodulation,'OSV2'))
	%data = somefunction2_demodulation(data,frequency,samplerate);

else
	disp( ['No modulation technique named: ',demodulation,' exists'] );
	data = null(0);
end

end
