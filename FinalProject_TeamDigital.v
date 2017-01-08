`timescale 1ns/10ps
module FinalProject_TeamDigital(Clk, Rst, Enter_Button, Shift_Button, ToggleSwitches, T_Mode, FreqIn, LEDOut, GreenLed, RedLed, Passcode_7Seg_Out, ROM_7seg_Out, TimeRem_7seg_Out);

input Clk, Rst, Enter_Button, Shift_Button, T_Mode;
input [3:0] FreqIn, ToggleSwitches;
output [3:0] LEDOut, GreenLed, RedLed;
output [6:0] Passcode_7Seg_Out, ROM_7seg_Out, TimeRem_7seg_Out;

wire [3:0] TimeRemIn_wire, TimeRemOut_wire;
wire En_Passcode_wire, En_ROM_wire, PassFail_Wire, W_en_Ram1_wire, W_en_Ram2_wire, R_en_Ram1_wire, R_en_Ram2_wire, Timer_En_Wire, Timer_Set_Wire, TimeOut_wire;
wire [3:0] ROM_Address_Selected_wire, ROM_Data_Selected_wire, MedID_Out_wire, Frequency_wire, Freq_Out_wire;

MyMedicineReminderModule MyMedicineReminderModule_1(Clk, Rst, Enter_Button_Single_Pulse, FreqIn, TimeRemIn_wire, PassFail_Wire, ROM_Address_Selected_wire, ROM_Data_Selected_wire,
En_Passcode_wire, En_ROM_wire, W_en_Ram1_wire, MedID_Out_wire, Frequency_wire, W_en_Ram2_wire, R_en_Ram2_wire, LEDOut, Timer_En_Wire, Timer_Set_Wire,
GreenLed, RedLed, TimeRemOut_wire, TimeOut_wire, T_Mode);

MyPasscodeTopModule MyPasscodeTopModule_1(En_Passcode_wire, Enter_Button_Single_Pulse, Shift_Button, ToggleSwitches, Passcode_7Seg_Out, PassFail_Wire, Clk, Rst);

MyRomTopModule MyRomTopModule_1(Clk, Rst, En_ROM_wire, Shift_Button_Single_Pulse, Enter_Button_Single_Pulse, ROM_7seg_Out, ROM_Address_Selected_wire, ROM_Data_Selected_wire);

RAM1_TopModule RAM1_TopModule_1(Clk, Rst, W_en_Ram1_wire, R_en_Ram1_wire, MedID_Out_wire, Frequency_wire, Freq_Out_wire);

RAM2_TopModule RAM2_TopModule_1(Clk, Rst, W_en_Ram2_wire, R_en_Ram2_wire, MedID_Out_wire, TimeRemOut_wire, TimeRemIn_wire);

TimeRemainingDisplay TimeRemainingDisplay_1(TimeRemOut_wire, TimeRem_7seg_Out);

TimerTop_Canuz_O TimerTop_Canuz_O_1(Clk, Rst, Timer_Set_Wire, Timer_En_Wire, TimeOut_wire);

MyButtonShaper_Enter MyButtonShaper_Enter_1(Enter_Button, Enter_Button_Single_Pulse, Clk, Rst);

MyButtonShaper_Shift_new MyButtonShaper_Shift_1(Shift_Button, Shift_Button_Single_Pulse, Clk, Rst);

endmodule