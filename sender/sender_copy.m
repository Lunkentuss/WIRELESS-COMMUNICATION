%% sender 
clear
clear sound
% creates data, modulates data and sends the modulated signal

%--- load paths ---
addpath('../utils/')
addpath('./createdata/')
addpath('./modulate/')
addpath('./send/')
%addpath('./send/oscilloscope/')
%addpath('./send/soundcard/')
%--- load pathss ---

% Set frequency, samplerate etc 

frequency = 1 * 15000;
samplerate = frequency * 10;

% Create vector with data (use the function cell for creation of vector containing strings)--------

data = createdata('random',1000000,10);
%data = [0 1 0 1];

% Modulate digital signal to arbitary modulation (dont forget header?)D/A--------------------------

signal = -1 * modulate(data,frequency,samplerate,'ask',1,2,[0.8 1]); % * -1 cause the signal is inverted cause of op-amps

% Send to sound method

signal = [zeros(1,100000) signal zeros(1,100000)];

%%

clear sound
send(signal,samplerate,'sound');

disp('sent')
