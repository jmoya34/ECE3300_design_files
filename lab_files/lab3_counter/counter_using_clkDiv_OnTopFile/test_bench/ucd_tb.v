`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2023 07:32:16 PM
// Design Name: 
// Module Name: ucd_tb
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


module ucd_tb(
    );
    
    reg ucd_clk_tb;
    reg ucd_rst_tb;
    reg ucd_en_tb;
    wire [3:0] ucd_out_tb;

    wire ucd_rst_final;
    wire ucd_temp_rst;
    
    assign ucd_temp_rst = (ucd_out_tb[3] & !ucd_out_tb[2] & !ucd_out_tb[1] & ucd_out_tb[0]);
    or(ucd_rst_final, ucd_rst_tb, ucd_temp_rst);
    
    upcounter_hex ucd_tb (
        .uch_clk(ucd_clk_tb),
        .uch_rst(ucd_rst_final),
        .uch_en(ucd_en_tb),
        .uch_out(ucd_out_tb)
    );

    // generating clock
    initial
        begin: INIT_CLK
            ucd_clk_tb = 1;
        end
    always
        begin
            #5 ucd_clk_tb = ~ucd_clk_tb;
        end
    
    integer i,j;
    initial
        begin: TB_START
        ucd_rst_tb = 1'b0;
        ucd_en_tb = 1'b0;
            for (i=0; i<2; i=i+1)
            begin: RST_LOOP
                 ucd_rst_tb = ~ucd_rst_tb;
                 #5;
                 for (j=0; j<2; j=j+1)
                 begin: EN_LOOP
                    ucd_en_tb = ~ucd_en_tb;
                    #150;
                 end
            end
        ucd_rst_tb = 1;
        #50;
        $finish;
        end


endmodule
