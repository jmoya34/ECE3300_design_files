`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 02:58:25 PM
// Design Name: Up Counter Hex
// Module Name: uch
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uch(                             // Counts from 0 to F
    input uch_clk,                      //
    input uch_rst,                      //
    input uch_en,                       //
    output reg [3:0] uch_out            //
    );                                  //
										//
    always @(posedge uch_clk)           //
    begin: uch_OP                       //
        if (uch_rst)                    // If uch_rst is high, set output to 0
            uch_out = 4'd0;             //
        else                            // If uch_rst is low, check uch_en
        begin: EN_ON                    // If uch_en is high, starting counting
            if (uch_en)                 //
                uch_out <= uch_out + 1; // Since uch_out is 4 bit, once it is 15 = F = 1111, adding another 1 
        end                             // will cause it to overflow back to 0, restarting the counter
    end                                 //
endmodule                               //
