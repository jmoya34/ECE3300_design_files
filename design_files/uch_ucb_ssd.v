`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 03:03:22 PM
// Design Name: uch + ucb + mux to switch counters + ssd_driver
// Module Name: uch_ucb_ssd
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies:
// ucb.v
// uch.v
// ssd_driver.v
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uch_ucb_ssd #(parameter clk_counter_value = 10000000) (          	// clk_counter_value is used to set the clock delay since the system clock is 100MHz
    input uch_ucb_ssd_clk,                                              	// clk_counter_value = 10,000,000 means wait 10,000,000 cycles or 100ns
    input uch_ucb_ssd_rst,                                              	//
    input uch_ucb_ssd_hex_en,                                           	//
    input uch_ucb_ssd_bcd_en,                                           	// I did seperate enable inputs for the UCB and the UCH
    input uch_ucb_ssd_sel,                                              	//
																			//
    output uch_ucb_ssd_rst_led,                                         	// Output LED for rst switch
    output uch_ucb_ssd_hex_en_led,                                      	// Output LED for hex_en switch
    output uch_ucb_ssd_bcd_en_led,                                      	// Output LED for bcd_en switch
    output uch_ucb_ssd_sel_led,                                         	// Output LED for sel switch
																			//
    output [6:0] uch_ucb_ssd_cc,                                        	//                                          	
    output [7:0] uch_ucb_ssd_an                                     		//
    );                                                                  	//
																			//
    assign uch_ucb_ssd_rst_led = uch_ucb_ssd_rst;                       	//
    assign uch_ucb_ssd_hex_en_led = uch_ucb_ssd_hex_en;                 	//
    assign uch_ucb_ssd_bcd_en_led = uch_ucb_ssd_bcd_en;                 	//
    assign uch_ucb_ssd_sel_led = uch_ucb_ssd_sel;                       	//                                   	
    assign uch_ucb_ssd_an = 8'bzzzzzzz0;                             	// Turn on rightmost SSD
																			//
    reg [31:0] counter = 0;                                             	// Use 32-bit counter since that can hold values up to 4,294,967,295
    reg uch_ucb_ssd_clk_out = 0;                                        	// Make another slower, internal, counter-based clock
    always@ (posedge uch_ucb_ssd_clk)                                   	//
    begin                                                               	//
        counter = counter + 1;                                          	// Increment counter until it is greater than 10,000,000
        if (counter > clk_counter_value)                                	//
        begin                                                           	//
            counter = 0;                                                	// Reset counter back to zero,
            uch_ucb_ssd_clk_out = ~uch_ucb_ssd_clk_out;                 	// Toggle the slower clock
        end                                                             	//
    end                                                                 	//
																			//
    wire [3:0] temp_uch_out;                                            	// Temp output of the UCH
    wire [3:0] temp_ucb_out;                                            	// Temp output of the UCB
    wire [3:0] temp_mux_out;                                            	// Temp output of the mux
																			//
    assign temp_mux_out = uch_ucb_ssd_sel ? temp_ucb_out : temp_uch_out;	// One line assign with conditional/ternary operator can be used to implement a 2-to-1 mux
																			//
    uch uch_top (                                                       	//
        .uch_clk(uch_ucb_ssd_clk_out),                                  	//
        .uch_rst(uch_ucb_ssd_rst),                                      	//
        .uch_en(uch_ucb_ssd_hex_en),                                    	//
        .uch_out(temp_uch_out)                                          	// Assign output of UCH to its temp ouput
    );                                                                  	//
																			//
    ucb ucb_top (                                                       	//
        .ucb_clk(uch_ucb_ssd_clk_out),                                  	//
        .ucb_rst(uch_ucb_ssd_rst),                                      	//
        .ucb_en(uch_ucb_ssd_bcd_en),                                    	//
        .ucb_out(temp_ucb_out)                                          	// Assign output of UCB to its temp ouput
    );                                                                  	//
																			//
    ssd_driver ssd_top (                                                	//
        .ssd_driver_port_in(temp_mux_out),                              	// Output of mux goes into ssd_driver
        .ssd_driver_port_dp_in(),                                       	// No need to use decimal point, can leave open
        .ssd_driver_port_led(),                                         	// Decided to not show the input values using the output LEDs
        .ssd_driver_port_cc(uch_ucb_ssd_cc),                            	//
        .ssd_driver_port_dp_out(),                                      	// No need to use decimal point, can leave open
        .ssd_driver_port_an(uch_ucb_ssd_an)                     			//
    );                                                                  	//
																			//
endmodule                                                               	//
