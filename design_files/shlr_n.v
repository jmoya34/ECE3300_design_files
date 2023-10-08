`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 12:46:51 PM
// Design Name: Shift Logical Right, n-bit input/output
// Module Name: shlr_n
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: mux_nx1.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module shlr_n #(parameter SIZE = 4) (
    input sel,
    input [SIZE-1:0] in,
    output [SIZE-1:0] out
    );
    
    wire [SIZE:0] in_temp;
    assign in_temp = in;
    assign in_temp[4] = 0;
    
    genvar i;
    generate
        for (i=0; i<SIZE; i=i+1)
        begin
            mux_nx1 #(.SIZE(2)) MUXGEN (
                .mux_nx1_sel(sel),
                .mux_nx1_in({in_temp[i+1],in_temp[i]}),
                .mux_nx1_out(out[i])
            );
        end 
    endgenerate
endmodule
