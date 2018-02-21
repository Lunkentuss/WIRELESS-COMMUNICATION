%Plays a signal with a specified number of dc levels between -1 and 1%
clear sound;


%Seconds to play frequency
t=5;
%Frequency
number_of_levels=2; %>1
%Samplerate
samplerate=200000;	%200000 Hz is max, make shure it is large enough for the maxium frequency to be played

number_of_samples=samplerate*t;
time=linspace(0,t,number_of_samples);
signal=zeros([number_of_samples 1]);
old_index=1;
for n=1:number_of_levels
    %change from last endpoint to make sure no points are missed because of
    %rounding errors.
    signal(old_index:floor(n*number_of_samples/number_of_levels))=2*(n/(number_of_levels-1)-1/(number_of_levels-1))-1;
    old_index=floor(n*number_of_samples/number_of_levels);
end

sound(signal,samplerate);
