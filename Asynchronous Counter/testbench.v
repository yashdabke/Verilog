`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2024 17:41:03
// Design Name: 
// Module Name: testbench
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


module testbench();

wire [3:0] Count;
reg Clock,Reset;
counter_async_reset SUT(Clock,Reset,Count);

always #10 Clock <= ~Clock;

initial begin
    Reset = 0;
    Clock = 0;
    #10 Reset = 1;
    #20 Reset = 0;
    
    #300 $finish;
end
endmodule
