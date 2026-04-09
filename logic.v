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
	input in_0; //A MSB to LSB order (in_0 is MSB, in_3 is LSB)
	input in_1; //B
	input in_2;	//C
	input in_3;	//D
	
	//outputs
	output top;
	output top_right;
	output top_left;
	output middle;
	output bottom_right;
	output bottom_left;
	output bottom;
	
	//behavior
	assign top = (~in_0 & in_1 & ~in_2 & ~in_3) | (~in_0 & ~in_1 & ~in_2 & in_3) | 
	(in_0 & in_1 & ~in_2 & in_3) | (in_0 & ~in_1 & in_2 & in_3);
	
	assign top_right = (~in_0 & in_1 & ~in_2 & in_3) | (in_0 & in_1 & ~in_3) | 
	(in_0 & in_2 & in_3) | (in_1 & in_2 & ~in_3);
	
	assign top_left = (in_0 & in_1 & ~in_2 & in_3) | (~in_0 & ~in_1 & in_3) |
	(~in_0 & in_2 & in_3) | (~in_0 & ~in_1 & in_2);
	
	assign middle = (~in_0 & ~in_1 & ~in_2) | (in_0 & in_1 & ~in_2 & ~in_3) | 
	(~in_0 & in_1 & in_2 & in_3);
	
	assign bottom_left = (~in_0 & in_1 & ~in_2) | (~in_1 & ~in_2 & in_3) | 
	(~in_0 & in_3);
	
	assign bottom_right = (in_0 & in_1 & in_2) | (in_0 & in_1 & ~in_3) | 
	(~in_0 & ~in_1 & in_2 & ~in_3);
	
	assign bottom = (~in_0 & in_1 & ~in_2 & ~in_3) | (~in_0 & ~in_1 & ~in_2 & in_3) |
	(in_0 & ~in_1 & in_2 & ~in_3) | (in_1 & in_2 & in_3);
	
	
endmodule