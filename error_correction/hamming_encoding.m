%takes a datastring and encodes it using the hamming(7,4) method
%padding is used to make sure that the datastring is divisible by 4
%the padding consists of two bits with information about how many
%aditional padding bits there are
function eData=hamming_encoding(inData)
    %encoding matrix
    G=[1 1 0 1;
          1 0 1 1;
          1 0 0 0;
          0 1 1 1;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1;];
    %calculate padding, add the three databits telling how many padding
    %bits there are
    if(mod(length(inData)+2,4)==0)
        nbrOfPaddingBits=0;
    else
        nbrOfPaddingBits=4-mod(length(inData)+2,4);
    end
    %calculate padding string
    padding=cat(2,de2bi(nbrOfPaddingBits,2),zeros(nbrOfPaddingBits,1)');
    %create data string
    data=cat(2,padding,inData);
    %initialize encoded data vector, the vector will be 7/4 of the
    %incoming datavector
    eData=zeros(length(data)*7/4,1);
    %loop through the data, calculating the encoded 7-bit word for each pair of 4 bits 
    for i=1:(length(data)/4)
        %create encoded 7 bit word
        x=mod(G*data(i*4-3:i*4)',2);
        %add the encoded word
        eData(i*7-6:i*7)=x;
    end
end