// ECE 6370
// Author: Chaitanya Narayanavaram, 6728.
`timescale 1ns/10ps
module MyPasscodeTopModule(Enable_In, Button_in, Shift_in, I, Seg7_out, Pass_Fail_Out, Clk, Rst);
input Enable_In, Button_in, Shift_in;
input [3:0]I;
input Clk, Rst;
output [6:0]Seg7_out;
output [1:0]Pass_Fail_Out;
//output [6:0] Counter_Out;

wire Reg_In_Wire, Shift_Wire, Valid_Wire, D_Bit_Wire, ID_MissMatch_Wire, LastBit_Wire, LoadWire;
wire [3:0] Dec_In_Wire;
wire [3:0] Dec_Out_Wire;
//wire [3:0] Counter_Wire;

MyButtonShaper ButtonShaper_1(Enable_In, Button_in, Reg_In_Wire, Clk, Rst);
MyRegister Register_1(Enable_In, Reg_In_Wire, I, Dec_In_Wire, LoadWire, Clk, Rst);
MyDecryptionModule Decoder_1(Dec_In_Wire, Dec_Out_Wire);
MySevenSegmentDisplayModule Display_1(Dec_Out_Wire, Seg7_out);
MyButtonShaper_Shift ButtonShaper_2(Enable_In, Shift_in, Shift_Wire, Clk, Rst);
MyShiftRegister ShiftRegister_1(Enable_In, Dec_Out_Wire, D_Bit_Wire, Valid_Wire, Shift_Wire, LoadWire, Clk, Rst);
MyIDVerifier2 IDVerifier_1(Valid_Wire, D_Bit_Wire, ID_MissMatch_Wire, LastBit_Wire, Clk, Rst);
MyPassFailDecoder PassFailDecoder_1(ID_MissMatch_Wire, LastBit_Wire, Pass_Fail_Out);
//MyCounterModule Counter_1(Reg_In_Wire, Counter_Wire, Clk, Rst);
//MyDigitCounterDecoder DigitCounterDecoder_1(Counter_Wire, Counter_Out);

endmodule