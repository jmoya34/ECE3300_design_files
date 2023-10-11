`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 07:32:16 PM
// Design Name: 
// Module Name: uch_tb
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


module uch_tb(
    );
    
    reg uch_clk_tb;
    reg uch_rst_tb;
    reg uch_en_tb;
    wire [3:0] uch_out_tb;
    
    // generating clock
    initial
        begin: INIT_CLK
            uch_clk_tb = 1;
        end
    always
        begin
            #5 uch_clk_tb = ~uch_clk_tb;
        end
    
    integer i,j;
    initial
        begin: TB_START
        uch_rst_tb = 1'b0;
        uch_en_tb = 1'b0;
            for (i=0; i<2; i=i+1)
            begin: RST_LOOP
                 uch_rst_tb = ~uch_rst_tb;
                 #5;
                 for (j=0; j<2; j=j+1)
                 begin: EN_LOOP
                    uch_en_tb = ~uch_en_tb;
                    #200;
                 end
            end
        uch_rst_tb = 1;
        #50;
        $finish;
        end
    
    uch uch_tb (
        .uch_clk(uch_clk_tb),
        .uch_rst(uch_rst_tb),
        .uch_en(uch_en_tb),
        .uch_out(uch_out_tb)
    );

endmodule
