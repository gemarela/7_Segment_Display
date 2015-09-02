`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 	Marelas Giwrgos
// 
// Create Date:    02:36:20 10/13/2014 
// Design Name: 
// Module Name:    FOURDIGITDRIVER 
// Project Name: 		Lab1_7_segment_Display
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FOURDIGITDRIVER( clk,rst,an0,an1,an2,an3,a,b,c,d,e,f,g,dp);

	input clk , rst;
	output an0,an1,an2,an3;
	output a,b,c,d,e,f,g,dp;
	
	reg [3:0] countLED; //antistrofos metritis gia tin epilogi tiss anodou
	reg [3:0] AN;	// times twn bits anodou
	
	/*ta simata gia tin emfanisi tou LEDdecoder*/
	wire [6:0] LED_out; 
	reg [3:0] char_input;
	
	/*filtrarismeno reset me anti-bounce*/
	wire rst_de;  //kanw connection to reset tou debounce me to reset 
	              //pou tha leitourgei gia lo to kyklwma
					  
 
   // DCM: Digital Clock Manager Circuit
   //      Spartan-3
   // Xilinx HDL Language Template, version 14.7

   DCM #(
      .SIM_MODE("SAFE"),  // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
      .CLKDV_DIVIDE(16.0), // Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
                          //   7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
      .CLKFX_DIVIDE(1),   // Can be any integer from 1 to 32
      .CLKFX_MULTIPLY(4), // Can be any integer from 2 to 32
      .CLKIN_DIVIDE_BY_2("FALSE"), // TRUE/FALSE to enable CLKIN divide by two feature
      .CLKIN_PERIOD(0.0),  // Specify period of input clock
      .CLKOUT_PHASE_SHIFT("NONE"), // Specify phase shift of NONE, FIXED or VARIABLE
      .CLK_FEEDBACK("1X"),  // Specify clock feedback of NONE, 1X or 2X
      .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"), // SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
                                            //   an integer from 0 to 15
      .DFS_FREQUENCY_MODE("LOW"),  // HIGH or LOW frequency mode for frequency synthesis
      .DLL_FREQUENCY_MODE("LOW"),  // HIGH or LOW frequency mode for DLL
      .DUTY_CYCLE_CORRECTION("TRUE"), // Duty cycle correction, TRUE or FALSE
      .FACTORY_JF(16'hC080),   // FACTORY JF values
      .PHASE_SHIFT(0),     // Amount of fixed phase shift from -255 to 255
      .STARTUP_WAIT("FALSE")   // Delay configuration DONE until DCM LOCK, TRUE/FALSE
   ) DCM_inst (
      .CLK0(CLK0),     // 0 degree DCM CLK output
      .CLKDV(CLKDV),   // Divided DCM CLK out (CLKDV_DIVIDE)t
      .CLKFB(CLK0),   // DCM clock feedback
      .CLKIN(clk),   // Clock input (from IBUFG, BUFG or DCM)

      .RST(rst_de)        // DCM asynchronous reset input
   );
	
	Decoder_7_Segment Decoder_7_SegmentINST(
				.char(char_input),
				.LED(LED_out)
				);
	
	Debounce DebounceINST(
				.clk(CLKDV),
				.button(rst),
				.debounce(rst_de)
				);
	
	/*assign to LED sta katallila outputs*/
	assign a = LED_out[6];
	assign b = LED_out[5];
	assign c = LED_out[4];
	assign d = LED_out[3];
	assign e = LED_out[2];
	assign f = LED_out[1];
	assign g = LED_out[0];
	
	assign dp = 1'b1;
	
	/*assig tis anodou sta katallila outputs*/
	assign an3 = AN[3];
	assign an2 = AN[2];
	assign an1 = AN[1];
	assign an0 = AN[0];
	
	
	/*case pou kathorizei tin anodo tou AN simatos
	kai ton endiksewn
	stin katalili display*/
	always @ (posedge CLKDV or posedge rst_de)
		begin
			if(rst_de)begin
				char_input <= 4'b0000;
				AN <= 4'b1111;
			end
			else begin
				case(countLED)
				4'b0000:    begin
								char_input <= 4'b0000; 
							   end
				4'b1110 : 	
								begin
								AN <= 4'b0111; 
								end
								
				4'b1100 :   begin
								char_input <= 4'b0001;
							   end
							 
				4'b1010 :	
								begin
								AN <= 4'b1011;
								end
								
				4'b1000 :	begin
							   char_input <= 4'b0010;
							   end				
				4'b0110 : 	
								begin
									AN <= 4'b1101;
								end
								
				4'b0100 :   begin
								char_input <= 4'b0011;
								end
								
				4'b0010 : 	
								begin
								AN <= 4'b1110;
								end
								
				default : 
							begin
							AN <= 4'b1111;
							
							end
				endcase
			end
	
	end
	
	/*antistrofos counter gia tin anodo tou simatos AN*/
	always @(posedge CLKDV or posedge rst_de)
	begin
		if(rst_de)
			begin
				countLED <= 4'b1111;
			end	
		else
			begin
				countLED <= countLED-1;
			end
	end

endmodule
