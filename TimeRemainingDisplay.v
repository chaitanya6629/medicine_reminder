`timescale 1ns/10ps
module TimeRemainingDisplay(TimeRem_In, TimeRem_7Seg_Out);
input [3:0] TimeRem_In;
output [6:0] TimeRem_7Seg_Out;
reg [6:0] TimeRem_7Seg_Out;

always @(TimeRem_In)
begin
case (TimeRem_In)
4'b0000 : begin
			TimeRem_7Seg_Out = 7'b1000000;
		 end
4'b0001 : begin
			TimeRem_7Seg_Out = 7'b1111001;
		 end
4'b0010 : begin
			TimeRem_7Seg_Out = 7'b0100100;
		 end
4'b0011 : begin
			TimeRem_7Seg_Out = 7'b0110000;
		 end
4'b0100 : begin
			TimeRem_7Seg_Out = 7'b0011001;
		 end		 
4'b0101 : begin
			TimeRem_7Seg_Out = 7'b0010010;
		 end
4'b0110 : begin
			TimeRem_7Seg_Out = 7'b0000010;
		 end
4'b0111 : begin
			TimeRem_7Seg_Out = 7'b1111000;
		 end
4'b1000 : begin
			TimeRem_7Seg_Out = 7'b0000000;
		 end
4'b1001 : begin
			TimeRem_7Seg_Out = 7'b0011000;
		 end
4'b1010 : begin
			TimeRem_7Seg_Out = 7'b0001000;
		 end
4'b1011 : begin
			TimeRem_7Seg_Out = 7'b0000011;
		 end
4'b1100 : begin
			TimeRem_7Seg_Out = 7'b1000110;
		 end
4'b1101 : begin
			TimeRem_7Seg_Out = 7'b0100001;
		 end
4'b1110 : begin
			TimeRem_7Seg_Out = 7'b0000110;
		 end
4'b1111 : begin
			TimeRem_7Seg_Out = 7'b1111111; // all segments OFF (Not 'F')
		 end
default : begin
			TimeRem_7Seg_Out = 7'b1111111; // default -> all segments OFF 
		 end
endcase
end
endmodule
