`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 02:58:25 PM
// Design Name: 
// Module Name: uch
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


module uch(
    input uch_clk,
    input uch_rst,
    input uch_en,
    output reg [3:0] uch_out
    );
    
    always @(posedge uch_clk)
    begin: uch_OP
        if (uch_rst)
            uch_out = 4'd0;
        else
        begin: EN_ON
            if (uch_en)
                uch_out <= uch_out + 1;
        end
    end
endmodule
