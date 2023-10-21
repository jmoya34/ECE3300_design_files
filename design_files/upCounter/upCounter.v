`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 05:06:33 PM
// Design Name: 
// Module Name: upCounter
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

module upCounter
                (
                    input counter_mux_en,
                    input counter_mux_rst,
                    input counter_mux_clk,
                    input counter_mux_select,
                    output [3:0] counter_mux_led_out
                );
                
                assign counter_mux_sev_seg_output_off = 7'b1111111;
                assign counter_mux_sev_seg_output_an = 1'b0;
                
                wire [3:0] counter_mux_out_bcd;
                wire [3:0] counter_mux_out_hex;
                
                uch  hex_counter_up(
                    .uch_en(counter_mux_en),
                    .uch_rst(counter_mux_rst),
                    .uch_clk(counter_mux_clk),
                    .uch_out(counter_mux_out_hex)
                );
                
                ucb bcd_counter_up(
                    .ucb_en(counter_mux_en),
                    .ucb_rst(counter_mux_rst),
                    .ucb_clk(counter_mux_clk),
                    .ucb_out(counter_mux_out_bcd)
                );
                
                mux2x1_Ninput myMux(
                    .mux2x1_sel(counter_mux_select),
                    .mux2x1_i1(counter_mux_out_bcd),
                    .mux2x1_i0(counter_mux_out_hex), 
                    .mux2x1_p(counter_mux_led_out)
                );
                  
                
endmodule

