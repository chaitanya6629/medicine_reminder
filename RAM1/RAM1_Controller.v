`timescale 1ns/10ps
module RAM1_Controller(Clk, Rst, Write_Enable, Read_Enable, MedID_In, Freq_In, Write_Address, Write_Data, Read_Address, Read_Data, Freq_Out);
input Clk, Rst;
input Write_Enable, Read_Enable;

input [3:0] MedID_In;
input [3:0] Freq_In;

output [7:0] Write_Data; 
reg [7:0] Write_Data;
output [3:0] Write_Address; // Calc here, sent to RAM1
reg [3:0] Write_Address;
output [3:0] Read_Address; // Sent to RAM1
reg [3:0] Read_Address;
output[3:0] Freq_Out;
reg [3:0] Freq_Out;

input [7:0] Read_Data;

always @(posedge Clk)
begin
if(Rst == 0)
begin
Write_Address <= 0;
Read_Address <= 0;
end
else
begin
if(Write_Enable == 1)
	begin
	Write_Address <= MedID_In;
	Write_Data <= {Freq_In,MedID_In}; // 0-3: MedID, 4-7: Freq
	
	end
else if(Read_Enable == 1)
	begin
	Read_Address <= MedID_In;
	Freq_Out <= Read_Data[7:4];
	end
else
	begin
	Write_Address <= 0;
	Read_Address <= 0;
	end
end
end
endmodule
