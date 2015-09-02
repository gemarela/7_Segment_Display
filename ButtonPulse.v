`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 	Marelas George
// 
// Create Date:    21:09:35 10/30/2014 
// Design Name: 	
// Module Name:    ButtonPulse 
// Project Name: 	ButtonRotate
// Target Devices: Spartan 3
// Tool versions: 
// Description: Kataskeui FSM wste na apofeuxthei i auksisi tou counter stin periptwsi 
//						pou exoume to button synexomena patimeno.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ButtonPulse(
		clk,
		rst,
		button,
		pulse
    );
	 
	input clk,rst;
	input button;
	output reg pulse;	
	
	reg [1:0] state,nxt_state;
  
	parameter S0 = 2'b00;
   parameter S1 = 2'b01;
   parameter S2 = 2'b10;
	
	always @(state or button)
	begin
		case(state)
			S0: 
			begin				
				pulse = 0;
				if (button)	
				begin
					nxt_state = S1;
				end
				else
				begin
					nxt_state = S0;
				end
			end	
			S1: 
			begin				
				pulse = 1;
				nxt_state = S2;
			end								
			S2: 
			begin					
				pulse = 0;
				if (~button)
				begin
					nxt_state = S0;
				end
				else
				begin
					nxt_state = S2;
				end
			end
			default: 
			begin
				pulse = 0;
				nxt_state = S0;
			end
		endcase
	end
	
	always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			state <= S0;
		end
		else
			state <= nxt_state;
	end
			  
endmodule

