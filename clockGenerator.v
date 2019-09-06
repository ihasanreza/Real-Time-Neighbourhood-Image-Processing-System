`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:24 07/09/2019 
// Design Name: 
// Module Name:    clockGenerator 
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
module clockGenerator(
	input mainClk,       
	output writeClk,          
	output reg readClk,
	output locked
	);
	
	wire  clkOut2;		//25 % duty cycle clock
	wire  clkOut3;		//25 % duty cycle with 180 degree phase shift
	
   clock myClock
   (// Clock in ports
    .CLK_IN1(mainClk),      // IN
    // Clock out ports
    .CLK_OUT1(writeClk),     // OUT
    .CLK_OUT2(clkOut2),     // OUT
    .CLK_OUT3(clkOut3),     // OUT
    // Status and control signals
    .LOCKED(locked)); 
	
	always @ ( * )
	begin
		if(writeClk == 1)
			readClk = clkOut2;
		else
			readClk = clkOut3;
	end
endmodule

