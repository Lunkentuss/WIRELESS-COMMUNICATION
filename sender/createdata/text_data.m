function data = text_data(str)
	% 2^8 = 256 (ASCII)
	data = zeros(1,length(str)*8);
	for i=1:length(str)
		char_deci = find(char(0:255) == str(i))-1;	
		char_bin = de2bi0(char_deci,8);
		
		for j=1:8
			data(8*(i-1) + j) = char_bin(j);		
		end	

	end	
end
