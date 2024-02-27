`timescale 1ns / 1ps

module testbench;
    reg d,clk,set,reset;
    wire q,qbar;
    integer i,j,k;
    
    dff_asynchronous DUT (q,qbar,d,set,reset,clk);
    
    always begin
    #5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        #4 for(i=0;i<2;i=i+1)
            begin
                set = i;
                for(j=0;j<2;j=j+1)  
                 begin
                    reset = j;
                    for(k=0;k<2;j=k+1)
                    begin
                       d = k;
                       #10;
                    end
                 end
            end
end
                     
endmodule
