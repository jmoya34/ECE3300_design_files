`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2023 04:42:07 PM
// Design Name: 
// Module Name: decoder_4_16
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


module decoder_4_16(
    input port_E,
    input port_x0,
    input port_x1,
    input port_x2,
    input port_x3,
    output [3:0] port_d0,
    output [3:0] port_d1,
    output [3:0] port_d2,
    output [3:0] port_d3
    );
    
    wire [3:0] decoder1_output;
    decoder_2_4 Enabler(
                .E(port_E),
                .x0(port_x2),
                .x1(port_x3),
                .d0(decoder1_output[0]),
                .d1(decoder1_output[1]),
                .d2(decoder1_output[2]),
                .d3(decoder1_output[3])
        );
    
    genvar i;
    generate
    for(i = 0; i < 4; i = i+1)
    decoder_2_4 decoder4(
                .E(decoder1_output[i]),
                .x0(port_x0),
                .x1(port_x1),
                .d0(port_d0[i]),
                .d1(port_d1[i]),
                .d2(port_d2[i]),
                .d3(port_d3[i])
    );
    endgenerate
    
endmodule
