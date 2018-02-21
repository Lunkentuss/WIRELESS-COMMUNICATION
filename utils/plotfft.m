%Takes a vector and samplerate, calculates the single sided fourier
%transform,plotts this and returns amplitude and frequency vector
function [X,f]=plotfft(x,Sr)
    N=size(x,1);
    %frequency step
    df=Sr/N;
    %frequency vector, has to be this lenght to match the vector comming
    %out of the transform
    f=df*(0:N/2-1);
    %start tranforming
    X=fft(x);
    X=abs(X/N);
    %change from double-sided to single sided transform
    X=X(1:N/2)';
    X(2:end-1) = 2*X(2:end-1);
    %figure;
    %plot(f,X)
end