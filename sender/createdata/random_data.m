function data = random_data(nbrOfBits,nbr)
	if(isnumeric(nbrOfBits))	
		%do nothing
	elseif(ischar(nbrOfBits))
		nbrOfBits = str2num(nbrOfBits);	

	elseif(iscell(nbrOfBits))
		nbrOfBits = str2num(nbrOfBits{1});	

	else
		disp('Invalid input')
	end
	rng('default')
	rng(nbr)
	data = randi(2,1,nbrOfBits)-1;
end
