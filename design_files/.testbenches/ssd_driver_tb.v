`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2023 11:49:40 AM
// Design Name: 
// Module Name: ssd_driver_tb
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


module ssd_driver_tb(
    );
    
    reg [3:0] ssd_driver_port_in_tb;
    reg ssd_driver_port_dp_in_tb;
    wire [3:0] ssd_driver_port_led_tb;
    wire [6:0] ssd_driver_port_cc_tb;
    wire ssd_driver_port_dp_out_tb;
    wire ssd_driver_port_an_on_tb;
    wire [6:0] ssd_driver_port_an_off_tb;
    
    assign ssd_driver_port_an_on_tb = 1'b0;
    assign ssd_driver_port_an_off_tb = 7'bzzzzzzz;
    assign ssd_driver_port_dp_out_tb = ssd_driver_port_dp_in_tb;
    
    
    ssd_driver test (
        .ssd_driver_port_in(ssd_driver_port_in_tb),
        .ssd_driver_port_dp_in(ssd_driver_port_dp_in_tb),
        .ssd_driver_port_led(ssd_driver_port_led_tb),
        .ssd_driver_port_cc(ssd_driver_port_cc_tb),
        .ssd_driver_port_dp_out(ssd_driver_port_dp_out_tb),
        .ssd_driver_port_an_on(ssd_driver_port_an_on_tb)
    );
    
    integer i;
    initial
    begin
        ssd_driver_port_dp_in_tb = 0;
        for(i=0; i<16; i=i+1)
            begin
                ssd_driver_port_in_tb = i;
                ssd_driver_port_dp_in_tb = ~ssd_driver_port_dp_in_tb;
                #20;
            end
        #20;    
        $finish;
    end
     
endmodule
