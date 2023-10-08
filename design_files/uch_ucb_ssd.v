`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 03:03:22 PM
// Design Name: uch + ucb + mux to switch counters + ssd_driver
// Module Name: uch_ucb_ssd
// Project Name: 
// Target Devices: 
// Tool Versions: 
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


module uch_ucb_ssd #(parameter clk_counter_value = 10000000) (
    input uch_ucb_ssd_clk,
    input uch_ucb_ssd_rst,
    input uch_ucb_ssd_hex_en,
    input uch_ucb_ssd_bcd_en,
    input uch_ucb_ssd_sel,
    
    output uch_ucb_ssd_rst_led,
    output uch_ucb_ssd_hex_en_led,
    output uch_ucb_ssd_bcd_en_led,
    output uch_ucb_ssd_sel_led,
    
    output [6:0] uch_ucb_ssd_cc,
    output uch_ucb_ssd_an_on,
    output [6:0] uch_ucb_ssd_an_off
    );
    
    assign uch_ucb_ssd_rst_led = uch_ucb_ssd_rst;
    assign uch_ucb_ssd_hex_en_led = uch_ucb_ssd_hex_en;
    assign uch_ucb_ssd_bcd_en_led = uch_ucb_ssd_bcd_en;
    assign uch_ucb_ssd_sel_led = uch_ucb_ssd_sel; 
    assign uch_ucb_ssd_an_on = 0;
    assign uch_ucb_ssd_an_off = 7'bzzzzzzz;
    
    reg [31:0] counter = 0;
    reg uch_ucb_ssd_clk_out = 0;
    always@ (posedge uch_ucb_ssd_clk)
    begin
        counter = counter + 1;
        if (counter > clk_counter_value)
        begin
            counter = 0;
            uch_ucb_ssd_clk_out = ~uch_ucb_ssd_clk_out;
        end
    end
    
    wire [3:0] temp_uch_out;
    wire [3:0] temp_ucb_out;
    wire [3:0] temp_mux_out;
    
    assign temp_mux_out = uch_ucb_ssd_sel ? temp_ucb_out : temp_uch_out;
    
    uch uch_top (
        .uch_clk(uch_ucb_ssd_clk_out),
        .uch_rst(uch_ucb_ssd_rst),
        .uch_en(uch_ucb_ssd_hex_en),
        .uch_out(temp_uch_out)
    );
    
    ucb ucb_top (
        .ucb_clk(uch_ucb_ssd_clk_out),
        .ucb_rst(uch_ucb_ssd_rst),
        .ucb_en(uch_ucb_ssd_bcd_en),
        .ucb_out(temp_ucb_out)
    );
    
    ssd_driver ssd_top (
        .ssd_driver_port_in(temp_mux_out),
        .ssd_driver_port_dp_in(),
        .ssd_driver_port_led(),
        .ssd_driver_port_cc(uch_ucb_ssd_cc),
        .ssd_driver_port_dp_out(),
        .ssd_driver_port_an_on(uch_ucb_ssd_an_on),
        .ssd_driver_port_an_off(uch_ucb_ssd_an_off)
    );
        
endmodule
