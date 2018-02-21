function fsignal = lvfilter_fir(signal,fc,fs)

nbrTerm = 30; %nbr of terms used in the filter
p2pr = ; %peak2peak ripple
att = ; %stopband attenuation

nf = fs / 2;        % nyqvist frequency
fc_norm = fc / nf;
nbrTerm = 30;

b = firceqrip(nbrTerm,fc_norm,[p2pr att]); 
%fvtool(b)
y_filt=filter(b,1,y);
%plot(t,y_filt);
end
