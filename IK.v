`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:03 10/28/2015 
// Design Name: 
// Module Name:    IK 
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
module IK
	#(parameter n=8)
(
	input [n-1:0] yk,rk,
	input clk, enable_ik,enable_ik_1,
	output reg [n-1:0] ik
    );

localparam b=8'b01110101;// buscar valor real de las contantes
wire [n-1:0] sum1, mult2,sum2;
assign sum1=yk + rk ; // falta ajustar la cantidad de bits, porque al multiplicar cambia
reg [n-1:0] reg_sum1,reg_mult2,reg_ik_1;

	always@(posedge clk) 
		begin 
			reg_sum1<=sum1;
		end
	
assign mult2=reg_sum1*b;
assign sum2=reg_mult2+reg_ik_1;

	always@(posedge clk) 
		begin
			reg_mult2<=mult2;
		end
		
	//registro para ik
	
	always@(posedge clk) 
		begin ik <=0;
			if (enable_ik)
				ik <= sum2;			
		end	
		
	always@(posedge clk) 
		begin reg_ik_1 <=0;
			if (enable_ik_1)
				reg_ik_1 <= ik;			
		end			
		
endmodule
