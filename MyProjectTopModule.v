`timescale 1ns/10ps
module MyProjectTopModule(Clk, Rst, Enter_Button, Shift_Button, FreqIn, LEDOut, GreenLed, RedLed, Passcode_7Seg_Out, Counter_7seg_Out, ROM_7seg_Out, TimeRem_7seg_Out);

input Clk, Rst, Enter_Button, Shift_Button;
input [3:0] FreqIn;
output [3:0] LEDOut, GreenLed, RedLed;
output [6:0] Passcode_7Seg_Out, Counter_7seg_Out, ROM_7seg_Out, TimeRem_7seg_Out;

wire [3:0] TimeRemIn_wire, TimeRemOut_wire;
wire En_Passcode_wire, En_ROM_wire, PassFail_Wire, W_en_Ram1_wire, W_en_Ram2_wire, R_en_Ram1_wire, R_en_Ram2_wire, Timer_En_Wire, Timer_Set_Wire, TimeOut_wire;
wire [3:0] ROM_Address_Selected_wire, ROM_Data_Selected_wire, MedID_Out_wire, Frequency_wire, Freq_Out_wire;

MyMedicineReminderModule MyMedicineReminderModule_1(Clk, Rst, Enter_Button, FreqIn, TimeRemIn_wire, PassFail_Wire, ROM_Address_Selected_wire, ROM_Data_Selected_wire,
En_Passcode_wire, En_ROM_wire, W_en_Ram1_wire, MedID_Out_wire, Frequency_wire, W_en_Ram2_wire, R_en_Ram2_wire, LEDOut, Timer_En_Wire, Timer_Set_Wire,
GreenLed, RedLed, TimeRemOut_wire, TimeOut_wire);

MyPasscodeTopModule MyPasscodeTopModule_1(En_Passcode_wire, Enter_Button, Shift_Button, Passcode_7Seg_Out, PassFail_Wire, Counter_7seg_Out, Clk, Rst);

MyRomTopModule MyRomTopModule_1(Clk, Rst, En_ROM_wire, Shift_Button, Enter_Button, ROM_7seg_Out, ROM_Address_Selected_wire, ROM_Data_Selected_wire);

RAM1_TopModule RAM1_TopModule_1(Clk, Rst, W_en_Ram1_wire, R_en_Ram1_wire, MedID_Out_wire, Frequency_wire, Freq_Out_wire);

RAM2_TopModule RAM2_TopModule_1(Clk, Rst, W_en_Ram2_wire, R_en_Ram2_wire, MedID_Out_wire, TimeRemOut_wire, TimeRemIn_wire);

TimeRemainingDisplay TimeRemainingDisplay_1(TimeRemOut_wire, TimeRem_7seg_Out);

TimerTop_Canuz_O TimerTop_Canuz_O_1(Clk, Rst, Timer_Set_Wire, Timer_En_Wire, TimeOut_wire);

endmodule