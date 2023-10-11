`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 06:22:08 PM
// Design Name: 
// Module Name: barrelshifter_n
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


module barrelshifter_n #(parameter SIZE_BSN = 4) (
    input [SIZE_BSN-1:0] b,
    input sr_sel,
    input [$clog2(SIZE_BSN)-1:0] sel,
    output reg [SIZE_BSN-1:0] p
    );
    
    always @*
    begin
        if (sr_sel)
            begin
                p <= {b, b} >> sel;   
            end
        else
            begin
                p <= b >> sel;
            end
    end

endmodule
