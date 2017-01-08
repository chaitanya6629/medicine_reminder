`timescale 1ns/10ps
module RAM2_TopModule(Clk, Rst, Write_En, Read_En, MedIDIn, TimeRemIn, TimeRemOut);

input Clk, Rst;
input Write_En, Read_En;
input [3:0] MedIDIn;
input [3:0] TimeRemIn;

output [3:0] TimeRemOut;

wire [3:0] W_Addr_wire;
wire [7:0] W_Data_wire;
wire [3:0] R_Addr_wire;
wire [7:0] R_Data_wire;

RAM2_Controller RAM2_1(Clk, Rst, Write_En, Read_En, MedIDIn, TimeRemIn, W_Addr_wire, W_Data_wire, R_Addr_wire, R_Data_wire, TimeRemOut);
RAM2 Ram_Module(Clk, W_Data_wire, R_Addr_wire, Read_En, W_Addr_wire, Write_En, R_Data_wire);

endmodule