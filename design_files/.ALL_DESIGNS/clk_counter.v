`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 05:01:52 PM
// Design Name: 
// Module Name: clk_counter
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


module clk_counter #(parameter SIZE = 32) (
    input sys_clk,
    input sys_rst,
    input [$clog2(SIZE)-1:0] speed_sel,
    output block_clk
    );
    
    reg [SIZE-1:0] clk_counter_temp;
    
    always @(posedge sys_clk)
    begin
        if (sys_rst)
            clk_counter_temp <= 0;
        else
            clk_counter_temp <= clk_counter_temp + 1;
    end
    
    assign block_clk = clk_counter_temp[speed_sel];
    
endmodule