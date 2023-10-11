`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 05:09:25 PM
// Design Name: 
// Module Name: mux2x1_Ninput
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


module mux2x1_Ninput#(parameter SIZE = 4)                
    (                                               
    input  mux2x1_sel,         
    input [SIZE-1:0] mux2x1_i0,
    input [SIZE-1:0] mux2x1_i1,                    
    output [SIZE-1:0] mux2x1_p                              
    );                                              
													
    assign mux2x1_p = (mux2x1_sel) ? mux2x1_i1 : mux2x1_i0;   
endmodule      