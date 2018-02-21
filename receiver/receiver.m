%% Receiver 
ind = 0;
%% 
clc
%ind = ind + 1;
%--- load paths ---
addpath('./demodulate/')
addpath('./receive/')
%addpath('./receive/soundcard/')
%addpath('./receive/oscilloscope/')
addpath('../utils/')
addpath('./bit2data/')
addpath('../sender/createdata/')
addpath('./DataRecs260417/')
%--- load paths ---
%
% Set frequency, samplerate etc 
ind = 10;
frequency = 17e3;
samplerate = frequency * 10; 
nofBits = 1e6;
% Receives the data from sound card/oscilloscope

signal = receive(samplerate,'sound',nofBits/frequency+5);
signal = hpfilter_fir(signal,100,2000,samplerate);
disp('l?st klart')
% Filter the signal with digital filter (butterworth(), filtfilt() or filt()) or implement own FIR- and IIR-filer 
filename = ['Freq' num2str(frequency) 'MeasNo' num2str(ind) '.mat'];
% filtfilt()
save(filename)
disp(filename)
%%
[X,f] = plotfft(signal,18e4);
plot(f,X)
%%
addpath('./DataRecs260417/')
frequency = 17e3;
ind = 10;

loadFilename = ['Freq' num2str(frequency) 'MeasNo' num2str(ind) '.mat'];
load(loadFilename)

% Demodulates the signal to an array of bits (1 and 0's array)
time1 = cputime;
data = demodulate(signal,frequency,samplerate,0.07,'ask',1,2);
deltatime = (-time1+cputime)/60
disp(' = demoduleringtid')

% Optional, represent the data, depending of the data type

k = 0;
jv = zeros(length(data),1);
facit = createdata('random',nofBits,10);
for jj = 1:length(data)
    if facit(jj)~=data(jj)
        k = k+1;
       %jv(k) = jj;
    end
end
jv = jv(1:k);
nofError = k
BER = k/nofBits
%%
sumk = facit-data;
sumk = abs(sumk);
summaFel = sum(sumk)


