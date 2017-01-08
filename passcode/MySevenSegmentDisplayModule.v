// ECE 6370
// Author: Chaitanya Narayanavaram, 6728(last 4 digits of PSID)
`timescale 1ns/10ps
module MySevenSegmentDisplayModule(Seg7_in, Seg7_out);
input [3:0]Seg7_in;
output [6:0]Seg7_out;
reg [6:0]Seg7_out;

always @(Seg7_in)
begin
case (Seg7_in)
4'b0000 : begin
			Seg7_out = 7'b1000000;
		 end
4'b0001 : begin
			Seg7_out = 7'b1111001;
		 end
4'b0010 : begin
			Seg7_out = 7'b0100100;
		 end
4'b0011 : begin
			Seg7_out = 7'b0110000;
		 end
4'b0100 : begin
			Seg7_out = 7'b0011001;
		 end		 
4'b0101 : begin
			Seg7_out = 7'b0010010;
		 end
4'b0110 : begin
			Seg7_out = 7'b0000010;
		 end
4'b0111 : begin
			Seg7_out = 7'b1111000;
		 end
4'b1000 : begin
			Seg7_out = 7'b0000000;
		 end
4'b1001 : begin
			Seg7_out = 7'b0011000;
		 end
4'b1010 : begin
			Seg7_out = 7'b0001000;
		 end
4'b1011 : begin
			Seg7_out = 7'b0000011;
		 end
4'b1100 : begin
			Seg7_out = 7'b1000110;
		 end
4'b1101 : begin
			Seg7_out = 7'b0100001;
		 end
4'b1110 : begin
			Seg7_out = 7'b0000110;
		 end
4'b1111 : begin
			Seg7_out = 7'b1111111; //all segments OFF
		 end
default : begin
			Seg7_out = 7'b1111111; // default -> all segments OFF 
		 end
endcase
end
endmodule
	