`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 03:03:22 PM
// Design Name: 
// Module Name: uch_ucd_ssd
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


module uch_ucd_ssd(
    input uch_ucd_ssd_clk,
    input uch_ucd_ssd_rst,
    input uch_ucd_ssd_hex_en,
    input uch_ucd_ssd_bcd_en,
    input uch_ucd_ssd_sel,
    
    output uch_ucd_ssd_rst_led,
    output uch_ucd_ssd_hex_en_led,
    output uch_ucd_ssd_bcd_en_led,
    output uch_ucd_ssd_sel_led,
    
    output [6:0] uch_ucd_ssd_cc,
    output uch_ucd_ssd_an_on,
    output [6:0] uch_ucd_ssd_an_off
    );
    
    assign uch_ucd_ssd_rst_led = uch_ucd_ssd_rst;
    assign uch_ucd_ssd_hex_en_led = uch_ucd_ssd_hex_en;
    assign uch_ucd_ssd_bcd_en_led = uch_ucd_ssd_bcd_en;
    assign uch_ucd_ssd_sel_led = uch_ucd_ssd_sel; 
    assign uch_ucd_ssd_an_on = 0;
    assign uch_ucd_ssd_an_off = 7'bzzzzzzz;
    
    wire [3:0] temp_uch_out;
    wire [3:0] temp_ucd_out;
    wire [3:0] temp_mux_out;
    
    assign temp_mux_out = uch_ucd_ssd_sel ? temp_ucd_out : temp_uch_out;
    
    upcounter_hex uch (
        .uch_clk(uch_ucd_ssd_clk),
        .uch_rst(uch_ucd_ssd_rst),
        .uch_en(uch_ucd_ssd_hex_en),
        .uch_out(temp_uch_out)
    );
    
    wire ucd_rst;
    wire ucd_temp_rst;
    
    assign ucd_temp_rst = (temp_ucd_out[3] & !temp_ucd_out[2] & !temp_ucd_out[1] & temp_ucd_out[0]);
    or(ucd_rst, uch_ucd_ssd_rst, ucd_temp_rst);
    
    upcounter_hex ucd (
        .uch_clk(uch_ucd_ssd_clk),
        .uch_rst(ucd_rst),
        .uch_en(uch_ucd_ssd_bcd_en),
        .uch_out(temp_ucd_out)
    );
    
    ssd_driver ssd (
        .ssd_driver_port_in(temp_mux_out),
        .ssd_driver_port_dp_in(),
        .ssd_driver_port_led(),
        .ssd_driver_port_cc(uch_ucd_ssd_cc),
        .ssd_driver_port_dp_out(),
        .ssd_driver_port_an_on(uch_ucd_ssd_an_on),
        .ssd_driver_port_an_off(uch_ucd_ssd_an_off)
    );
        
endmodule
