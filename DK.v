`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:00 10/30/2015 
// Design Name: 
// Module Name:    DK 
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
module DK 
	#(parameter n=8)
(
	input wire [n-1:0] yk,
	input wire clk, enable_yk,enable_yk_1, Clear_dk, enable_dk, 
	output reg [n-1:0] dk
    );
	 
localparam c=8'b0011101;// buscar valor real de las contantes
wire [n-1:0] res1, mult3;
//assign sum1=yk + rk ; // falta ajustar la cantidad de bits, porque al multiplicar cambia
reg [n-1:0] reg_res1,reg_mult3,reg_yk_1,reg_yk;


	//registro para yk


	always@(posedge clk) 
		begin reg_yk <=0;
			if (enable_yk)
				reg_yk <= yk;			
		end	
		
	always@(posedge clk) 
		begin reg_yk_1 <=0;
			if (enable_yk_1)
				reg_yk_1 <= reg_yk;			
		end			
		
assign res1 = reg_yk - reg_yk_1;

	always@(posedge clk) 
		begin 
				reg_res1 <= res1;			
		end
		
assign mult3 = reg_res1 * c; //// Recortar el dato
 
	always@(posedge clk) 
		begin 
				reg_mult3 <= mult3 ;			
		end
		
	always@(posedge clk) 
		begin reg_mult3 <= 0 ; 
		if(enable_dk)
			reg_mult3 <= mult3;
		else if(Clear_dk)
			reg_mult3 <= 0 ; 
		end	




endmodule
