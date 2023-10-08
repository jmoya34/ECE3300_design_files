`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 04:39:05 PM
// Design Name: 
// Module Name: mux2x1
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


module mux2x1(
    input mux2x1_sel,
    input[3:0] mux2x1_i1,
    input[3:0] mux2x1_i0, 
    output[3:0] mux2x1_p
    );
    
    assign mux2x1_p = (mux2x1_sel) ? mux2x1_i0 : mux2x1_i1;
    
endmodule
