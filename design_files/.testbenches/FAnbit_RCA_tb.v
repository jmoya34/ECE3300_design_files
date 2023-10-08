`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2023 12:34:40 PM
// Design Name: 
// Module Name: FAnbit_tb
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

module FAnbit_tb #(parameter SIZE_TB = 2) (
    );
    
    reg [SIZE_TB-1:0] PortA_nbit_tb;
    reg [SIZE_TB-1:0] PortB_nbit_tb;
    reg PortCin_nbit_tb;
    wire [SIZE_TB-1:0] PortS_nbit_tb;
    wire PortCout_nbit_tb;
    
    FAnbit_RCA #(.SIZE(SIZE_TB)) FAGENTB (
        .PortA_nbit(PortA_nbit_tb),
        .PortB_nbit(PortB_nbit_tb),
        .PortCin_nbit(PortCin_nbit_tb),
        .PortS_nbit(PortS_nbit_tb),
        .PortCout_nbit(PortCout_nbit_tb)
    );
    
    integer i,j,k;
    initial
        begin:GENTB
            for(i=0; i<2; i=i+1)
                begin:CIN_LOOP
                    PortCin_nbit_tb = i;
                    #20
                    for(j=0; j<SIZE_TB**2; j=j+1)
                        begin:PORTA_NBIT_LOOP
                            PortA_nbit_tb = j;
                            #20
                            for(k=0; k<SIZE_TB**2; k=k+1)
                                begin:PORTB_NBIT_LOOP
                                    PortB_nbit_tb = k;
                                    #20;
                                end 
                        end
                end
        #20
        $finish;
        end

endmodule
