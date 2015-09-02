`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marelas George
// 
// Create Date:    00:29:50 10/29/2014 
// Design Name: 
// Module Name:    DelayRotate 
// Project Name: DelayRotation
// Target Devices: Spartan3
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
module DelayRotate(
		clk,
		rst,
		countclk
    );

/*pairnei san eisodo to clock tou kuklwmatos kai to reset*/
	input clk,rst;
	output countclk;

	reg [21:0]count;

/*epistrefei 0 h 1 analoga me tin timi pou exei to 22o-bit tou counter*/
	assign countclk = count[21];


	always @(posedge clk or posedge rst) 
	begin
		if(rst)
		begin
				count <= 22'b0;
		end
		else
		begin
				count <= count+1;
		end
	
	end
 

endmodule
