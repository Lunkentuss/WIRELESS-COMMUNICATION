% Strategy-ish pattern for modulation technique
function signal = modulate(data,frequency,samplerate,modulation,varargin);
if(strcmp(modulation,'ook'))
	% varargin{1} = how many times the carrier waves oscillates per bit (e.g f_c = f * varargin{1}) 

	% The header endcodes the amount of bits that are sent 
	header = header_ask(frequency,samplerate,length(data),varargin{1});

	signal = modulation_ask(data,frequency,samplerate,varargin{1});
	signal = [header signal];

elseif(strcmp(modulation,'ask'))
	% varargin{1} == oscPerBit
	% varargin{2} == nbrOfSymbols
	% varargin{3} == scaleArray 
	header = header_ask(frequency,samplerate,length(data),varargin{1}); % The same header as OOK! (for simplicity)

	signal = modulation_ask_v4(data,frequency,samplerate,varargin{1},varargin{2},varargin{3});
	signal = [header signal];

elseif(strcmp(modulation,'bpsk'))
	signal = modulation_bpsk(data,frequency,samplerate,varargin{1});

else
	disp( ['No modulation technique named: ',modulation,' exists'] );
	signal = null(0);
end

end
