module mux(d,s,y);
input[1:0]d;
input s;
output y;
assign y = s?d[1]:d[0];
endmodule
