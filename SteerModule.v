`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:10 07/01/2019 
// Design Name: 
// Module Name:    SteerModule 
// Project Name: 
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
module SteerModule(
   input [31:0] in1, in2,
	input en,			
	input [2:0] sel,	
	input clk,			
	output reg [7:0] out1,		
	output reg [7:0] out2,		
	output reg [7:0] out3,		
	output reg [7:0] out4,		
	output reg [7:0] out5,		
	output reg [7:0] out6,		
	output reg [7:0] out7,							
	output reg [7:0] out8		
   );
   				 
	always @ (posedge clk) 
	begin
		if(en == 1)
		begin
			case(sel)
			3'b000:
			begin
				out1 <= in1[7:0];
				out2 <= in1[15:8];
				out3 <= in1[23:16];
				out4 <= in1[31:24];
				out5 <= in2[7:0];
				out6 <= in2[15:8];
				out7 <= in2[23:16];
				out8 <= in2[31:24];
			end
			3'b001:
			begin
				out1 <= in1[15:8];
				out2 <= in1[23:16];
				out3 <= in1[31:24];
				out4 <= in2[7:0];
				out5 <= in2[15:8];
				out6 <= in2[23:16];
				out7 <= in2[31:24];
				out8 <= in1[7:0];
			end
			3'b010:
			begin
				out1 <= in1[23:16];
				out2 <= in1[31:24];
				out3 <= in2[7:0];
				out4 <= in2[15:8];
				out5 <= in2[23:16];
				out6 <= in2[31:24];	  
				out7 <= in1[7:0];
				out8 <= in1[15:8];
			end
			3'b011:
			begin		  
				out1 <= in1[31:24];
				out2 <= in2[7:0];
				out3 <= in2[15:8];
				out4 <= in2[23:16];
				out5 <= in2[31:24];
				out6 <= in1[7:0];
				out7 <= in1[15:8];
				out8 <= in1[23:16];
			end
			3'b100:
			begin
				out1 <= in2[7:0];
				out2 <= in2[15:8];
				out3 <= in2[23:16];
				out4 <= in2[31:24];
				out5 <= in1[7:0];
			   out6 <= in1[15:8];
				out7 <= in1[23:16];
				out8 <= in1[31:24];
			end
			3'b101:
			begin
				out1 <= in2[15:8];
				out2 <= in2[23:16];
				out3 <= in2[31:24];
				out4 <= in1[7:0];
				out5 <= in1[15:8];
				out6 <= in1[23:16];
				out7 <= in1[31:24];
				out8 <= in2[7:0];
			end
			3'b110:
			begin
				out1 <= in2[23:16];
				out2 <= in2[31:24];		  
				out3 <= in1[7:0];
				out4 <= in1[15:8];
				out5 <= in1[23:16];
				out6 <= in1[31:24];
				out7 <= in2[7:0];
				out8 <= in2[15:8];
			end
			3'b111:
			begin
				out1 <= in2[31:24];
				out2 <= in1[7:0];
				out3 <= in1[15:8];
				out4 <= in1[23:16];
				out5 <= in1[31:24];
				out6 <= in2[7:0];
				out7 <= in2[15:8];
				out8 <= in2[23:16];
			end		  
			endcase
		end
		else
	   begin
			out1 <= 8'hzz;
		end
	end
endmodule
