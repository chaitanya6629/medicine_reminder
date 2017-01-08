// ECE 6370
// Author: Chaitanya Narayanavaram, 6728.
`timescale 1ns/10ps
module MyRegister(En,Reg_in,I,Q,LoadToShiftRegister,Clk,Rst);
input Reg_in, En;
input [3:0] I;
output [3:0] Q;
output LoadToShiftRegister;
reg LoadToShiftRegister;
reg [3:0] Q;
input Clk, Rst;

always @(posedge Clk)
begin
if(En == 1)
begin
if(Rst == 0)
begin
Q <= 4'b0111;
end
else if(Reg_in == 1)
begin
Q <= I;
LoadToShiftRegister <= 1;
end
else
begin
LoadToShiftRegister <= 0;
end
end
else
begin
Q <= 4'b1111;
LoadToShiftRegister <= 0;
end
end
endmodule