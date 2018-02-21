%takes a bitstream and converts it to an image
function img = bitstreamtoimage(bitstream)
    %the bitstream contains 8 bit numbers, create a column of these numbers
    %in decimal
    vec2mat(bitstream,8);
    deci_col=bi2de(vec2mat(bitstream,8));
    %the first to numbers are the height and width of the image
    vsize=deci_col(1);
    hsize=deci_col(2);
    %allocate the image matrix, one dimension for r,g and b
    img=zeros(vsize,hsize,3);
    
    %loop through and allocate every pixel, k for every color value, i for
    %the horizontal index and n for the vertical
    for k=1:3
        for i=1:hsize
            for n=1:vsize
                %offset the index by 2 to get rid of the first bytes
                %containing size information
                img(n,i,k)=deci_col(2+n+(i-1)*vsize+(k-1)*hsize*vsize);
            end
        end
    end
    %matlab for some reason makes the elements doubles, this causes the
    %image to be wrongly interpreted, change to uint8
    img=uint8(img);
end
