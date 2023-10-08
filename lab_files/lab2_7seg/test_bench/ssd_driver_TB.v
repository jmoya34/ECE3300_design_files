`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2023 07:08:21 PM
// Design Name: 
// Module Name: ssd_driver_TB
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


module ssd_driver_TB(
                    );
                    reg [3:0] ssd_driver_port_inp_tb;
                    reg ssd_driver_portin_dp_tb;
                    wire [3:0] ssd_driver_port_led_tb;
                    wire [6:0] ssd_driver_output_cc_tb;
                    wire ssd_driver_port_dp_tb;
                    wire [7:0] ssd_driver_output_an_tb;
                    
                    ssd_driver SD1(
                                    .ssd_driver_port_inp(ssd_driver_port_inp_tb),
                                    .ssd_driver_portin_dp(ssd_driver_portin_dp_tb),
                                    .ssd_driver_port_led(ssd_driver_port_led_tb),
                                    .ssd_driver_output_cc(ssd_driver_output_cc_tb),
                                    .ssd_driver_port_dp(ssd_driver_port_dp_tb),
                                    .ssd_driver_output_an(ssd_driver_output_an_tb),
                                    );
                    integer i;
                    initial 
                    begin   
                        ssd_driver_port_inp_tb = 4'h0000;
                        ssd_driver_portin_dp_tb = 0;
                        for(i = 0; i < 16; i = i + 1)
                        begin
                            #20 
                            ssd_driver_port_inp_tb = i;
                        end
                        #20
                        $finish;
                    end
endmodule
