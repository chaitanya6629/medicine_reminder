`timescale 1ns/10ps
module MyDigitCounterDecoder(Counter_Value, Counter_Out);
input [3:0] Counter_Value;
output [6:0] Counter_Out;
reg [6:0] Counter_Out;

always @(Counter_Value)
begin
case(Counter_Value)
4'b0000: begin
			Counter_Out = 7'b1000000; // Display 0 if count value is 0
			end
4'b0001: begin
			Counter_Out = 7'b1111001; // Display 1 if count value is 1
		 end
4'b0010 : begin
			Counter_Out = 7'b0100100; // Display 2 if count value is 2
		 end
4'b0011 : begin
			Counter_Out = 7'b0110000; // Display 3 if count value is 3
		 end
4'b0100 : begin
			Counter_Out = 7'b0011001; // Display 4 if count value is 4
		 end		 
default: begin
			Counter_Out = 7'b0001110; // Display F if default value
			end
endcase

end
endmodule
