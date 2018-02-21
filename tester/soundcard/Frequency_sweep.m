
%Plays different frequencies of sinusoidal waves through the soundcard%

%Seconds to play every frequency
t=100;
%Start frequency of the sweep
min_freq=20;
%Stop frequency of the sweep
max_freq=30e3;
%Samplerate
samplerate=200000;	%200000 Hz is max, make shure it is large enough for the maxium frequency to be played
%Distance in hertz between every frequency step
freq_step=1;
samples=samplerate*t;
time_vector=linspace(0,t,samples);
for freq =1:1:max_freq
    frequency=10^(freq/4);
    signal=sin(time_vector*frequency*2*pi);
    sound(signal,samplerate);
    disp('Current frequency:');
    disp(frequency);
    pause;
    clear sound;
end
