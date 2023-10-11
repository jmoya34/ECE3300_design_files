`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 02:58:25 PM
// Design Name: 
// Module Name: upcounter_hex
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


module upcounter_hex(
    input uch_clk,
    input uch_rst,
    input uch_en,
    output [3:0] uch_out
    );
    
    reg [3:0] uch_temp;
    assign uch_out = uch_temp;
    
    always @(posedge uch_clk)
    begin: UCH_OP
        if (uch_rst)
            uch_temp = 4'd0;
        else
        begin: EN_ON
            if (uch_en)
                uch_temp <= uch_temp + 1;
        end
    end
endmodule
