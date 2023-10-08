`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 10:40:12 PM
// Design Name: 
// Module Name: Counter_Mux
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


module Counter_Mux #(parameter CLK_DIV = 28'd100000000)
                (
                    input counter_mux_rst,
                    input counter_mux_en,
                    input counter_mux_clk,
                    input counter_mux_select,
                    output counter_mux_sev_seg_output_an,
                    output [6:0] counter_mux_sev_seg_output_off,
                    output [3:0] counter_mux_led_out,
                    output reg[6:0] counter_mux_seg_out
                );
                
                assign counter_mux_sev_seg_output_off = 7'b1111111;
                assign counter_mux_sev_seg_output_an = 1'b0;
                
                wire [3:0] counter_mux_out_bcd;
                wire [3:0] counter_mux_out_hex;
                
                UCH #(.DIVISION(CLK_DIV)) hex_counter_up(
                    .uch_en(counter_mux_en),
                    .uch_rst(counter_mux_rst),
                    .uch_clk(counter_mux_clk),
                    .uch_out(counter_mux_out_hex)
                );
                
                UCB #(.CLK_DIVISION(CLK_DIV)) bcd_counter_up(
                    .ucb_en(counter_mux_en),
                    .ucb_rst(counter_mux_rst),
                    .ucb_clk(counter_mux_clk),
                    .ucb_out(counter_mux_out_bcd)
                );
                
                wire [3:0] counter_mux_values;
                mux2x1 myMux(
                    .mux2x1_sel(counter_mux_select),
                    .mux2x1_i1(counter_mux_out_bcd),
                    .mux2x1_i0(counter_mux_out_hex), 
                    .mux2x1_p(counter_mux_values)
                );
                
                assign counter_mux_led_out = counter_mux_values;
                
                always @(counter_mux_values)
                    begin: CONVERT_7SEG
                        case(counter_mux_values)
                            4'h0: counter_mux_seg_out = 7'b1000000;
                            4'h1: counter_mux_seg_out = 7'b1111001;
                            4'h2: counter_mux_seg_out = 7'b0100100;
                            4'h3: counter_mux_seg_out = 7'b0110000;
                            4'h4: counter_mux_seg_out = 7'b0011001;
                            4'h5: counter_mux_seg_out = 7'b0010010;
                            4'h6: counter_mux_seg_out = 7'b0000010;
                            4'h7: counter_mux_seg_out = 7'b1111000;
                            4'h8: counter_mux_seg_out = 7'b0000000;
                            4'h9: counter_mux_seg_out = 7'b0011000;
                            4'hA: counter_mux_seg_out = 7'b0001000;
                            4'hB: counter_mux_seg_out = 7'b0000011;
                            4'hC: counter_mux_seg_out = 7'b1000110;
                            4'hD: counter_mux_seg_out = 7'b0100001;
                            4'hE: counter_mux_seg_out = 7'b0000110;
                            4'hF: counter_mux_seg_out = 7'b0001110;
                            
                            default: counter_mux_seg_out = 7'bzzzzzzz; // z keeps it from being 1 or 0
                        endcase
                    end
                    
                
endmodule
