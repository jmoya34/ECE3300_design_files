`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2023 04:17:23 PM
// Design Name: 
// Module Name: decoder_2_4
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


module decoder_2_4(
        input x0,
        input x1,
        input E,
        inout wire d0,
        inout wire d1,
        inout wire d2,
        inout wire d3
    );
    
        wire x0_not;
        wire x1_not;
        not(x0_not, x0);
        not(x1_not, x1);
        
        and(d0, x0_not, x1_not, E);
        and(d1, x0, x1_not, E);
        and(d2, x0_not, x1, E);
        and(d3, x0, x1, E);
    
endmodule
