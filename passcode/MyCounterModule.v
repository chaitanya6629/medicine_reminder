// ECE 6370
// Author: Chaitanya Narayanavaram, 6728.
`timescale 1ns/10ps
module MyCounterModule(Count, Counter_Value, Clk, Rst);
input Count;
output [3:0]Counter_Value;
reg [3:0]Counter_Value;
input Clk, Rst;

always @(posedge Clk)
begin
if (Rst == 0)
begin
Counter_Value <= 4'b0000;
end
else if (Count == 1)
begin
Counter_Value <= Counter_Value + 1;
end
end
endmodule
