`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:30 07/01/2019 
// Design Name: 
// Module Name:    ControlModule 
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
module ControlModule(	
	input mainClk,			   
	input start,            
	output enable,				
	output reg resetWr,		
	output reg resetRd, 	
	output reg enRd,	  	   
	output reg enWr,       
	output reg [2:0] sel,   
	output reg enSm,	  	    
	output reg imageProcessed,		
	output writeClk,					
	output readClk				
   );

	reg [11:0] writeClockCounter;	 
	reg [7:0] selectCounter;   	
	reg [5:0] muxClockCounter;
	
	reg i, j, k ,r;   
	
	clockGenerator myClock (
    .mainClk(mainClk), 
    .writeClk(writeClk), 
    .readClk(readClk), 
    .locked(enable)
    );
	 
	initial
	begin
		i = 1'b0;		
		j = 1'b0;		
		k = 1'b0;
		r = 1'b0;
		imageProcessed = 0;
	end
	
	always @ (posedge writeClk)
	begin if(start)
			begin
			if(enable)
			begin
				if (i == 0)
				begin
					enWr = 1;	
					resetWr = 1;
					writeClockCounter = 0;
					selectCounter = 6'b000000;
					i = 1;
				end
				else 
				begin
					if (writeClockCounter < 2048)
					begin
						writeClockCounter = writeClockCounter + 1'b1;
						resetWr = 0;
					end
					else
					begin
						resetWr = 1;
						writeClockCounter = 0;
						selectCounter =  selectCounter + 1'b1;
						j = 1'b1;
						if( selectCounter > 31 )
						begin
							imageProcessed = 1'b1;
							enWr = 0;
						end
					end	
				end
			end
		end
   end
		
	always @ (posedge writeClk)
	begin
		if(j == 1 && imageProcessed == 0 )			
		begin
			enSm = 1'b1;  
			enRd = 1'b1; 
			if(k == 0)		
			begin
				muxClockCounter = 0;
				k = 1'b1;
				sel = 3'b000;
			end
			else
			begin
				if(muxClockCounter < 256)
				begin
					muxClockCounter = muxClockCounter + 1'b1;
					k = 1'b1;
				end		
				else
				begin
					sel = (sel + 1'b1) % 8;
					muxClockCounter = 0; 
					k = 1'b1;
				end
			end
		end
		else
		begin
			enSm = 1'b0;  
			enRd = 1'b0;
		end
	end
	
	
	always @ (posedge readClk)
	begin
		if(j == 1 && r == 0)
		begin
			resetRd = 1;
			r = 1'b1;
		end
		else
			resetRd = 0;
	end
endmodule
