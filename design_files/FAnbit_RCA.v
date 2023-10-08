`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2023 07:11:58 PM
// Design Name: Full Adder, ripple carry adder, n-bit input/output
// Module Name: FAnbit
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: FA1bit.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module FAnbit_RCA # (parameter SIZE = 2) (
    input [SIZE-1:0] PortA_nbit,
    input [SIZE-1:0] PortB_nbit,
    input PortCin_nbit,
    output [SIZE-1:0] PortS_nbit,
    output PortCout_nbit
    );
    
    wire [SIZE:0] fanbit_wire_temp;
    genvar i;
    generate
        for (i=0; i<SIZE; i=i+1)
            FA1bit FAGEN (
                .PortA(PortA_nbit[i]),
                .PortB(PortB_nbit[i]),
                .PortCin(fanbit_wire_temp[i]),
                .PortS(PortS_nbit[i]),
                .PortCout(fanbit_wire_temp[i+1])
            );
    endgenerate
    assign fanbit_wire_temp[0] = PortCin_nbit;
    assign PortCout_nbit = fanbit_wire_temp[SIZE];
    
endmodule
