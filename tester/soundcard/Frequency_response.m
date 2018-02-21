addpath('../../')
%time to record
time=2;
%samplerate
Sr=200000;
charlie = 0;
recObj = audiorecorder(Sr,16,1);
t=linspace(0,time,time*Sr);
A=zeros([25 1]);
f=zeros([25 1]);
i=1;
addpath('../../utils')
%while ~(charlie==1)
while i<25
    clf
    recordblocking(recObj,time);
    y = getaudiodata(recObj);
    %plot(t,y)
    [X,F]=plotfft(y,Sr);
    %[pks] = findpeaks(X);
    [M,I] = max(X);
    A(i)=M;
    disp('A')
    disp(A(i))
    disp('f')
    f(i)=F(I);
    disp(f(i))
    pause;
    i=i+1;
    %charlie = input('skriv 1 eller avbryt: ')
end
%%
loglog(f,A,'-*')
grid on

