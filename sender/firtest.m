%%
f = 1000;
fs = 10000;
nf = fs / 2;        % nyqvist frequency
f_norm = f / nf;
nbrTerm = 30;

t = 0:1/fs:10
b = firceqrip(nbrTerm,f_norm,[0.05 0.03]); 
fvtool(b)
y = sin(2*pi*f*t);
y_filt=filter(b,1,y);
plot(t,y_filt);