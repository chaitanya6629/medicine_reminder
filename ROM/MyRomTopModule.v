`timescale 1ns/10ps
module MyRomTopModule(Clk, Rst, Enable_In, Next_Button, Select_Button, DataOut_7Seg, Selected_Address, Selected_Data);
input Clk, Rst;
input Enable_In, Next_Button, Select_Button;
output [6:0] DataOut_7Seg; // to 7 segment display
output [5:0] Selected_Address; // to Main controller (MyMedicineReminderModule)
output [3:0] Selected_Data; // to Main controller (MyMedicineReminderModule)

wire [3:0] DataWire;
wire [3:0] DataOutWire;
wire [5:0] AddressWire;

ROMController ROMController_1(Enable_In, Next_Button, Select_Button, DataWire, AddressWire, DataOutWire, Selected_Address, Selected_Data, Clk, Rst);
ROM_SIM ROM_SIM_1(AddressWire, Clk, DataWire);
MyROMDisplayModule MyROMDisplayModule_1(Enable_In, DataOutWire, DataOut_7Seg);

endmodule
