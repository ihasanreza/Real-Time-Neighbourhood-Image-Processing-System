`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:56:57 07/01/2019 
// Design Name: 
// Module Name:    AddressGeneratorModule 
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
module AddressGeneratorModule(
	input enRd,				
	input enWr,				
	input resetRd, 			
	input resetWr, 			
	input readClk,           
	input writeClk,					 
	output reg [10:0] writeAddress,		
	output reg [8:0] readAddress			
	);
	
	always @ (posedge writeClk)
	begin
		if(enWr == 1)
			begin
				if(resetWr)
					writeAddress <= 0;
				else
				begin
					if(((writeAddress + 8) % 2047) != 0)
						writeAddress <= (writeAddress + 8) % 2047;
					else
						writeAddress <= 2047;
				end
			end
		else
			writeAddress <= 11'bzzzzzzzzzzz;
	end
	
	
	always @ (posedge readClk)
	begin
		if(enRd == 1)
			begin
				if(resetRd)
					readAddress <= 0;
				else
					readAddress <= (readAddress + 1 ) % 512 ; 
			end
		else
			readAddress <= 9'bzzzzzzzzz;
	end
	
endmodule
