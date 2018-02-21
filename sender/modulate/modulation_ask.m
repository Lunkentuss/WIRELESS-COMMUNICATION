function signal = modulation_ask(data,frequency,samplerate,oscPerBit)
% @param data
%	an array of bits that is to be encoded in the modulation
% @param frequency 
%	the bit frequency e.g bitrate = 1/frequency	
% @param samplerate
%	sample frequency (if samplerate % frequency = 0)
% @param oscPerBit
%	numbers of revolutions per bit e.g f_carrier = frequency * oscPerBit (should be an integer)

%if mod(samplerate,frequency) == 0 there's is potential for speed up the algorithm using a look up table for sin
if(samplerate ~= 0 && rem(samplerate,1) == 0 && rem(frequency,1) == 0 && mod(samplerate,frequency) == 0 )
	samplesPerBit = samplerate/frequency;

	% Create look up table
	sin_vector=zeros(1,samplesPerBit);
	for i=1:samplesPerBit
		sin_vector(i) = sin(oscPerBit*2*pi*((i-1)/samplesPerBit));
	end	

	signal = zeros(1,length(data)*samplesPerBit+1); 

	for i=1:length(data)
		if(data(i) == 1)
			for j=1:length(sin_vector)
				signal((i-1)*length(sin_vector)+j) = sin_vector(j);
			end
		end
	end

else
	t_tot = length(data)/frequency;
	t = linspace(0,t_tot,t_tot*samplerate);
	signal = zeros(1,length(t));

	p_time = 1 / frequency;
	for i=1:length(t)-1
		signal(i) = abs(sin(pi*frequency*t(i))) * data(floor(t(i)/p_time + 1));
        
	end

end
