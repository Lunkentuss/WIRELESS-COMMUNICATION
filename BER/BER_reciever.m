%% BER-reciever
% 

%--- load paths ---
%addpath('./representdata/')
addpath('../receiver/demodulate/')
addpath('../receiver/receive/')
addpath('../reciever/receive/soundcard/')
%addpath('../reciever/receive/oscilloscope/')
%--- load paths ---

% Set frequency, samplerate etc 

frequency = 10e3;
samplerate = frequency * 10; 

number_of_generated_bits=2000; %this has to be the same as in the send function

% generate the sent data bits

correct_data=idinput(number_of_generated_bits,'prbs',[],[0 1]);
                

% Receives the data from sound card/oscilloscope

signal = receive(samplerate,'sound',5);

% Filter the signal with digital filter (butterworth(), filtfilt() or filt()) or implement own FIR- and IIR-filer 

% filtfilt()


% Demodulates the signal to an array of bits (1 and 0's array)

data = demodulate(signal,frequency,samplerate,'ook');

%--Start comparing the sent and recieved data--%

% Check length
if(number_of_generated_bits==length(data))
    %check equality
    errorbits=number_of_generated_bits-sum(correct_data==data);
elseif(number_of_generated_bits<length(data))
    disp('More data recieved than generated, will compare the beginning')
    %compare begining
    errorbits=number_of_generated_bits-sum(correct_data==data(1:number_of_generated_bits));

else
    disp('Less data recieved than generated, will compare the beginning')
    %compare untill the end of data
    errorbits=number_of_generated_bits-sum(correct_data(1:length(data)==data));
end
BER=errorbits/number_of_generated_bits;
confidence_level=1-exp(-number_of_generated_bits*BER)

