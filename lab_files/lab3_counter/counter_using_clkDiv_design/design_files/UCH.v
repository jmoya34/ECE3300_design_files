`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 08:02:38 PM
// Design Name: 
// Module Name: UCH
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


module UCH #(parameter DIVISION = 28'd100000000)
            (
            input uch_en,
            input uch_rst,
            input uch_clk,
            output reg[3:0] uch_out
            );
            
            wire clock_out;
            clock_divider #(.DIVISOR(DIVISION))  one_hz_clk
                    (
                    .clock_in(uch_clk), 
                    .clock_out (clock_out)
                    );
            
            
            always @(posedge clock_out)
            if(uch_rst)
                uch_out <= 4'b0;
            else
                begin
                if (uch_out == 4'b1111)
                    uch_out <= 4'b0000;
                else if(uch_en)
                    uch_out <= uch_out +1;
                end
endmodule
