module logic 
	(
		in_0,
		in_1,
		in_2,
		in_3,
		top,
		top_right,
		top_left,
		middle,
		bottom_right,
		bottom_left,
		bottom
	);
	
	//inputs
	input in_0;
	input in_1;
	input in_2;
	input in_3;
	
	//outputs
	output top;
	output top_right;
	output top_left;
	output middle;
	output bottom_right;
	output bottom_left;
	output bottom;
	
	//behaviour
	assign top = (~in_0 & in_1 & ~in_2 & ~in_3) | (~in_0 & ~in_1 & ~in_2 & in_3) | 
	(in_0 & in_1 & ~in_2 & in_3) | (in_0 & ~in_1 & in_2 & in_3);
	
	assign top_right = (~in_0 & in_1 & ~in_2 & in_3) | (in_0 & in_1 & ~in_3) | 
	(in_0 & in_2 & in_3) | (in_1 & in_2 & ~in_3);
	
endmodule