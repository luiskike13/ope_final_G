`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:04 10/28/2015 
// Design Name: 
// Module Name:    PK 
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
module PK
#(parameter n=8)
(
	input [n-1:0] yk, 
	input clk,
	output reg [n-1:0] pk
    );

localparam a=8'b01010101;// buscar valor real de las contantes
wire [n-1:0] mult1;
assign mult1=yk*a ; // falta ajustar la cantidad de bits, porque al multiplicar cambia

always@(posedge clk) 
	begin 
		pk <= mult1;
	end
	

endmodule
