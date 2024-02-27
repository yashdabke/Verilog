`timescale 1ns / 1ps


module tb();
    wire LT,GT,EQ;
    reg A0,A1,B0,B1;
    integer i,j;
    
    comparator DUT (A0,A1,B0,B1,LT,GT,EQ);
    
    initial begin
    
        for(i=0;i<=3;i=i+1)
        begin
            #1 {A1,A0} = i;
            for(j=0;j<=3;j=j+1)
                begin
                    #1 {B1,B0} = j;
                end
        end
    end
    initial begin
    #25 $finish;
    end 
endmodule
