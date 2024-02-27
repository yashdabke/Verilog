`timescale 1ns / 1ps


module dff_asynchronous(q,qbar,d,set,reset,clk);
    input d,set,reset,clk;
    output reg q;
    output qbar;
    
    assign qbar = ~q;
    
    always@ (posedge clk or negedge set or negedge reset)
        begin
          if (reset == 0) q<=0;
          else if (set == 0) q<=1;
          else q<=d;
        end
endmodule
