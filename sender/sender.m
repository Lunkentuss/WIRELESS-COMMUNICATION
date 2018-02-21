%% sender 
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

frequency = 2 * 10^3;
samplerate = frequency * 20;

% Create vector with data (use the function cell for creation of vector containing strings)--------

data = createdata('random',{'10*10^3'});

% Modulate digital signal to arbitary modulation (dont forget header?)D/A--------------------------

signal = -1 * modulate(data,frequency,samplerate,'ook',4); % * -1 cause the signal is inverted cause of op-amps

% Send to sound method

send(signal,samplerate,'sound');

