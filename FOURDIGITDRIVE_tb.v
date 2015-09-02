`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:	Marelas George
//
// Create Date:   00:24:56 10/15/2014
// Design Name:   
// Module Name:   FOURDIGITDRIVE_tb
// Project Name:  FourDigitDrive
// Target Device:  Spartan3
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FOURDIGITDRIVER
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FOURDIGITDRIVE_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire an0;
	wire an1;
	wire an2;
	wire an3;
	wire a;
	wire b;
	wire c;
	wire d;
	wire f;
	wire g;
	wire dp;

	// Instantiate the Unit Under Test (UUT)
	FOURDIGITDRIVER uut (
		.clk(clk), 
		.rst(rst), 
		.an0(an0), 
		.an1(an1), 
		.an2(an2), 
		.an3(an3), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.f(f), 
		.g(g), 
		.dp(dp)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;

		// Wait 200 ns for global reset to finish
		#200;
		rst = 0;
		#100000 $finish;
		
	end
	
	//periodos tou rologioy = 20 ns 
	always #20 clk = ~clk;
      
      
endmodule

