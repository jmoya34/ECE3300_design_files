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

module ssd_driver(                                          //
    input [3:0] ssd_driver_port_in,                         // Input is a 4 bit number, represents values from 0 to 15, or 0-9 and A-F in hex
    input ssd_driver_port_dp_in,                            // Input for controlling decimal point
    output [3:0] ssd_driver_port_led,                       // Output LEDs to represent current input value
    output [6:0] ssd_driver_port_cc,                        // Output to 7 segment
    output ssd_driver_port_dp_out,                          // Output for decimal point
    output [7:0] ssd_driver_port_an                         // Output for anode pins for 7 segments; there are 8 SSDs so 1 bit for display
    );                                                      //
															//
    assign ssd_driver_port_dp_in = ssd_driver_port_dp_out;  // Assign dp_out to dp_in
    assign ssd_driver_port_led = ssd_driver_port_in;        // Assign LEDs to input                
    assign ssd_driver_port_an = 8'bzzzzzzz0;             	// Only want the rightmost SSD to turn on; set bit 0 to 0, bits [7:1] are z
    reg [6:0] ssd_driver_temp_cc;                           // temp register for port_cc       
															//
    assign ssd_driver_port_cc = ssd_driver_temp_cc;         //
															//
    always@(ssd_driver_port_in)                             // 1 means off
        begin: SEG_ENC                                      //
            case(ssd_driver_port_in)                        //
                4'h0: ssd_driver_temp_cc = 7'b1000000;      //
                4'h1: ssd_driver_temp_cc = 7'b1111001;      //
                4'h2: ssd_driver_temp_cc = 7'b0100100;      //
                4'h3: ssd_driver_temp_cc = 7'b0110000;      //
                4'h4: ssd_driver_temp_cc = 7'b0011001;      //
                4'h5: ssd_driver_temp_cc = 7'b0010010;      //
                4'h6: ssd_driver_temp_cc = 7'b0000010;      //
                4'h7: ssd_driver_temp_cc = 7'b1111000;      //
                4'h8: ssd_driver_temp_cc = 7'b0000000;      //
                4'h9: ssd_driver_temp_cc = 7'b0011000;      //
                4'hA: ssd_driver_temp_cc = 7'b0100111;      //
                4'hB: ssd_driver_temp_cc = 7'b0110011;      //
                4'hC: ssd_driver_temp_cc = 7'b0011101;      //
                4'hD: ssd_driver_temp_cc = 7'b0010110;      //
                4'hE: ssd_driver_temp_cc = 7'b0000111;      //
                4'hF: ssd_driver_temp_cc = 7'b1111111;      //
															//
                default: ssd_driver_temp_cc = 7'bzzzzzzz; 	// Set 7seg LEDs to z/open-ckt for safety
            endcase                                         //
        end                                                 //
    
endmodule
