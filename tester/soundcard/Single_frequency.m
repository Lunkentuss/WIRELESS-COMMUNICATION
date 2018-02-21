
%Plays single frequency%
clear sound;

%Seconds to play frequency
t=100;
%Frequency
freq=2000;
%9.0909e+04;
%Samplerate
samplerate=100000;	%200000 Hz is max, make shure it is large enough for the maxium frequency to be played


samples=samplerate*t;
time_vector=linspace(0,t,samples);
frequency=freq*2*pi;
signal=sin(time_vector*frequency);
sound(signal,samplerate);
