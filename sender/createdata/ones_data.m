function data = ones_data(nbrOfBits)
	if(isnumeric(nbrOfBits))	
		%do nothing
	elseif(ischar(nbrOfBits))
		nbrOfBits = str2num(nbrOfBits);	

	elseif(iscell(nbrOfBits))
		nbrOfBits = str2num(nbrOfBits{1});	

	else
		disp('Invalid input')
	end

	data = ones(1,nbrOfBits);
end
