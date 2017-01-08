// ECE 6370
// Author: Chaitanya Narayanavaram, 6728.
`timescale 1ns/10ps
module MyPassFailDecoder(ID_MissMatch_Flag_In, LastBitFlag_In, Pass_Fail_Out);
input ID_MissMatch_Flag_In, LastBitFlag_In;
output [1:0] Pass_Fail_Out;
reg [1:0] Pass_Fail_Out;

always @(ID_MissMatch_Flag_In)
begin
if(LastBitFlag_In == 1)
begin
	if(ID_MissMatch_Flag_In ==1)
	begin
	Pass_Fail_Out = 2'b10; // Output Fail to Main controller
	end
	else
	begin
	Pass_Fail_Out = 2'b01; // Output PASS to main controller
	end
	end
else
begin
Pass_Fail_Out = 2'b00; 
end
end

endmodule
