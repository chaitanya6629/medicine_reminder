`timescale 1ns/10ps
module MyROMDisplayModule(Enable_Display, Data_In, Data_Out);
input Enable_Display;
input [3:0] Data_In;
output [6:0] Data_Out;
reg [6:0] Data_Out;

always @(Enable_Display, Data_In)
begin
if(Enable_Display == 1)
	begin
	case(Data_In)
	4'b0000 : begin
			Data_Out = 7'b1000000;
		 end
	4'b0001 : begin
			Data_Out = 7'b1111001;
		 end
	4'b0010 : begin	
			Data_Out = 7'b0100100;
		 end
	4'b0011 : begin
			Data_Out = 7'b0110000;
		 end
	4'b0100 : begin
			Data_Out = 7'b0011001;
		 end		 
	4'b0101 : begin
			Data_Out = 7'b0010010;
		 end
	4'b0110 : begin
			Data_Out = 7'b0000010;
		 end
	4'b0111 : begin
			Data_Out = 7'b1111000;
		 end
	4'b1000 : begin
			Data_Out = 7'b0000000;
		 end
	4'b1001 : begin
			Data_Out = 7'b0011000;
		 end
	4'b1010 : begin
			Data_Out = 7'b0001000;
		 end
	4'b1011 : begin
			Data_Out = 7'b0000011;
		 end
	4'b1100 : begin
			Data_Out = 7'b1000110;
		 end
	4'b1101 : begin
			Data_Out = 7'b0100001;
		 end
	4'b1110 : begin
			Data_Out = 7'b0000110;
		 end
	4'b1111 : begin
			Data_Out = 7'b1111111; // F is the end word, so all segments off
		 end
	default : begin
			Data_Out = 7'b1111111; // default -> all segments OFF 
		 end
	endcase
	end
else
	begin
	Data_Out = 7'b1111111; // all segments OFF 
	end
end

endmodule