`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 01:17:46 PM
// Design Name: 
// Module Name: mux_nx1_tb
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


module mux_nx1_tb #(parameter SIZE_TB = 8) ();
    
    reg [$clog2(SIZE_TB)-1:0] mux_nx1_sel_tb;
    reg [SIZE_TB-1:0] mux_nx1_in_tb;
    wire mux_nx1_out_tb;
    
    mux_nx1 #(.SIZE(SIZE_TB)) mux_nx1_tb (
        .mux_nx1_sel(mux_nx1_sel_tb),
        .mux_nx1_in(mux_nx1_in_tb),
        .mux_nx1_out(mux_nx1_out_tb)
    );
    
    integer i, j;
    initial
    begin: TB_START
        for (i=0; i<2**$clog2(SIZE_TB); i=i+1)
        begin: SEL_LOOP
            mux_nx1_sel_tb = i;
            #(5/(2**i))
            for (j=0; j<2**SIZE_TB; j=j+1)
            begin: IN_LOOP
                mux_nx1_in_tb = j;
                #(1/(2**i));
            end
        end
    #20
    $finish;
    end
endmodule
