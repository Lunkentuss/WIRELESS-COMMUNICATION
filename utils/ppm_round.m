function value = ppm_round(signal_value,maxValue,nbrOfSymbols)
% Returns a integer from 0 to nbrOfSymbols - 1 

value = round(signal_value/maxValue * nbrOfSymbols)-1;

if(value < 0)
	value = 0;
end

if(value >= nbrOfSymbols)
	value = nbrOfSymbols-1;
end

end
