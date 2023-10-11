`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2023 01:18:48 PM
// Design Name: 
// Module Name: HA_tb
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


module HA_tb(
    );
    
    reg Port_A;
    reg Port_B;
    wire Port_S;
    wire Port_C;
    
    HA HA_test (
        .A(Port_A),
        .B(Port_B),
        .S(Port_S),
        .C(Port_C)
    );
    
    initial
        begin: TST
        Port_A = 0;
        Port_B = 0;
        #20
        Port_A = 1;
        #20
        Port_A = 0;
        Port_B = 1;
        #20
        Port_A = 1;
        #40 $finish;
    end
    
endmodule
