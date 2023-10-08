`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 04:28:02 PM
// Design Name: 
// Module Name: uch_ucb_ssd_tb
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


module uch_ucb_ssd_tb #(parameter clk_counter_value_tb = 0) (
    );
    
    reg uch_ucb_ssd_clk_tb;
    reg uch_ucb_ssd_rst_tb;
    reg uch_ucb_ssd_hex_en_tb;
    reg uch_ucb_ssd_bcd_en_tb;
    reg uch_ucb_ssd_sel_tb;
    
    wire uch_ucb_ssd_rst_led_tb;
    wire uch_ucb_ssd_hex_en_led_tb;
    wire uch_ucb_ssd_bcd_en_led_tb;
    wire uch_ucb_ssd_sel_led_tb;
    
    wire [6:0] uch_ucb_ssd_cc_tb;
    wire uch_ucb_ssd_an_on_tb;
    wire [6:0] uch_ucb_ssd_an_off_tb;
    
    assign uch_ucb_ssd_an_on_tb = 0;
    assign uch_ucb_ssd_an_off_tb = 7'bzzzzzzz;
    
    // generating clock
    initial
        begin: INIT_CLK
            uch_ucb_ssd_clk_tb = 1;
        end
    always
        begin
            #1 uch_ucb_ssd_clk_tb = ~uch_ucb_ssd_clk_tb;
        end 
    
    integer i,j,k,x;
    initial
        begin: TB_START
            uch_ucb_ssd_rst_tb = 1'b0;
            uch_ucb_ssd_sel_tb = 1'b0;
            uch_ucb_ssd_hex_en_tb = 1'b0;
            uch_ucb_ssd_bcd_en_tb = 1'b0; 
            
            for (i=0; i<3; i=i+1)
            begin: RST_LOOP
                uch_ucb_ssd_rst_tb = ~uch_ucb_ssd_rst_tb;
                for (j=0; j<2; j=j+1)
                begin: SEL_LOOP
                    uch_ucb_ssd_sel_tb = ~uch_ucb_ssd_sel_tb;
                    for (k=0; k<2; k=k+1)
                    begin: HEX_EN_LOOP
                        uch_ucb_ssd_hex_en_tb = ~uch_ucb_ssd_hex_en_tb;
                        #150;
                    end
                    for (x=0; x<2; x=x+1)
                    begin: BCD_EN_LOOP
                        uch_ucb_ssd_bcd_en_tb = ~uch_ucb_ssd_bcd_en_tb;
                        #150;
                    end
                    uch_ucb_ssd_sel_tb = ~uch_ucb_ssd_sel_tb;
                    #100;
                    uch_ucb_ssd_sel_tb = ~uch_ucb_ssd_sel_tb;
                    #100;
                end
            end
            #20;
            $finish; 
        end

        uch_ucb_ssd #(.clk_counter_value(clk_counter_value_tb)) uch_ucb_ssd_tb (
            .uch_ucb_ssd_clk(uch_ucb_ssd_clk_tb),     
            .uch_ucb_ssd_rst(uch_ucb_ssd_rst_tb),     
            .uch_ucb_ssd_hex_en(uch_ucb_ssd_hex_en_tb),  
            .uch_ucb_ssd_bcd_en(uch_ucb_ssd_bcd_en_tb),  
            .uch_ucb_ssd_sel(uch_ucb_ssd_sel_tb),     
            
            .uch_ucb_ssd_rst_led(uch_ucb_ssd_rst_led_tb),
            .uch_ucb_ssd_hex_en_led(uch_ucb_ssd_hex_en_led_tb),
            .uch_ucb_ssd_bcd_en_led(uch_ucb_ssd_bcd_en_led_tb),
            .uch_ucb_ssd_sel_led(uch_ucb_ssd_sel_led_tb),         
                       
            .uch_ucb_ssd_cc(uch_ucb_ssd_cc_tb),
            .uch_ucb_ssd_an_on(uch_ucb_ssd_an_on_tb), 
            .uch_ucb_ssd_an_off(uch_ucb_ssd_an_off_tb)
        );

endmodule
