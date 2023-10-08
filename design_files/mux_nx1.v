`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 01:05:56 PM
// Design Name: Multiplexer, n 1-bit inputs, one 1-bit output
// Module Name: mux_nx1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mux_nx1 #(parameter SIZE = 8) 
    (
    input [($clog2(SIZE))-1:0] mux_nx1_sel,
    input [SIZE-1:0] mux_nx1_in,
    output mux_nx1_out
    );
    
    assign mux_nx1_out = mux_nx1_in[mux_nx1_sel];
endmodule
