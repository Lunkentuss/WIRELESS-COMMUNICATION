function fsignal = lvfilter_fir(signal,fc1,fc2,fs)

Fstop = fc1;
Fpass = fc2;
Astop = 65;
Apass = 0.5;

d = designfilt('highpassfir','StopbandFrequency',Fstop, ...
  'PassbandFrequency',Fpass,'StopbandAttenuation',Astop, ...
  'PassbandRipple',Apass,'SampleRate',fs,'DesignMethod','equiripple');

fsignal=filter(d,signal);
end
