// ECE 6370
// Author: Chaitanya Narayanavaram, 6728(last 4 digits of PSID)
`timescale 1ns/10ps
module MyDecryptionModule(S_in, S_out);
input [3:0]S_in;
output [3:0]S_out;
reg [3:0]S_out;

always @(S_in)
begin
case(S_in)
4'b0000 : begin
			S_out = 4'b0101; // 0 -> 5
		 end
4'b0001 : begin
			S_out = 4'b0011; // 1 -> 3
		 end
4'b0010 : begin
			S_out = 4'b0110; // 2 -> 6
		 end
4'b0011 : begin
			S_out = 4'b0001; // 3 -> 1
		 end
4'b0100 : begin
			S_out = 4'b1001; // 4 -> 9 
		 end		 
4'b0101 : begin
			S_out = 4'b0010; // 5 -> 2
		 end
4'b0110 : begin
			S_out = 4'b1000; // 6 -> 8
		 end
4'b0111 : begin
			S_out = 4'b0000; // 7 -> 0
		 end
4'b1000 : begin
			S_out = 4'b0111; // 8 -> 7
		 end
4'b1001 : begin
			S_out = 4'b0100; // 9 -> 4
		 end
4'b1111: begin
			S_out = 4'b1111;
			end
default : begin
			S_out = 4'b1111; // default input -> F
		 end
endcase
end
endmodule
		 

		 