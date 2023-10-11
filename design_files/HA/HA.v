`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2023 06:34:29 PM
// Design Name: Half Adder
// Module Name: HA
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module HA(
    input A,
    input B,
    output S,
    output C
    );
    
    xor(S,A,B);
    and(C,A,B);
endmodule
