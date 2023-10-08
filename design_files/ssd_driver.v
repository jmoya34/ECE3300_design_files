`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 01:51:18 PM
// Design Name: 7 segment display driver
// Module Name: ssd_driver
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ssd_driver(
    input [3:0] ssd_driver_port_in,
    input ssd_driver_port_dp_in,
    output [3:0] ssd_driver_port_led,
    output [6:0] ssd_driver_port_cc,
    output ssd_driver_port_dp_out,
    output ssd_driver_port_an_on,
    output [6:0] ssd_driver_port_an_off
    );
    
    assign ssd_driver_port_dp_in = ssd_driver_port_dp_out;
    assign ssd_driver_port_led = ssd_driver_port_in;
    assign ssd_driver_port_an_on = 1'b0;
    assign ssd_driver_port_an_off = 7'bzzzzzzz;
    reg [6:0] ssd_driver_temp_cc;
    wire [3:0] ssd_driver_digit;
    assign ssd_driver_digit = ssd_driver_port_in;
    
    assign ssd_driver_port_cc = ssd_driver_temp_cc;
    
    always@(ssd_driver_digit)
        begin: SEG_ENC
            case(ssd_driver_digit)
                4'h0: ssd_driver_temp_cc = 7'b1000000;
                4'h1: ssd_driver_temp_cc = 7'b1111001; 
                4'h2: ssd_driver_temp_cc = 7'b0100100;  
                4'h3: ssd_driver_temp_cc = 7'b0110000; 
                4'h4: ssd_driver_temp_cc = 7'b0011001; 
                4'h5: ssd_driver_temp_cc = 7'b0010010; 
                4'h6: ssd_driver_temp_cc = 7'b0000010; 
                4'h7: ssd_driver_temp_cc = 7'b1111000; 
                4'h8: ssd_driver_temp_cc = 7'b0000000; 
                4'h9: ssd_driver_temp_cc = 7'b0011000; 
                4'hA: ssd_driver_temp_cc = 7'b0100111; 
                4'hB: ssd_driver_temp_cc = 7'b0110011; 
                4'hC: ssd_driver_temp_cc = 7'b0011101; 
                4'hD: ssd_driver_temp_cc = 7'b0010110; 
                4'hE: ssd_driver_temp_cc = 7'b0000111; 
                4'hF: ssd_driver_temp_cc = 7'b1111111; 
                
                default: ssd_driver_temp_cc = 7'bzzzzzzz; // z = open circuit for safety
            endcase
        end
    
endmodule
