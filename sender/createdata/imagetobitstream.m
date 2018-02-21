%takes an image in form of a matrix, converts it to a bit vector, max
%256*256px!!!!
function bitstream = imagetobitstream(imgagename)
 img=imgagename;
 %check size
 vsize=size(img,1);
 hsize=size(img,2);
 %preallocate the bitstream, 16 bits for size, 8 bits for every color in
 %every pixel
 bitstream=zeros(1,hsize*vsize*3*8+16);
 %add size to bitstream
 bitstream(1:8)=de2bi(vsize,8);
 bitstream(9:16)=de2bi(hsize,8);
 binaryimg=de2bi(img);
 %add every row vector to the end of bitstream
 for i=1:(hsize*vsize*3)
     %add every element in the byte row
     for n=1:8
         bitstream((i-1)*8+n+16)=binaryimg(i,n);
     end     
 end
end
