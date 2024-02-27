`timescale 1ns / 1ps

module comparator(A0,A1,B0,B1,LT,GT,EQ);
    input A0,B0,A1,B1;
    output reg LT,GT,EQ;
    
    always @(A0,A1,B0,B1)
    begin
    
        GT = ({A1,A0} > {B1,B0});
        LT = ({A1,A0} < {B1,B0});
        EQ = ({A1,A0} == {B1,B0});
    end
    
    
endmodule
