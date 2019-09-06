`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:56:40 07/1/2019
// Design Name:   clockGenerator
// Module Name:   E:/Usman/VLSI-CEP/clockTest.v
// Project Name:  VLSI-CEP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clockGenerator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clockTest;

	// Inputs
	reg mainClk;

	// Outputs
	wire writeClk;
	wire readClk;
	wire locked;

	// Instantiate the Unit Under Test (UUT)
	clockGenerator uut (
		.mainClk(mainClk), 
		.writeClk(writeClk), 
		.readClk(readClk), 
		.locked(locked)
	);

	initial begin
		// Initialize Inputs
		mainClk = 0;
		forever #5 mainClk = ~mainClk;
	end

endmodule

