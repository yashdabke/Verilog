module tb_fa;
  reg a, b, c;
  wire s, c_out;
  
  fulladder fa(a, b, c, s, c_out); //change to fa_ha fa(a, b, c, s, c_out); if you're using full adder using 2 half adders for testbench
  
  initial begin
    $monitor("At time %0t, a=%b ,b=%b, cin=%b, sum=%b, carry=%b",$time, a,b,c,s,c_out);
    a = 0; b = 0; c = 0; #1;
    a = 0; b = 0; c = 1; #1;
    a = 0; b = 1; c = 0; #1;
    a = 0; b = 1; c = 1; #1;
    a = 1; b = 0; c = 0; #1;
    a = 1; b = 0; c = 1; #1;
    a = 1; b = 1; c = 0; #1;
    a = 1; b = 1; c = 1;
    #20 $finish;
  end
endmodule
