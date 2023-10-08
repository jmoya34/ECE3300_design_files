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

module FAnbit_tb #(parameter SIZE_TB = 2) (             	//
    );                                                  	//
															//
    reg [SIZE_TB-1:0] PortA_nbit_tb;                    	//
    reg [SIZE_TB-1:0] PortB_nbit_tb;                    	//
    reg PortCin_nbit_tb;                                	//
    wire [SIZE_TB-1:0] PortS_nbit_tb;                   	//
    wire PortCout_nbit_tb;                              	//
															//
    FAnbit_RCA #(.SIZE(SIZE_TB)) FAGENTB (              	//
        .PortA_nbit(PortA_nbit_tb),                     	//
        .PortB_nbit(PortB_nbit_tb),                     	//
        .PortCin_nbit(PortCin_nbit_tb),                 	//
        .PortS_nbit(PortS_nbit_tb),                     	//
        .PortCout_nbit(PortCout_nbit_tb)                	//
    );                                                  	//
															//
    integer i,j,k;                                      	//
    initial                                             	//
        begin:GENTB                                     	//
            for(i=0; i<2; i=i+1)                        	// Loop only twice because PortCin can be either 0 or 1
                begin:CIN_LOOP                          	//
                    PortCin_nbit_tb = i;                	//
                    #20                                 	//
                    for(j=0; j<2**n; j=j+1)          		// SIZE_TB is n bits, so the maximum value of PortA and PortB is (2**n)-1
                        begin:PORTA_NBIT_LOOP           	// Starting from 0, you need to loop 2**n times in order to test all values of PortA and PortB
                            PortA_nbit_tb = j;          	// 
                            #20                         	// 
                            for(k=0; k<2**n; k=k+1) 		// Ex: SIZE_TB = 2 bits, so max value is (2^2)-1 = 3; 
                                begin:PORTB_NBIT_LOOP   	//   you will need to test 0,1,2,3 for both PortA and PortB
                                    PortB_nbit_tb = k;  	//
                                    #20;                	//
                                end                     	//
                        end                             	//
                end                                     	//
        #20                                             	//
        $finish;                                        	//
        end                                             	//
															//
endmodule                                               	//
