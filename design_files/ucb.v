`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 01:51:02 AM
// Design Name: 
// Module Name: ucb
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


module ucb(
    input ucb_clk,
    input ucb_rst,
    input ucb_en,
    output [3:0] ucb_out
    );
    
    wire ucb_rst_out;
    wire ucb_temp_rst;
    
    assign ucb_temp_rst = (ucb_out[3] & !ucb_out[2] & !ucb_out[1] & ucb_out[0]);
    or(ucb_rst_out, ucb_rst, ucb_temp_rst);
    
    uch bcd (
        .uch_clk(ucb_clk),
        .uch_rst(ucb_rst_out),
        .uch_en(ucb_en),
        .uch_out(ucb_out)
    );
endmodule
