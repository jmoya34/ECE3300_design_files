`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 11:43:08 PM
// Design Name: 
// Module Name: Counter_Mux_TB
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


module Counter_Mux_TB #(parameter my_DIV = 27'd10)();
        reg counter_mux_rst_tb;
        reg counter_mux_en_tb;
        reg counter_mux_clk_tb;
        reg counter_mux_select_tb;
        wire counter_mux_sev_seg_output_an_tb;
        wire [6:0] counter_mux_sev_seg_output_off_tb;
        wire [3:0] counter_mux_led_out_tb;
        wire [6:0] counter_mux_seg_out_tb;
    
        Counter_Mux #(.CLK_DIV(my_DIV)) counter_mux_inst (
                     .counter_mux_rst(counter_mux_rst_tb),
                     .counter_mux_en(counter_mux_en_tb),
                     .counter_mux_clk(counter_mux_clk_tb),
                     .counter_mux_select(counter_mux_select_tb),
                     .counter_mux_sev_seg_output_an(counter_mux_sev_seg_output_an_tb),
                     .counter_mux_sev_seg_output_off(counter_mux_sev_seg_output_off_tb),
                     .counter_mux_led_out(counter_mux_led_out_tb),
                     .counter_mux_seg_out(counter_mux_seg_out_tb)
        );
    
        // Clock generator for uch_clk
        initial begin
             counter_mux_clk_tb = 0;
                    // create input clock 100MHz
                    forever #5 counter_mux_clk_tb = ~counter_mux_clk_tb;
        end
    
        integer i;
        // Testbench stimulus
        initial begin
            // Initialize signals
            counter_mux_en_tb = 0;
            counter_mux_rst_tb = 1;
    
            #10 counter_mux_rst_tb = 0; // #100 is 100ns which is one clock cycle 
    
            // Enable UCH
            #10 counter_mux_en_tb = 1;
            
            for(i = 0; i < 2; i = i+1)
                begin
                counter_mux_select_tb = i;
                counter_mux_rst_tb = 1;
                #100;
                counter_mux_rst_tb = 0;
                #100;
                #2300;
                end
    
    
            $finish;
        end

endmodule
