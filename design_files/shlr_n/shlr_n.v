`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 12:46:51 PM
// Design Name: Shift Logical Right, n-bit input/output
// Module Name: shlr_n
// Project Name: 
// Target Devices: Nexys A7-100T
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: mux_nx1.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module shlr_n #(parameter SIZE = 4) (			          	//
    input sel,			                                  	//
    input [SIZE-1:0] in,			                      	//
    output [SIZE-1:0] out			                      	//
    );			                                          	//
															//
    wire [SIZE:0] in_temp;			                      	// in_temp is 1-bit longer than in
    assign in_temp = in;			                      	// Assign in to in_temp; the last bit is still unassigned
    assign in_temp[4] = 0;			                      	// Assign 0 to last bit
															//
    genvar i;			                                  	//
    generate			                                  	//
        for (i=0; i<SIZE; i=i+1)			              	//
        begin			                                  	//
            mux_nx1 #(.SIZE(2)) MUXGEN (			      	// Generate 2-to-1 muxes by setting SIZE = 2
                .mux_nx1_sel(sel),			              	// 
                .mux_nx1_in({in_temp[i+1],in_temp[i]}),		// input 0 of mux is in0, input 1 of mux is in1		
                .mux_nx1_out(out[i])			          	// If sel = 0, then there is no shift and out0 = in0
            );			                                  	// If sel = 1, then there is a 1-bit right shift, and out0 = in1
        end 			                                  	//
    endgenerate			                                  	//
endmodule			                                      	//
