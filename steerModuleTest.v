`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:59:42 07/10/2019
// Design Name:   SteerModule
// Module Name:   E:/Usman/VLSI-CEP/steerModuleTest.v
// Project Name:  VLSI-CEP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SteerModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module steerModuleTest;

	// Inputs
	reg [31:0] in1;
	reg [31:0] in2;
	reg en;
	reg [2:0] sel;
	reg clk;

	// Outputs
	wire [7:0] out1;
	wire [7:0] out2;
	wire [7:0] out3;
	wire [7:0] out4;
	wire [7:0] out5;
	wire [7:0] out6;
	wire [7:0] out7;
	wire [7:0] out8;

	// Instantiate the Unit Under Test (UUT)
	SteerModule uut (
		.in1(in1), 
		.in2(in2), 
		.en(en), 
		.sel(sel), 
		.clk(clk), 
		.out1(out1), 
		.out2(out2), 
		.out3(out3), 
		.out4(out4), 
		.out5(out5), 
		.out6(out6), 
		.out7(out7), 
		.out8(out8)
	);

	initial begin
		// Initialize Inputs
		in1 = 0;
		in2 = 0;
		en = 0;
		sel = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

