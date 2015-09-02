`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marelas George
// 
// Create Date:    02:14:55 10/13/2014 
// Design Name: 
// Module Name:    Decoder_7_Segment 
// Project Name: 	 FourDigitDrive
// Target Devices: Spartan3
// Tool versions: 
// Description: 	This code will take a four bit 
//                number and decode it into the seven individual 
//                segments to drive a seven segment display. 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Decoder_7_Segment( char , LED );

	input [3:0]char;
	output wire [6:0]LED;
	reg [6:0]LEDS; //a,b,c,d,e,f,g


/*apodokodikopoiisi tou input symfwna me to Table 3-3
    input          output:abcdefg
*/
	always@(char)
	
	begin
		case(char)
  
       4'b0000 : LEDS <= 7'b1000000;   //0
       4'b0001 : LEDS <= 7'b1111001;   //1
       4'b0010 : LEDS <= 7'b0100100;   //2                                         
       4'b0011 : LEDS <= 7'b0110000;   //3                                         
       4'b0100 : LEDS <= 7'b0011001;   //4                                         
       4'b0101 : LEDS <= 7'b0010010;   //5                                         
       4'b0110 : LEDS <= 7'b0000010;   //6                                         
       4'b0111 : LEDS <= 7'b1111000;   //7                                         
       4'b1000 : LEDS <= 7'b0000000;   //8                    
       4'b1000 : LEDS <= 7'b0010000;   //9
       4'b1010 : LEDS <= 7'b0001000;   //A                                         
       4'b1011 : LEDS <= 7'b0000011;   //b                                         
       4'b1100 : LEDS <= 7'b1000110;   //C                                         
       4'b1101 : LEDS <= 7'b0100001;   //d                                         
       4'b1110 : LEDS <= 7'b0000110;   //E                                         
       4'b1111 : LEDS <= 7'b0001110;   //F  
		 default : LEDS <= 7'b1111111; // error
		 
		endcase	 
	end

			assign LED = LEDS;
	
endmodule
