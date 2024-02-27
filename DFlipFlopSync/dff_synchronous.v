`timescale 1ns / 1ps

module dff_synchronous(q,qbar,d,clk,set,reset);
    input clk,set,reset,d;
    output q,qbar;
    reg q;
    
    assign qbar = ~q;
    
    always@(posedge clk)
    begin
        if(set) begin q<=1'b1; end
        else if(reset) begin q<=1'b0; end
        else begin q<=d; end
end
endmodule
