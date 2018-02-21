addpath('../sender/createdata/')
addpath('../imagecoding/')
img=imread('pic.png');
%create testing data
%inData=imagetobitstream(img);
inData=[1 0 0 1 1];
%encode
data=hamming_encoding(inData);
%add errors
data(3)=~data(3);
data(4)=~data(4);
%decode
[outData,errors]=hamming_decoding(data);
%check if everything worked
if(all(outData==inData'))
    disp('It worked!')
else
    disp('Nope, it broke')
end
outData