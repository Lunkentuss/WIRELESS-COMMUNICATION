%% BER-testing sender 
% sends a pseudo random binary sequence for testing of the bit error rate

%--- load paths ---
addpath('../utils/')
addpath('../sender/createdata/')
addpath('../sender/modulate/')
addpath('../sender/send/')
addpath('../error_correction/')
%addpath('./send/oscilloscope/')
%addpath('./send/soundcard/')
%--- load pathss ---

clear sound

% Set frequency, samplerate etc 

frequency = 19e3;
samplerate = frequency * 10;

number_of_bits= 1000000;

% Create vector with data (use the function cell for creation of vector containing strings)--------

data = createdata('random',number_of_bits,10);
%data = idinput(number_of_bits,'prbs',[],[0 1]);

%data=hamming_encoding(data');


% Modulate digital signal to arbitary modulation (dont forget header?)D/A--------------------------

signal = -1 * modulate(data,frequency,samplerate,'ook',1,2); % * -1 cause the signal is inverted cause of op-amps
signal = [zeros(1,10000) signal zeros(1,10000)];
% Send to sound method
disp('ready')
pause;

send(signal,samplerate,'sound');
time=floor(number_of_bits/frequency);
for i=0:time
    time_left=time-i;
    clc
    disp('Seconds left:')
    disp(time_left)
    pause(1)
end
