%takes a datastring and decodes it using the hamming(7,4) method
%padding is used and assumed to be two bytes saying how many of the
%following bytes are to be removed
function [outData,nbrOfErrors]=hamming_decoding(inData)
    nbrOfErrors=0;
    %decoding matrix
    H=[1 0 1 0 1 0 1;
          0 1 1 0 0 1 1;
          0 0 0 1 1 1 1;];
     %retrieving matrix
     R=[0 0 1 0 0 0 0;
          0 0 0 0 1 0 0;
          0 0 0 0 0 1 0;
          0 0 0 0 0 0 1];
     %initialize intemediate vector
     data=zeros(length(inData)*4/7,1);
     for i=1:length(inData)/7
         %extract the current 7-bit data word
         d=inData(i*7-6:i*7);
         %extract error vector
         x=mod(H*d,2);
         %check for errors in transmission
         if~all(x==0)
             disp('error detected')
             nbrOfErrors=nbrOfErrors+1;
             %check index of error
             ind=bi2de(x');
             %flip erronius bit
             d(ind)=not(d(ind));
         end
         data(i*4-3:i*4)=R*d;
     end
     %check header bits
     nbrOfHeaderBits=bi2de(data(1:2)')+2;
     %output data without header
     outData=data(nbrOfHeaderBits+1:end);      
end