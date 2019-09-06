`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:43:41 07/01/2019 
// Design Name: 
// Module Name:    MainModule 
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
module MainModule(
	input [7:0] dataInput,
	input mainClk,
	input start,
	output [31:0] doutb,
	output [7:0] out1,
	output [7:0] out2,
	output [7:0] out3,
	output [7:0] out4,
	output [7:0] out5,
	output [7:0] out6,
	output [7:0] out7,
	output [7:0] out8,
	output reg [7:0] out9,
	output imageProcessed,
	output enable
   );
	
	reg [31:0] register;
	wire writeClk;		
	wire readClk;				
	wire resetWr;		
	wire resetRd; 	
	wire enRd;	  	
	wire enWr;       
	wire [2:0] sel;  
	wire enSm;	  	  
   wire [10:0] W_BRAM_ADDR;
	wire [8:0] R_BRAM_ADDR;

	ControlModule cm (
    .mainClk(mainClk), 
    .start(start), 
    .enable(enable), 
    .resetWr(resetWr), 
    .resetRd(resetRd), 
    .enRd(enRd), 
    .enWr(enWr), 
    .sel(sel), 
    .enSm(enSm), 
    .imageProcessed(imageProcessed), 
    .writeClk(writeClk), 
    .readClk(readClk)
    );

	
	AddressGeneratorModule agm (
    .enRd(enRd), 
    .enWr(enWr), 
    .resetRd(resetRd), 
    .resetWr(resetWr), 
    .readClk(readClk), 
    .writeClk(writeClk), 
    .writeAddress(W_BRAM_ADDR), 
    .readAddress(R_BRAM_ADDR)
    );
	 
	BRAM bram (
  .clka(writeClk), // input clka
  .ena(enWr), // input ena
  .wea(enWr), // input [0 : 0] wea
  .addra(W_BRAM_ADDR), // input [10 : 0] addra
  .dina(dataInput), // input [7 : 0] dina
  .clkb(readClk), // input clkb
  .enb(enRd), // input enb
  .addrb(R_BRAM_ADDR), // input [8 : 0] addrb
  .doutb(doutb) // output [31 : 0] doutb
	);

	SteerModule sm (
    .in1(doutb), 
    .in2(register), 
    .en(enSm), 
    .sel(sel), 
    .clk(writeClk), 
    .out1(out1), 
    .out2(out2), 
    .out3(out3), 
    .out4(out4), 
    .out5(out5), 
    .out6(out6), 
    .out7(out7), 
    .out8(out8)
    );

	
	always @ (posedge writeClk)
	begin
		if(enSm == 1)
			out9 = dataInput ;
		else
			out9 = 8'bzz ;	
	end
	always @ (posedge readClk) 
	begin
			register = doutb;			
	end
endmodule