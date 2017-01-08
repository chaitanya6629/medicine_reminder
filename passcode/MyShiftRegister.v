// ECE 6370
// Author: Chaitanya Narayanavaram, 6728.
`timescale 1ns/10ps
module MyShiftRegister(En, I, D_Out_Bit, Valid_Bit_Out, Shift, Ld, Clk, Rst);
input [3:0] I;
output Valid_Bit_Out, D_Out_Bit;
reg Valid_Bit_Out, D_Out_Bit;
input Shift, Ld, En;
input Clk, Rst;

reg [3:0] R;

always @(posedge Clk)
begin
if(En == 1)
begin
if(Rst == 0)
begin
R <= 4'b0000;
Valid_Bit_Out <= 1'b0;
end
else if(Ld == 1)
begin
R <= I;
Valid_Bit_Out <= 1'b0;
end
else if(Shift == 1)
begin
R[3] <= 1'b0;
R[2] <= R[3];
R[1] <= R[2];
R[0] <= R[1];
D_Out_Bit <= R[0];
Valid_Bit_Out <= 1'b1;
end
else
begin
Valid_Bit_Out <= 1'b0;
end
end
else
begin
Valid_Bit_Out <= 1'b0;
end
end

endmodule