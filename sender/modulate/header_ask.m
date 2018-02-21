function header = header_ask(frequency,samplerate,nbrOfBits,oscPerBit)

% Numbers of bits in the header for representing the number of bits the real signal is sending
% It is constant and not dependent on nbrOfBits input
NBR_OF_BITS = 32;
NBR_OF_INITIAL_BITS = 20;

nbrOfBits_deci = de2bi0(nbrOfBits,NBR_OF_BITS);

header1 = ones(1,20);

header = modulation_ask([header1 nbrOfBits_deci],frequency,samplerate,oscPerBit);

header = header(1:length(header)-1); %remove last 0 so it merges nicely with the appending signal

end
