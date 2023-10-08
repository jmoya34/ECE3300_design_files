`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 08:41:59 PM
// Design Name: 
// Module Name: UCB
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


module UCB #(parameter CLK_DIVISION = 28'd100000000)
           (
            input ucb_en,
            input ucb_rst,
            input ucb_clk,
            output[3:0] ucb_out
           );
           
           wire bcd_rst;
           assign bcd_rst = (ucb_out[0] & (~ucb_out[1]) & (~ucb_out[2]) & ucb_out[3]) | ucb_rst;
           
           UCH #(.DIVISION(CLK_DIVISION)) my_UCH
            (
             .uch_en(ucb_en),
             .uch_rst(bcd_rst),
             .uch_clk(ucb_clk),
             .uch_out(ucb_out)
            );
           
endmodule
