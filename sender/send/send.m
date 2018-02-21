%send
% Sends the signal to the soundcard/oscillosope depending on <output> string
function null = send(signal,samplerate,output)

if(strcmp(output,'osc'))
	% send to oscilloscope
elseif(strcmp(output,'sound'))
	sound(signal,samplerate);
else
	disp(['No output named: ',output])
end

end
