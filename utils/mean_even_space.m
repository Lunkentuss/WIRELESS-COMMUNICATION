function mean_value = mean_even_space(signal,n,n_space)
% Returns the mean of n numbers that are evenly spaced by n_space indices

mean_value = 0;
for i=1:n
	mean_value = mean_value + signal(1+n_space*(i-1));
end

mean_value = mean_value / n;

end
