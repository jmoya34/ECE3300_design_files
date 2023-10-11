`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2023 06:55:24 PM
// Design Name: Full Adder, 1 bit
// Module Name: FA1bit
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: HA.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module FA1bit(
    input PortA,
    input PortB,
    input PortCin,
    output PortS,
    output PortCout
    );
    
    wire [2:0] temp;
    HA HA1(
        .A(PortA),
        .B(PortB),
        .S(temp[2]),
        .C(temp[1])
        );
    HA HA2(
        .A(PortCin),
        .B(temp[2]),
        .S(PortS),
        .C(temp[0])
        );
    or(PortCout, temp[0], temp[1]);
endmodule
