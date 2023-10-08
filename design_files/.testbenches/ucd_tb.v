`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 07:32:16 PM
// Design Name: 
// Module Name: ucb_tb
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


module ucb_tb(
    );
    
    reg ucb_clk_tb;
    reg ucb_rst_tb;
    reg ucb_en_tb;
    wire [3:0] ucb_out_tb;
    
    ucb ucb_tb (
        .ucb_clk(ucb_clk_tb),
        .ucb_rst(ucb_rst_tb),
        .ucb_en(ucb_en_tb),
        .ucb_out(ucb_out_tb)
    );

    // generating clock
    initial
        begin: INIT_CLK
            ucb_clk_tb = 1;
        end
    always
        begin
            #5 ucb_clk_tb = ~ucb_clk_tb;
        end
    
    integer i,j;
    initial
        begin: TB_START
        ucb_rst_tb = 1'b0;
        ucb_en_tb = 1'b0;
            for (i=0; i<2; i=i+1)
            begin: RST_LOOP
                 ucb_rst_tb = ~ucb_rst_tb;
                 #5;
                 for (j=0; j<2; j=j+1)
                 begin: EN_LOOP
                    ucb_en_tb = ~ucb_en_tb;
                    #150;
                 end
            end
        ucb_rst_tb = 1;
        #50;
        $finish;
        end


endmodule
