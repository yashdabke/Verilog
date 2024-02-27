`timescale 1ns / 1ps

//Transparent Latch with Enable
module transparent_latch(Q,Qbar,D,En);
    input D,En;
    output reg Q;
    output Qbar;
        assign Qbar = ~Q;
        always @(D or En) begin
            if (En) Q = D;
        end
endmodule
