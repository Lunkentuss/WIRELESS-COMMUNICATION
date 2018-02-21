%Receives the signal from the soundcard/oscillosope
%depending on <input> string
function signal = receive(samplerate,input,recordtime)
	if(strcmp('osc',input))
		disp('Oscillsocope not yet implemented')
	elseif(strcmp('sound',input))
        recObj = audiorecorder(samplerate,16,1);
        recordblocking(recObj,recordtime);
        signal = getaudiodata(recObj);
	else
		disp(['No input named: ',input])
	end
end
