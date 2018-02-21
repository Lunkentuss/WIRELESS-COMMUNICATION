function str = bit2text(data)
	str_length = length(data)/8;
	str = [''];
	for i=1:str_length	
		str = [str,char(bi2de(data((i-1)*8+1:(i)*8)))];
	end
end
