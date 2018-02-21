%%
clc
clf
NoOfBits = 1e3;
data = randi([0,1],NoOfBits,1);    %[0 1 0 1 1 1 0 0 1 0 1 0 1 0 1 0]';

% signal = modulation_ask(data,frequency,samplerate,oscPerBit)
frequency = 5e4; % bits per second
sampleRate = 1e6; % 
oscPerBit = 1;
pskData = modulation_bpsk(data,frequency,sampleRate,oscPerBit);
tv = linspace(0,length(pskData)/frequency,length(pskData));
Nshow = 1e3;
%plot(tv',pskData)
%grid on
legend(num2str(data(1:8)))

addpath('/Users/LosAlamos/Documents/ChalmersActual/KandidatArbete/programming/WIRELESS-COMMUNICATION/receiver/demodulate');
addpath('/Users/LosAlamos/Documents/ChalmersActual/KandidatArbete/programming/WIRELESS-COMMUNICATION/sender/modulate');
filtOrd = 4;
ut = demodulation_BPSK(pskData,sampleRate,frequency,filtOrd);
plot(ut(1:end))












%% create signal [for test]
Fs = 1000;            % Samp Frequ
T = 1/Fs;             % Samp period
L = 1500;             % Signal Length
t = (0:L-1)*T;        % Tid
x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x = x1+2*x2;
N = 100%length(x);
plot(t(1:N), x(1:N))
grid on
%% Fourier transform
Fs = sampleRate;
L = length(pskData);
Y = fft(pskData);                     % Makes a DFT of signal
disp('1')
P2 = abs(Y/L);                  % makes sure to get the real part   
disp('2')
P1 = P2(1:L/2+1);               % gets single sided spectrum
disp('3')
P1(2:end-1) = 2*P1(2:end-1);    
disp('4')
f = Fs*(0:(L/2))/L;             % creates frequency vector
disp('5')
plot(f,P1)
grid on

[value,index] = max(P1);
carrFreq = f(index)



%% 
pause  
X1 =ginput(1); 
X2 = ginput(1);
freq = 1/(X1(1)-X2(1))
%%
f1 = 100;               % Signal freqs
f2 = 8000;
Fs = 1e2*max([f1 f2]);  % Samp Frequ, makes sure to get passed nyquist criteria
Nperiods = 1e3;
t = (0:1/Fs:Nperiods/min(f1,f2));
x1 = sin(2*pi*f2*t);
x2 = 2*sin(2*pi*f1*t);
randVec = 1*randi([-1,1],1,length(x1));
x = x1 + randVec;%+ x2;
figure(1)
subplot(2,1,1)
Nshow = 4;
plot(t(1:1:Nshow*f1),x(1:1:Nshow*f1))
title('Original signal')
grid on

Y = fft(x);

Y = abs(Y);
L = length(Y)-1;
Y = Y(1:1:L/2)/max(Y);

disp('hej')
f = (0:1:L/2-1)*Fs/L;
subplot(2,1,2)
plot(f,Y);
title('frequency domain')
grid on

%%
clf
omegaCutoff = 1e4;
[a b] = butter(3,1/20,'low');
%{
x_filt = filter(a,b,x);
plot(t(1:1:Nshow*f1),x_filt(1:1:Nshow*f1))
title('Filtered signal in time')
grid on
%}
bode(a,b)
grid on



%%
Y = fft(x)
figure(2)
plot((0:length(x)-1)*T,abs(Y))

%%
a = [1 2 3];
b = [4 5 6 7];
c = [a b]
%% Brickwall filter test

[a b] = butter(20,1/10,'low');
bode(a,b)
grid on
%%
n = 60;
wo = 0.3;
dp = 0.02;	
ds = 0.008;
h = fircls1(n,wo,dp,ds);
%fvtool(h,1);










 