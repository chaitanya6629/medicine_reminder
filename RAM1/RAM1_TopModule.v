`timescale 1ns/10ps
module RAM1_TopModule(Clk, Rst, Write_En, Read_En, MedIDIn, FreqIn, FreqOut);

input Clk, Rst;
input Write_En, Read_En;
input [3:0] MedIDIn;
input [3:0] FreqIn;

output [3:0] FreqOut;


wire [3:0] W_Addr_wire;
wire [7:0] W_Data_wire;
wire [3:0] R_Addr_wire;
wire [7:0] R_Data_wire;

RAM1_Controller RAM1_1(Clk, Rst, Write_En, Read_En, MedIDIn, FreqIn, W_Addr_wire, W_Data_wire, R_Addr_wire, R_Data_wire, FreqOut);
RAM1 Ram_Module(Clk, W_Data_wire, R_Addr_wire, W_Addr_wire, Write_En, R_Data_wire);

endmodule