`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2023 01:51:02 AM
// Design Name: Up Counter BCD
// Module Name: ucb
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: 
// uch.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
																					//
																					//
module ucb(                                                                        	// The UCB counts only from 0-9, instead of 0 to F
    input ucb_clk,                                                                 	//
    input ucb_rst,                                                                 	// The UCB is a UCH but has extra code to reset it back to 0
    input ucb_en,                                                                  	// whenever the output reaches 9
    output [3:0] ucb_out                                                           	//
    );                                                                             	//
																					//
    wire ucb_rst_out;                                                              	//
    wire ucb_temp_rst;                                                             	//
																					//
    assign ucb_temp_rst = (ucb_out[3] & !ucb_out[2] & !ucb_out[1] & ucb_out[0]);   	// Watch the output of the UCH; ucb_temp_rst is HIGH when ucb_out = 9 = 1001
    or(ucb_rst_out, ucb_rst, ucb_temp_rst);                                        	// 
																					// OR the ucb_rst input with the ucb_temp_rst; the UCH will reset back to 0 whenever uch_out = 9,
    uch bcd (                                                                      	// or if the ucb_rst input is HIGH
        .uch_clk(ucb_clk),                                                         	// 
        .uch_rst(ucb_rst_out),                                                     	//
        .uch_en(ucb_en),                                                           	//
        .uch_out(ucb_out)                                                          	//
    );                                                                             	//
endmodule                                                                          	//
