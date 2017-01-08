`timescale 1ns/10ps
module MyROMTestbench();
wire [3:0] Data_s;
reg Clk_s, Rst_s;

MyRomTopModule DUT_MyRomTopModule(Clk_s, Rst_s, Data_s);

always
begin
Clk_s = 0;
#10;
Clk_s = 1; 
#10;
end 

initial
begin
#3 Rst_s <= 0;
@(posedge Clk_s);
#3 Rst_s <= 1;
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
@(posedge Clk_s);
end
endmodule
