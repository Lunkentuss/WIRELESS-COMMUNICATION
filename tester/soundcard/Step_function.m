
%Plays step function
%Seconds to play frequency
t=10;
%Samplerate
samplerate=200000;	%200000 Hz is max, make shure it is large enough for the maxium frequency to be played


samples=samplerate*t;
time_vector=linspace(0,t,samples);
signal=heaviside(time_vector-2);
sound(signal,samplerate);

