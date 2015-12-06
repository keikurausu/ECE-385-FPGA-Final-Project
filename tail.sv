module tail(input logic [9:0] xcoord, ycoord, CycleX,CycleY, movementX,movementY, movement2X, movement2Y,
										BadguyX, BadguyY,BadguyX2,BadguyY2,CycleX2,CycleY2,
				output logic [1:0]  outputBit,
				output logic Collision, level2over, Badguyout,Badguyout2, level1,
				input Clk);
						 
					logic [1:0] array [0:59] [0:79];	
					logic [1:0] temp, temp_1, temp_2, temp_3, temp_4;
					logic [1:0] temp2, temp2_1, temp2_2, temp2_3, temp2_4;
					logic level2; //keeps track of which level we are at.
					
				//initilize variables	
				initial Collision = 1'b0;
				initial level2 = 1'b0;
				initial level2over = 1'b0;
				initial Badguyout = 1'b0;
				initial Badguyout2 = 1'b0;
				initial level1 = 1'b1;
				
	always_ff@(posedge Clk)
	begin
	
	
		if(CycleX/8 == BadguyX/8 && CycleY/8 == BadguyY/8 && level2== 1'b1) //checking for collision with player 1 and AI 1
		begin
			level2over = 1'b1;
			Badguyout = 1'b0;
			Badguyout2 = 1'b0;
		end
		else if(CycleX2/8 == BadguyX2/8 && CycleY2/8 == BadguyY2/8 && level2== 1'b1) //checking for collision with player 2 and AI 2
		begin
			level2over = 1'b1;
			Badguyout = 1'b0;
			Badguyout2 = 1'b0;
		end 
		else if(level2 == 1'b1 && BadguyX/8 == xcoord/8 && BadguyY/8 == ycoord/8 && level2over == 1'b0) //drawing player 1 bad guy
			Badguyout = 1'b1;
		else if(level2 == 1'b1 && BadguyX2/8 == xcoord/8 && BadguyY2/8 == ycoord/8 && level2over == 1'b0) //drawing player 2 bad guy
			Badguyout2 = 1'b1;

		
			
			
		else if(movementX == 1 && movementY == 1 && movement2X == 1 && movement2Y == 1) //drawing initial game map for level 1 and 2
		begin
			array = '{ 
		'{2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11},
		'{2'b11,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b01, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b10, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0, 2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b0,2'b11},
		'{2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11,2'b11}
		};
			if(Collision == 1'b1 && level1 == 1'b1) //switch to level 2
			begin
				Collision = 1'b0;
				level2 = 1'b1;
				level1 = 1'b0;
				
			end
			else if(level2over == 1'b1 || Collision == 1'b1) //switch back to level 1
			begin
				Collision = 1'b0;
				level2over = 1'b0;
				level2 = 1'b0;
				level1 = 1'b1;
			end
		
		Badguyout = 1'b0;
		Badguyout2 = 1'b0;
		outputBit = array [ycoord / 8][xcoord / 8];
		end
		
		else if(Collision == 1'b1)
		begin
			outputBit = 2'b0;
			Collision = 1'b1;
			Badguyout = 1'b0;
			Badguyout2 = 1'b0;
			end
			
		else if(level2over == 1'b1)
			begin
			level2over = 1'b1;
			Badguyout = 1'b0;
			Badguyout2 = 1'b0;
			end
		else
		begin
				//storing in temp variables different array position values that need to be checked later on
				temp2 <= array[CycleY2/8][CycleX2/8];
				temp <= array[CycleY/8][CycleX/8];
				temp_1 <= array[CycleY/8-1][CycleX/8];
				temp_2 <= array[CycleY/8+1][CycleX/8];
				temp_3 <= array[CycleY/8][CycleX/8-1];
				temp_4 <= array[CycleY/8][CycleX/8+1];
				temp2_1 <= array[CycleY2/8-1][CycleX2/8];
				temp2_2 <= array[CycleY2/8+1][CycleX2/8];
				temp2_3 <= array[CycleY2/8][CycleX2/8-1];
				temp2_4 <= array[CycleY2/8][CycleX2/8+1];
				Badguyout = 1'b0;
				Badguyout2 = 1'b0;
				
				if((CycleX == 160 && CycleY == 240)&&(CycleX2 == 480 && CycleY2 == 240)) //start position check
				begin
				
					array[CycleY/8][CycleX/8] = 2'b01;
					array[CycleY2/8][CycleX2/8] = 2'b10;
					outputBit = array [ycoord / 8][xcoord / 8];
				
				end
				
				// opponent collision detection
				else if((temp==2'b10)|| (temp2==2'b01))// || ((temp==2'b10) &&(CycleY%8==0&&CycleX%8==0))  || ((temp2==2'b10)&&(CycleY2%8==0&&CycleX2%8==0)))
					begin
					outputBit = 2'b0;
					Collision = 1'b1;
					
				end
				
				else if((temp==2'b11)||(temp2==2'b11)) //wall collision detection
				begin
					outputBit = 2'b0;
					Collision = 1'b1;
					
				end
				
				//collision with self. 1'b1 is added to motion since comparing with -1 didn't work
				else if( (movementY==0 && CycleY%8 == 0&&temp_1!=2'b0) || (movementY == 2 && CycleY%8 == 7&&temp_2!=2'b0) || (movementX==0&& CycleX%8 == 0&&temp_3!=2'b0) || (movementX == 2 && CycleX%8 == 7&&temp_4!=2'b0) )
				begin
					Collision = 1'b1;
					outputBit = 2'b0;
				end
					
				else if( (movement2Y==0 && CycleY2%8 == 0&&temp2_1!=2'b0) || (movement2Y == 2 && CycleY2%8 == 7&&temp2_2!=2'b0) || (movement2X ==0 && CycleX2%8 == 0&&temp2_3!=2'b0) || (movement2X == 2 && CycleX2%8 == 7&&temp2_4!=2'b0) )
				begin
					Collision = 1'b1;
					outputBit = 2'b0;
				end
				else        
				//normal motion
				begin
				array[CycleY/8][CycleX/8] = 2'b01;
				
				array[CycleY2/8][CycleX2/8] = 2'b10;
				outputBit = array [ycoord / 8][xcoord / 8];
				Collision = 1'b0;
				end
			
			end
			
			

end
	
endmodule