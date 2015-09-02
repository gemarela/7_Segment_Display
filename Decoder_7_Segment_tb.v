`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:	Marelas George
//
// Create Date:   02:51:04 10/14/2014
// Design Name:   Decoder_7_Segment
// Module Name:   Decoder_7_Segment_tb
// Project Name:  FourDigitDrive
// Target Device:  Spartan3
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Decoder_7_Segment
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module Decoder_7_Segment_tb;

	// Inputs | Output
	reg [3:0] char;
	wire [6:0] LED;

	// Instantiate the Unit Under Test (UUT)
	Decoder_7_Segment uut (
		.char(char), 
		.LED(LED)
	);

	initial begin
	/*eisagw oles tis times tou char ston decoder me kathisterisi 10ps*/
	
		// Initialize Inputs
		char = 0;

		// Wait 100 ns for global reset to finish
		#100; //xrisi se periptwsi rst
        
		// Add stimulus here
		char = 4'b0000;
#10
      char =  4'b0001;
#10
		char =  4'b0010;                                        
#10
      char =  4'b0011;                                       
#10
   	char =  4'b0100;                                        
#10
		char =  4'b0101;                                       
#10
		char =  4'b0110;                                        
#10
      char =  4'b0111;                                        
#10
   	char =  4'b1000; 	                  
#10
      char =  4'b1010;                                      
#10
      char =  4'b1011;                                        
#10
      char =  4'b1100;
#10
      char =  4'b1101;                                    
#10
      char =  4'b1110;                                    
#10
      char =  4'b1111;

$finish;
end      
endmodule

