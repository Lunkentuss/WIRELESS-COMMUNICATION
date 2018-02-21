%% Demodulate BPSK
%   Demodulation according to lock in method

function outPut = demodulation_BPSK(dataIn,sampleRate,frequency,filtOrd)
SamplesPerBit = sampleRate/frequency;

K = 7;
wc = 1/10;



% find the carrier wave frequency
[~, Index] = findpeaks(dataIn); 


T = zeros(1,K); % K = number of header oscilations for first binary bit
                % coming from modulation_BPSK. MUST BE CORRECT DANKE VERY
                % MUCH
for jj = 1:K
    T(jj) = Index(jj+1)-Index(jj);
end
% create a wave to multiply with
disp('hejsan lunkentuss')
carrFreq = length(T)/sum(T)
L = length(dataIn);
tv = (1:1:L);
mSin = sin(2*pi*carrFreq*tv);   %multiplier wave
%find phase
%%{
[~,indMSin] = findpeaks(mSin);
[~,indData] = findpeaks(dataIn);
indMSin = indMSin(1);
indData = indData(1);
deltaPhi = (indMSin-indData)/(pi);
mSin = sin(2*pi*carrFreq*tv+deltaPhi);
%}

multipliedSignal = mSin.*dataIn;    %multiply signals
[a b] = butter(filtOrd,wc,'low');
filteredSignal = filter(a,b,multipliedSignal);
filteredSignal = floor(filteredSignal)+1;
%%{
clf
N = 20;
    figure(1)
    subplot(2,1,1)
    plot(tv(1:N*T(3)),mSin(1:N*T(3)))
    hold on
    plot(tv(1:N*T(3)),dataIn(1:N*T(3)))
    grid on
    legend('multiplier wave','modulated data')
    subplot(2,1,2)
    plot(tv(1),filteredSignal(1))
    grid on
%}



outPut = filteredSignal;


