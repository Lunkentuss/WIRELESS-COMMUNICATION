%Plays sqaure wave through soundcard%
clear sound
%Seconds to play frequency
t=100;
%Frequency
freq=20%9.0909e+04;
%Samplerate
samplerate=200000;	%192000 Hz is max, make shure it is large enough for the maxium frequency to be played

samples=samplerate*t;
time_vector=linspace(0,t*freq/(2*pi),samples);
signal=square(time_vector,50);
sound(signal,samplerate);
%plot(time_vector,signal)u