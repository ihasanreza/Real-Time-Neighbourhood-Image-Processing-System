`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:34:11 07/01/2019
// Design Name:   MainModule
// Module Name:   E:/Usman/VLSI-CEP/MainModuleTest.v
// Project Name:  VLSI-CEP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MainModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MainModuleTest;

	// Inputs
	reg [7:0] dataInput;
	reg mainClk;
	reg start;

	// Outputs
	wire [31:0] doutb;
	wire [7:0] out1;
	wire [7:0] out2;
	wire [7:0] out3;
	wire [7:0] out4;
	wire [7:0] out5;
	wire [7:0] out6;
	wire [7:0] out7;
	wire [7:0] out8;
	wire [7:0] out9;
	wire imageProcessed;
	wire enable;
	reg [7:0] mem[0:65535];
	integer i, j;

	// Instantiate the Unit Under Test (UUT)
	MainModule uut (
		.dataInput(dataInput), 
		.mainClk(mainClk), 
		.start(start), 
		.doutb(doutb), 
		.out1(out1), 
		.out2(out2), 
		.out3(out3), 
		.out4(out4), 
		.out5(out5), 
		.out6(out6), 
		.out7(out7), 
		.out8(out8), 
		.out9(out9), 
		.imageProcessed(imageProcessed), 
		.enable(enable)
	);

	always 
	#5 mainClk = ~mainClk;
	
	initial begin
		dataInput = 0;
		mainClk = 0;
		start = 1;
		i = 0; 
		$readmemh("hex.txt",mem);
	end
	
	
	always @ (posedge mainClk)
	begin
		if(enable == 1)
		begin
			dataInput = mem[i];
			i = i+1;
		end
	end
endmodule


