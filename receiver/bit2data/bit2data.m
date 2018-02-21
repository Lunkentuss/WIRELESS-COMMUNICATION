% Strategy-ish pattern for  data creation
function data = bit2data(type,data,varargs)

if(strcmp(type,'image'))
	data = bitstreamtoimage(data);
elseif(strcmp(type,'text'))
	data = bit2text(data);
elseif(strcmp(type,'OSV2'))
	%data = somefunction2_data(args);
else
	disp( ['No data-type named: ',type,' exists'] );
	data = null(0);
end


end
