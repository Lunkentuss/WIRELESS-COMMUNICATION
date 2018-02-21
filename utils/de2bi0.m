function binaryArray = de2bi0(nbr,sizeOfArray)
	binaryArray = de2bi(nbr);
	binaryArray = [binaryArray zeros(1,(sizeOfArray - length(binaryArray)))];
end
