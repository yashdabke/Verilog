module tb;
reg a,b;
wire s,cout;
ha h1(a,b,s,cout);
initial
begin
a = 1'b0;
#20 b = 1'b1;
#10 a = 1'b1;
#10 b = 1'b0;
#10 b = 1'b1;
#10 a = 1'b0;

#20 $finish;
end

initial
$monitor("a=%b, b=%b, s=%b, cout=%b" , $time,a,b,s,cout);
endmodule
