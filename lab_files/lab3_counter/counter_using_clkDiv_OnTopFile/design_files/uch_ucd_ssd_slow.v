`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 10:28:42 PM
// Design Name: 
// Module Name: uch_ucd_ssd_slow
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


module uch_ucd_ssd_slow(
    input uch_ucd_ssd_clk_slow_in,
    input uch_ucd_ssd_rst_slow,
    input uch_ucd_ssd_hex_en_slow,
    input uch_ucd_ssd_bcd_en_slow,
    input uch_ucd_ssd_sel_slow,
    
    output uch_ucd_ssd_rst_led_slow,
    output uch_ucd_ssd_hex_en_led_slow,
    output uch_ucd_ssd_bcd_en_led_slow,
    output uch_ucd_ssd_sel_led_slow,
    
    output [6:0] uch_ucd_ssd_cc_slow,
    output uch_ucd_ssd_an_on_slow,
    output [6:0] uch_ucd_ssd_an_off_slow
    );
    
    reg [31:0] counter = 0;
    reg uch_ucd_ssd_clk_slow_out = 0;
    always @(posedge uch_ucd_ssd_clk_slow_in)
    begin
        counter = counter + 1;
        if (counter == 100000000/4)
        begin
            uch_ucd_ssd_clk_slow_out = ~uch_ucd_ssd_clk_slow_out;
            counter = 0;
        end 
    end
    
    uch_ucd_ssd main (
        .uch_ucd_ssd_clk(uch_ucd_ssd_clk_slow_out),
        .uch_ucd_ssd_rst(uch_ucd_ssd_rst_slow),
        .uch_ucd_ssd_hex_en(uch_ucd_ssd_hex_en_slow),
        .uch_ucd_ssd_bcd_en(uch_ucd_ssd_bcd_en_slow),
        .uch_ucd_ssd_sel(uch_ucd_ssd_sel_slow),
    
        .uch_ucd_ssd_rst_led(uch_ucd_ssd_rst_led_slow),
        .uch_ucd_ssd_hex_en_led(uch_ucd_ssd_hex_en_led_slow),
        .uch_ucd_ssd_bcd_en_led(uch_ucd_ssd_bcd_en_led_slow),
        .uch_ucd_ssd_sel_led(uch_ucd_ssd_sel_led_slow),
   
        .uch_ucd_ssd_cc(uch_ucd_ssd_cc_slow),
        .uch_ucd_ssd_an_on(uch_ucd_ssd_an_on_slow),
        .uch_ucd_ssd_an_off(uch_ucd_ssd_an_off_slow)
    );
endmodule
