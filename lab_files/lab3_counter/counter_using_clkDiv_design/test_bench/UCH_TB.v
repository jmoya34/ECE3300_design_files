`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2023 05:23:06 PM
// Design Name: 
// Module Name: inc_TB
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


module UCH_TB#(parameter my_DIV = 27'd10)(); // it's going to create a div by 0 error if you set it to 0
    reg uch_en_tb;    
    reg uch_rst_tb;   
    reg uch_clk_tb;   
    wire [3:0] uch_out_tb; 

    UCH #(.DIVISION(my_DIV)) uch_inst (
        .uch_en(uch_en_tb),
        .uch_rst(uch_rst_tb),
        .uch_clk(uch_clk_tb),
        .uch_out(uch_out_tb)
    );

    // Clock generator for uch_clk
    initial begin
         uch_clk_tb = 0;
                // create input clock 100MHz
                forever #5 uch_clk_tb = ~uch_clk_tb;
    end

    // Testbench stimulus
    initial begin
        // Initialize signals
        uch_en_tb = 0;
        uch_rst_tb = 1;

        #10 uch_rst_tb = 0; // #100 is 100ns which is one clock cycle 

        // Enable UCH
        #10 uch_en_tb = 1;


        $finish;
    end

endmodule
