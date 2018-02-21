% Strategy-ish pattern for  data creation
function data = createdata(type,varargin)

if(strcmp(type,'random'))
	% varargin{1} == nbr of bits
	data = random_data(varargin{1},varargin{2});	
elseif(strcmp(type,'ones'))
	% varargin{1} == nbr of bits
	data = ones_data(varargin{1});
elseif(strcmp(type,'image'))
	% varargin{1} == name of image
	data = imagetobitstream(varargin{1});
elseif(strcmp(type,'text'))
	data = text_data(varargin{1});

elseif(strcmp(type,'OSV1'))
	%data = somefunction2_data(args);
else
	disp( ['No data-type named: ',type,' exists'] );
	data = null(0);
end


end
