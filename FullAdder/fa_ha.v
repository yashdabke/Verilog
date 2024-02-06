module fa_ha(
    input a,b,cin,
    output sum,carry
);

wire c,c1,s;

ha ha0(a,b,s,c);
ha ha1(cin,s,sum,c1);

assign carry = c | c1 ;

endmodule
