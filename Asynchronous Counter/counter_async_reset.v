`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 17:36:45
// Design Name: 
// Module Name: counter_async_reset
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


module counter_async_reset(Clock,Reset,Count);
    input Clock,Reset;
    output Count;
    reg [3:0] Count;
    
    initial begin
        Count<=0;
    end
    always@(posedge Clock or posedge Reset) begin
    if(Reset) Count<= 0;
    else Count <= Count + 4'd1;
    end
        
endmodule
