//-------------------------------------------------------------------------
//      lab7_usb.sv                                                      --
//      Christine Chen                                                   --
//      Fall 2014                                                        --
//                                                                       --
//      Fall 2014 Distribution                                           --
//                                                                       --
//      For use with ECE 385 Lab 7                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module  Final_Project ( input         Clk,
                                     Reset,
												 ps2clk,
												 ps2data,
							  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
							  
							  // VGA Interface 
                       output [7:0]  Red,
							                Green,
												 Blue,
							  output        VGA_clk,
							                sync,
												 blank,
												 vs,
												 hs
												 
											);
    
    logic Reset_h, vssig;
    logic [9:0] drawxsig, drawysig, cyclexsig,cycleysig,cycleysig_2,cyclexsig_2,cycle_1_motionx,cycle_1_motiony,cycle_2_motionx,cycle_2_motiony,badguyxsig,badguyysig,badguyxsig2,badguyysig2;
	 logic [7:0] keycode;
    wire press;  
    assign {Reset_h}=~ (Reset);  // The push buttons are active low
	 
	 keyboard ps2keyboard (.*,
								  .Clk(Clk),
								  .psClk(ps2clk),
								  .psData(ps2data),
								  .press(press),
								  .keyCode(keycode),
								  .reset(Reset_h));
    vga_controller vgasync_instance(.*,
	                                 .Clk(Clk),
											   .Reset(Reset_h),
											   .pixel_clk(VGA_clk),
											   .DrawX(drawxsig),
								 			   .DrawY(drawysig) );
	
		
	lightCycleMovement cyclemovement(.Reset(Reset_h), 
											   .frame_clk(vs),
												.press(press),
												.keycode(keycode),
												.CycleX(cyclexsig),
												.CycleY(cycleysig),
												.CycleMotionX(cycle_1_motionx),
												.CycleMotionY(cycle_1_motiony),
												.BadguyX(badguyxsig),
												.BadguyY(badguyysig));
												
    lightCycleMovement2 cyclemovement2(.Reset(Reset_h),
													.frame_clk(vs),
													.press(press),
													.keycode(keycode),
													.CycleX(cyclexsig_2),
													.CycleY(cycleysig_2),
													.CycleMotionX(cycle_2_motionx),
													.CycleMotionY(cycle_2_motiony),
													.BadguyX(badguyxsig2),
													.BadguyY(badguyysig2));
    color_mapper color_instance(.*,
	                             .CycleX(cyclexsig),
										  .CycleY(cycleysig),
										  .CycleX_2(cyclexsig_2),
										  .CycleY_2(cycleysig_2),
		 								  .DrawX(drawxsig),
		 								  .DrawY(drawysig),
										  .CycleMotion1X(cycle_1_motionx),
										  .CycleMotion1Y(cycle_1_motiony),
										  .CycleMotion2X(cycle_2_motionx),
										  .CycleMotion2Y(cycle_2_motiony),
										  .BadguyX(badguyxsig),
										  .BadguyY(badguyysig),
										  .BadguyX2(badguyxsig2),
										  .BadguyY2(badguyysig2),
										  .Clk(Clk));
										  
	 HexDriver hex_inst_0 (keycode[3:0], HEX0);
	 HexDriver hex_inst_1 (keycode[7:4], HEX1);
    

endmodule
