`timescale 1ns/10ps
module ROMController(Enable, NextButton, SelectButton, Data_In, Address, Data_Out, SelectedAddress, SelectedData, Clk, Rst);

input Enable, NextButton, SelectButton; // SelectButton=KEY[1], NextButton=KEY[0]
input [3:0] Data_In; 

output [5:0] Address;
reg [5:0] Address;
output [3:0] Data_Out;
reg [3:0] Data_Out;

output [5:0] SelectedAddress;
reg [5:0] SelectedAddress;
output [3:0] SelectedData;
reg [3:0] SelectedData;

input Clk, Rst;

always @(posedge Clk)
begin
if(Enable == 1)
begin
if(Rst == 0)
begin
Address <= 0;
end
else
begin
case(Address)
0,1,2,3,4,5,6,7,8,9: begin
	if(Data_In == 4'b1111) // 4'b1111 is the stop word
	begin
	Address <= 12;
	end
	else
	begin
	Data_Out <= Data_In;
	if(SelectButton == 1)
		begin
		SelectedAddress <= Address;
		SelectedData <= Data_In; // Med ID
		end
	if(NextButton == 1)
		begin
		Address <= Address + 1'b1;
		end		
	end
	end
10: begin // last+1 entry
	Address <= 0; 
	end
12: begin
	Data_Out <= 0;
	if(NextButton == 1)
		begin
		Address <= 0;
		end
	end
default: begin
			Address <= 0;
			SelectedAddress <=0;
			SelectedData <=0;
			end
endcase
end
end
else
begin
Address <= 0;
Data_Out <= 4'b1111;
end

end
endmodule