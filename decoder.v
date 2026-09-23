module decoder (d,en,y);
input[2:0]d;
input en;
output[7:0]y;
reg[7:0]y;
always@(d or en)
begin 
if(en==1)
case(d)
0:y=8'b00000001;
1:y=8'b00000010;
2:y=8'b00000100;
3:y=8'b00001000;
4:y=8'b00010000;
5:y=8'b00100000;
6:y=8'b01000000;
7:y=8'b10000000;
default:y=8'b00000000;
endcase
else
y=8'b00000000;
end
endmodule
  