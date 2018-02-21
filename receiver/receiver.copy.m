%% Receiver 
% 

%--- load paths ---
%addpath('./representdata/')
addpath('./demodulate/')
addpath('../utils/')
addpath('./receive/')
%addpath('./receive/soundcard/')
%addpath('./receive/oscilloscope/')
%--- load paths ---

% Set frequency, samplerate etc 

frequency = 10 * 10^3;
samplerate = frequency * 10; 

% Receives the data from sound card/oscilloscope

signal = receive(samplerate,'sound',5);

% Filter the signal with digital filter (butterworth(), filtfilt() or filt()) or implement own FIR- and IIR-filer 

signal=hpfilter_fir(signal,150,180,samplerate);

% Demodulates the signal to an array of bits (1 and 0's array)

data = demodulate(signal,frequency,samplerate,'ook',1,2);

% Optional, represent the data, depending of the data type

data
