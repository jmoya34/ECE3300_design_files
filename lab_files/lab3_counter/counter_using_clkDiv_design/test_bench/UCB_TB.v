`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 11:35:50 PM
// Design Name: 
// Module Name: UCB_TB
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


module UCB_TB #(parameter my_DIV = 27'd10)();
    reg ucb_en_tb;    
    reg ucb_rst_tb;   
    reg ucb_clk_tb;   
    wire [3:0] ucb_out_tb; 

    UCB #(.CLK_DIVISION(my_DIV)) ucb_inst (
        .ucb_en(ucb_en_tb),
        .ucb_rst(ucb_rst_tb),
        .ucb_clk(ucb_clk_tb),
        .ucb_out(ucb_out_tb)
    );

    // Clock generator for uch_clk
    initial begin
         ucb_clk_tb = 0;
                // create input clock 100MHz
                forever #5 ucb_clk_tb = ~ucb_clk_tb;
    end

    // Testbench stimulus
    initial begin
        // Initialize signals
        ucb_en_tb = 0;
        ucb_rst_tb = 1;

        #10 ucb_rst_tb = 0; // #100 is 100ns which is one clock cycle 

        // Enable UCH
        #10 ucb_en_tb = 1;


        $finish;
    end

endmodule
