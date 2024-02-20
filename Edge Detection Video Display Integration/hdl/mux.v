`timescale 1ns / 1ps

module mux(
input  i_cntrl,
input [23:0] i_data,
output [23:0] o_data
    );
    
assign o_data = (i_cntrl == 1)? i_data : 24'h000000;    
    
endmodule
