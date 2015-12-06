module lightCycleMovement( input Reset, frame_clk, press,
					input [7:0] keycode,
               output [9:0]  CycleX, CycleY, CycleMotionX,CycleMotionY, BadguyX, BadguyY);
    
    logic [9:0] Cycle_X_Pos, Cycle_X_Motion, Cycle_Y_Pos, Cycle_Y_Motion,Cycle_SizeX,Cycle_SizeY, 
						speedup, Badguy_X_Pos, Badguy_Y_Pos, Badguy_X_Motion, Badguy_Y_Motion;
	 logic counter, counter2;
	 parameter [9:0] Badguy_X_Center = 380;
	 parameter [9:0] Badguy_Y_Center = 380;
	 
    parameter [9:0] Cycle_X_Center=160;  // Center position on the X axis
    parameter [9:0] Cycle_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] Cycle_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] Cycle_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] Cycle_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] Cycle_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] Cycle_X_Step=1;      // Step size on the X axis
    parameter [9:0] Cycle_Y_Step=1;      // Step size on the Y axis
	 
	initial counter = 1'b0;
	initial speedup = 10'b0;
	initial counter2 = 1'b0;
	

			 
		  
	 

    assign Cycle_SizeY = 4;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
    assign Cycle_SizeX = 8;
    always_ff @ (posedge Reset or posedge frame_clk)
    begin: Move_Cycle
        if (Reset)  // Asynchronous Reset
        begin 
            Cycle_Y_Motion <= 10'd0; //Cycle_Y_Step;
				Cycle_X_Motion <= 10'd0; //Cycle_X_Step;
				Cycle_Y_Pos <= Cycle_Y_Center;
				Cycle_X_Pos <= Cycle_X_Center;
				Badguy_X_Pos <= Badguy_X_Center;
				Badguy_Y_Pos <= Badguy_Y_Center;
				Badguy_Y_Motion <= 10'd0;
				Badguy_X_Motion <= 10'd0;
				speedup <= 10'b0;
				counter2 <= 1'b0;
        end

		  
        else 
		  
		  begin 
		  if ( (Cycle_Y_Pos + Cycle_SizeY) >= Cycle_Y_Max )  // Cycle is at the bottom edge, BOUNCE!
					  Cycle_Y_Motion <= (~ (Cycle_Y_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (Cycle_Y_Pos - Cycle_SizeY) <= Cycle_Y_Min )  // Cycle is at the top edge, BOUNCE!
					  Cycle_Y_Motion <= Cycle_Y_Step;
					
				 else 
					  Cycle_Y_Motion <= Cycle_Y_Motion;  // Cycle is somewhere in the middle, don't bounce, just keep moving
					 
				
				if ( (Cycle_X_Pos + Cycle_SizeX) >= Cycle_X_Max)
					 Cycle_X_Motion <= (~ (Cycle_X_Step) + 1'b1);
					
					
				else if ( (Cycle_X_Pos - Cycle_SizeX) <= Cycle_X_Min)
					 Cycle_X_Motion <=Cycle_X_Step;
				else
					Cycle_X_Motion <= Cycle_X_Motion;
			case(keycode)
			8'h1D: //W ps/2
				begin
				if(press == 1'b1)
					begin
					Cycle_Y_Motion <= -1;
					Cycle_X_Motion <= 0;
					end
				end
			8'h1C: //A ps/2
				begin
					if(press == 1'b1)
					begin
					Cycle_Y_Motion <= 0;
					Cycle_X_Motion <= -1;
					end
				end
			8'h1B: //S ps/2
				begin
					if(press == 1'b1)
					begin
					Cycle_X_Motion <= 0;
					Cycle_Y_Motion <= 1;
					end
				end
			8'h23: //D ps/2
				begin
					if(press == 1'b1)
					begin
					Cycle_X_Motion <= 1;
					Cycle_Y_Motion <= 0;
					end
				end
				
			8'h44: //O ps/2 AI speedup
				begin
					if(press == 1'b1)
					begin
						if(counter2 == 1'b0)
						begin
							speedup <= 300;
							counter2 <= 1'b1;
						end
						else
							counter2 <= 1'b1;
					end
				end
			default: ;
			 endcase
			begin
			
			if ( (Cycle_Y_Pos + Cycle_SizeY) >= Cycle_Y_Max )  // Cycle is at the bottom edge, BOUNCE! Not used in our design
			begin
					  Cycle_Y_Motion <= (~ (Cycle_Y_Step) + 1'b1);  // 2's complement.
					  
					  end
				 else if ( (Cycle_Y_Pos - Cycle_SizeY) <= Cycle_Y_Min )  // Cycle is at the top edge, BOUNCE! Not used in our design
				 begin
					  Cycle_Y_Motion <= Cycle_Y_Step;
					  
					  end
				 
				 
				// Cycle_X_Motion <= Cycle_X_Motion;  // You need to remove this and make both X and Y respond to keyboard input
				
				if ( (Cycle_X_Pos + Cycle_SizeX) >= Cycle_X_Max)
				begin
					 Cycle_X_Motion <= (~ (Cycle_X_Step) + 1'b1);
					
					 end
				else if ( (Cycle_X_Pos - Cycle_SizeX) <= Cycle_X_Min)
				begin
					 Cycle_X_Motion <=Cycle_X_Step;
					 
				end
				
			

				
			end
			begin
			
		 	if((Badguy_X_Pos >= Cycle_X_Pos)&&(Badguy_Y_Pos <= Cycle_Y_Pos)) //cycle at bottom left of badguy
			begin
				
				
				
						if((Badguy_X_Pos - Cycle_X_Pos)>=(Cycle_Y_Pos - Badguy_Y_Pos))
						begin
							Badguy_X_Motion <= -1;
							Badguy_Y_Motion <= 0;
						end	
						else
						begin
							Badguy_X_Motion <= 0;
							Badguy_Y_Motion <= 1;
						end
			
				
			
		  
			end
			
			else if((Badguy_X_Pos <= Cycle_X_Pos)&&(Badguy_Y_Pos <= Cycle_Y_Pos)) // cycle at bottom right of badguy
			begin
				
					
					
						if((Cycle_X_Pos - Badguy_X_Pos)>=(Cycle_Y_Pos - Badguy_Y_Pos))
						begin
							Badguy_X_Motion <= 1;
							Badguy_Y_Motion <= 0;
						end	
						else
						begin
							Badguy_X_Motion <= 0;
							Badguy_Y_Motion <= 1;
						end
			
				
			
		  
			end
			
			else if((Badguy_X_Pos <= Cycle_X_Pos)&&(Badguy_Y_Pos >= Cycle_Y_Pos)) //cycle at top right of badguy
			begin
				
					
						if((Cycle_X_Pos - Badguy_X_Pos)>=(Badguy_Y_Pos - Cycle_Y_Pos))
						begin
							Badguy_X_Motion <= 1;
							Badguy_Y_Motion <= 0;
						end	
						else
						begin
							Badguy_X_Motion <= 0;
							Badguy_Y_Motion <= -1;
						end
			
					
			
		  
			end
			
			else if((Badguy_X_Pos >= Cycle_X_Pos)&&(Badguy_Y_Pos >= Cycle_Y_Pos)) //cycle at top left of badguy
			begin
				
			
					
						if((Badguy_X_Pos - Cycle_X_Pos)>=(Badguy_Y_Pos - Cycle_Y_Pos))
						begin
							Badguy_X_Motion <= -1;
							Badguy_Y_Motion <= 0;
						end	
						else
						begin
							Badguy_X_Motion <= 0;
							Badguy_Y_Motion <= -1;
						end
			
			
		  
			end
			
			else
				begin
					Badguy_X_Motion <= Cycle_X_Motion;
					Badguy_Y_Motion <= Cycle_Y_Motion;
				end
			end
		
				  Cycle_Y_Pos <= (Cycle_Y_Pos + Cycle_Y_Motion);  // Update Cycle position
				 Cycle_X_Pos <= (Cycle_X_Pos + Cycle_X_Motion);
				 
				 if(speedup != 10'b0) //update badguy position when speedup is active
				 begin
					Badguy_X_Pos <= (Badguy_X_Pos + Badguy_X_Motion);
					Badguy_Y_Pos <= (Badguy_Y_Pos + Badguy_Y_Motion);
					speedup <= (speedup - 1'b1);
				end
				
				
				 else if(counter == 1'b1) //update badguy position every other clock cycle
				 begin
				 Badguy_X_Pos <= (Badguy_X_Pos + Badguy_X_Motion);
				 Badguy_Y_Pos <= (Badguy_Y_Pos + Badguy_Y_Motion);
				 counter = 1'b0;
				end
				else
				begin
					counter = 1'b1;
					Badguy_X_Pos <= Badguy_X_Pos;
					Badguy_Y_Pos <= Badguy_Y_Pos;
				end
	
		end
    end
       
    assign CycleX = Cycle_X_Pos;
   
    assign CycleY = Cycle_Y_Pos;
	 
	 assign BadguyX = Badguy_X_Pos;
	 assign BadguyY = Badguy_Y_Pos;
   
		assign CycleMotionY = (Cycle_Y_Motion + 1'b1);
		assign CycleMotionX = (Cycle_X_Motion + 1'b1);
    

endmodule
