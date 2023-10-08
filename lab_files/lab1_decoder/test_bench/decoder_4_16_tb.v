`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2023 05:59:23 PM
// Design Name: 
// Module Name: decoder_4_16_tb
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


module decoder_4_16_tb();
    reg Port_X0;
    reg Port_X1;
    reg Port_X2;
    reg Port_X3;
    reg Enable;
    wire [3:0] Port_D0;
    wire [3:0] Port_D1;
    wire [3:0] Port_D2;
    wire [3:0] Port_D3;
    
    decoder_4_16 DECODERTB(
        .port_x0(Port_X0),
        .port_x1(Port_X1),
        .port_x2(Port_X2),
        .port_x3(Port_X3),
        .port_E(Enable),
        .port_d0(Port_D0),
        .port_d1(Port_D1),
        .port_d2(Port_D2),
        .port_d3(Port_D3)
    ); 
    
    integer i, j, k, l, m;
    initial
        begin: Decoder_4_to_16
            for(i = 0; i < 2; i = i + 1)
                begin: Ebit
                Enable = i;
                #20
                for(j = 0; j < 2; j = j + 1)
                    begin: X0bit
                    Port_X0 = j;
                    #20
                    for(k = 0; k < 2; k = k + 1)
                        begin: X1bit
                        Port_X1 = k;
                        #20
                        for(l = 0; l < 2; l = l + 1)
                            begin: X2bit
                            Port_X2 = l;
                            #20
                            for(m = 0; m < 2; m = m + 1)
                                begin: X3bit
                                Port_X3 = m;
                                #20;
                            end
                        end
                    end
                end
            end
        #20
        $finish;
        end 
                   
                    
                    
                    
    
endmodule
