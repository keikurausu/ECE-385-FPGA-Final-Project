//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//                                                                       --
//    Fall 2014 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 7                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------


module  color_mapper ( input        [9:0] DrawX, DrawY, CycleX, CycleY,CycleX_2,CycleY_2, CycleMotion1X,CycleMotion1Y, 
														CycleMotion2X,CycleMotion2Y,BadguyX,BadguyY,BadguyX2,BadguyY2,
							  input Clk,
                       output logic [7:0]  Red, Green, Blue
							);
    
    logic [1:0] cycle_on;
	 logic [1:0] tail_on;
	 logic collision, Level2over, badguyout, badguyout2, level1;

	 
    lightCycle lightCycle(.xcoord(DrawX),
								  .ycoord(DrawY),
								  .level1(level1),
								  .outputBit(cycle_on)
								  );

	tail tail1(.xcoord(DrawX),
				  .ycoord(DrawY),
				  .CycleY(CycleY),
				  .CycleX(CycleX),
				  .CycleX2(CycleX_2),
				  .CycleY2(CycleY_2),
				  .outputBit(tail_on),
				  .BadguyX(BadguyX),
				  .BadguyY(BadguyY),
				  .BadguyX2(BadguyX2),
				  .BadguyY2(BadguyY2),
				  .movementX(CycleMotion1X),
				  .movementY(CycleMotion1Y),
				  .movement2X(CycleMotion2X),
				  .movement2Y(CycleMotion2Y),
				  .Collision(collision),
				  .level2over(Level2over),
				  .Badguyout(badguyout),
				  .Badguyout2(badguyout2),
				  .level1(level1),
				  .Clk(Clk)
				 );
						  
				
	
	
	 
    
	 
    
    always_comb
    begin:RGB_Display
		

		 if(Level2over == 1'b1 && cycle_on == 1'b1) //level 2 over //sprite drawn
			begin
			Red = 8'hFF;
			Green = 8'hFF;
			Blue = 8'h00;
			
			end
			
		else if(Level2over == 1'b1 && cycle_on == 1'b0) //level 2 over //sprite drawn
		begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end    
		  
		  else if(collision == 1'b1 && cycle_on == 1'b1) // level 1 over //sprite drawn
			begin
			Red = 8'hFF;
			Green = 8'hFF;
			Blue = 8'h00;
			
			end
			
		else if(collision == 1'b1 && cycle_on == 1'b0) //level 1 over // sprite drawn
		begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end    
		  
		 else if(badguyout == 1'b1) //AI 1
		 begin
			Red = 8'hFF;
			Green = 8'h00;
			Blue = 8'h00;
			
		end
		
		else if(badguyout2 == 1'b1) //AI 2
		 begin
			Red = 8'hFF;
			Green = 8'hA5;
			Blue = 8'h00;
			
		end
		else if(collision == 1'b1 && cycle_on == 1'b1) // level 1 over
			begin
			Red = 8'hFF;
			Green = 8'hFF;
			Blue = 8'h00;
			
			end
			
		else if(collision == 1'b1 && cycle_on == 1'b0)
		begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end    
		  
		else if(tail_on == 2'b11) //wall and obstacles
		  begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'hFF;
        end   
		  else if(tail_on == 2'b01) // player 1
		  begin
			Red = 8'h35;
			Green = 8'h56;
			Blue = 8'h00;

		  end
        else if(tail_on == 2'b10) //player 2
		  begin
			Red = 8'h24;
			Green = 8'hab;
			Blue = 8'hcf;

		  end 
		  else
        begin 
            Red = 8'h00; 
            Green = 8'h00;
            Blue = 8'h00;
        end      
    end 
endmodule
