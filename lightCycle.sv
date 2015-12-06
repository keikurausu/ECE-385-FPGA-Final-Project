module lightCycle (input logic [9:0] xcoord, ycoord,
						input level1,
						 output logic outputBit);
			 
	int x,y;
	assign x = (xcoord-128)/16; //setting the top left corner coordinates of sprite
	assign y = (ycoord-200)/16;
	
	// ECE 385 sprite
	 parameter  [0:4][0:23] ROM2 = { 	
		
		
		24'b111011101110011101110111,
		24'b100010001000000101010100,
		24'b111010001110011101110111,
		24'b100010001000000101010001,
		24'b111011101110011101110111,
		};
		
		//LEVEL 2 sprite
		 parameter  [0:4][0:23] ROM = { 	
		
		
		24'b100011101010111010000111,
		24'b100010001010100010000001,
		24'b100011101010111010000111,
		24'b100010001010100010000100,
		24'b111011101110111011100111,
		};
		
		always_comb
		begin
		if(level1 == 1'b1) //Level 2 sprite outputted
			begin
			if (x>=0 && x<=23 && y>=0 && y<= 4)
				outputBit= ROM [y][x];
			else
				outputBit = 1'b0;
				
			end
		else
		begin //ECE 385 sprite outputted
			if (x>=0 && x<=23 && y>=0 && y<= 4)
				outputBit= ROM2 [y][x];
			else
				outputBit = 1'b0;
				
			end
		
		end
endmodule 		