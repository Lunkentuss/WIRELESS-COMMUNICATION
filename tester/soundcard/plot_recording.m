%time to record
time=7;
%samplerate
Sr=20000;
recObj = audiorecorder(Sr,16,1);
t=linspace(0,time,time*Sr);
recordblocking(recObj,time);
y = getaudiodata(recObj);
plot(t,y)