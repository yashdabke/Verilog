`timescale 1ns / 1ps


module testbench();
    reg clk,set,reset,d;
    wire q,qbar;
    
    dff_synchronous DUT (q,qbar,d,clk,set,reset);
    // Clock Generation
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        set = 0;
        reset = 0;
        d = 0;
        
        //Test case 1: Set
        #15 set = 1;
        #5 set = 0;
        
        //Test case 2: Reset
        #5 reset = 1; d = 1;
        #5 reset = 0; d = 0;
        
        //Test case 3: Both Set and Reset to be 1
        #5 set = 1; reset = 1;
        #5 set = 0; reset = 0;
        
        //Test case 4: D input
        #10 d = 1; 
        #5 d = 0;
        #5 d = 1;
        #5 d = 0;   
   end
   endmodule
