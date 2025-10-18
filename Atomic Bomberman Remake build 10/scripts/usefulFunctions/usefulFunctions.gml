function wrap(number, lower_bound, upper_bound) {
	//doesn't work with negative numbers
	
	var range_size = upper_bound - lower_bound + 1;
	
	if(number < lower_bound) {
		number += range_size * ((lower_bound - number) / range_size + 1);
	}
	
	return lower_bound + (number - lower_bound) % range_size;
}