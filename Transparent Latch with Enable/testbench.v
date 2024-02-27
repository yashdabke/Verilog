`timescale 1ns / 1ps


module testbench();

reg D,En;
wire Q,Qbar;

transparent_latch DUT (Q,Qbar,D,En);
    initial begin
        D <= 0;
        En <= 0;
    end
    initial begin
        #5 En = 0; D = 0;
        #5 En = 0; D = 1;
        #5 En = 1; D = 0;
        #5 En = 1; D = 1;
        #5 En = 0; D = 0;
        #5 $finish;
    end

endmodule
