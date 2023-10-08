`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 08:47:29 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider #(parameter DIVISOR = 28'd100000000)
                    (
                    input clock_in, 
                    output reg clock_out 
                    );
                    
                    reg[27:0] counter=28'd0;
                    
                    // For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
                    // You will modify the DIVISOR parameter value to 28'd50.000.000
                    // Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
                    always @(posedge clock_in)
                    begin
                     counter <= counter + 28'd1;
                     if(counter>=(DIVISOR-1))
                      counter <= 28'd0;
                     clock_out <= (counter<DIVISOR/2)?1'b1:1'b0;
                    end     
endmodule