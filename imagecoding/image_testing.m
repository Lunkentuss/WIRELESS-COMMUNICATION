img=imread('test.png');
figure(1)
image(img);
bitstream=imagetobitstream(img);
imga=bitstreamtoimage(bitstream);
figure(2)
image(imga);
