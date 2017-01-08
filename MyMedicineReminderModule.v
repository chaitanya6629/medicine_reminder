`timescale 1ns / 10ps

module MyMedicineReminderModule(Clk, Rst, EnterButton, Freq_In, TimeRem_From_Ram, Pass_Fail, ROM_Address_Selected, ROM_Data_Selected, EnablePasscode, EnableROM,
	W_en_Ram1, MedID_Out, Frequency, W_en_Ram2, R_en_Ram2, LED_Out, Timer_Enable, Timer_Set, Passcode_LED_Green, Passcode_LED_Red, Time_Rem_to_Ram, Time_Out, TimerMode);

input Clk, Rst;
input EnterButton; // Key[0]
input Pass_Fail; // input from Passcode module (P/F)
input [3:0] Freq_In; // input from toggle switches
input Time_Out;
input TimerMode;

input [5:0] ROM_Address_Selected; // ROM Addrerss of the MEdID 
input [3:0] ROM_Data_Selected; // This is the Med ID

input [3:0] TimeRem_From_Ram; // input from RAM(read-data)

output EnablePasscode; // Start passcode process
reg EnablePasscode;
output [3:0] Passcode_LED_Green;
reg [3:0] Passcode_LED_Green;
output [3:0] Passcode_LED_Red;
reg [3:0] Passcode_LED_Red;
output EnableROM;
reg EnableROM;

output [3:0] MedID_Out;
reg [3:0] MedID_Out;
output [3:0] Frequency;
reg [3:0] Frequency;
output [3:0] Time_Rem_to_Ram;
reg [3:0] TimeRem_Reg;

output W_en_Ram1;
reg W_en_Ram1;
output W_en_Ram2;
reg W_en_Ram2;
output R_en_Ram2;
reg R_en_Ram2;

output Timer_Enable;// To enable the Timer module
reg Timer_Enable;
output Timer_Set; // if 0: timeout after 1 sec; if 1: timeout after 1 min
reg Timer_Set;


output [3:0] LED_Out; // ALARM: to blink LED lights
reg [3:0] LED_Out;


reg [2:0] State;
parameter S_Off = 0, S_Passcode = 1, S_ROM = 2, S_FrequencyInput = 3, S_RAM1 = 4, S_RAM2 = 5, S_Monitor = 6, S_TimeDisplay = 7; 

always @(posedge Clk) // 1 procedure
begin
if(Rst == 0)
	begin
	LED_Out <= 4'b0000;
	TimeRem_Reg <= 4'b1111; // all 7 segments off
	EnablePasscode <= 0;
	EnableROM <= 0;
	State <= S_Off;
	
	end
else
	begin
	case(State)
	S_Off: begin
			if(EnterButton == 1)
				begin
				State <= S_Passcode;
				end
			else
				begin
				State <= S_Off;
				end
			end
	S_Passcode: begin
				EnablePasscode <= 1;
				if(Pass_Fail == 2'b01) // 01 = Pass
					begin // Start input process
					Passcode_LED_Green <= 4'b1111;
					State <= S_ROM;
					end
				else if(Pass_Fail == 2'b10) // 10 = Fail
					begin
					Passcode_LED_Red <= 4'b1111;
					State <= S_Passcode;
					end
				else                      // other
					begin
					Passcode_LED_Green <= 4'b0000;
					Passcode_LED_Red <= 4'b0000;
					State <= S_Passcode;
					end
				end
	S_ROM: begin
				EnableROM <= 1;
				if(ROM_Address_Selected !=0)
					begin
					State <= S_FrequencyInput;
					EnableROM <=0;
					end
				else
					begin
					State <= S_ROM;
					end
			end
	S_FrequencyInput: begin
						if(EnterButton == 1)
							begin
							Frequency <= Freq_In;
							State <= S_RAM1;
							end
						else
							begin
							Frequency <= 0;
							State <= S_FrequencyInput;
							end
					end
	S_RAM1: begin
				W_en_Ram1 <= 1;
				MedID_Out <= ROM_Data_Selected;
				State <= S_RAM2;
			end
	S_RAM2: begin
				W_en_Ram2 <= 1;				
				TimeRem_Reg <= 24/Frequency;
				Timer_Enable <= 1;
				if(TimerMode == 1)
					begin
					Timer_Set <= 1;
					end
				else
					begin
					Timer_Set <= 0;
					end
				State <= S_Monitor;
			end
	S_Monitor: begin
					R_en_Ram2 <=1;					
					if(TimeRem_Reg != 0)
					begin
						if(Time_Out == 1)
							begin
							TimeRem_Reg <= TimeRem_Reg - 1;
							W_en_Ram2 <= 1;
							MedID_Out <= ROM_Data_Selected;
							State <= S_TimeDisplay;
							end
							else 
							begin
							W_en_Ram2 <= 0;
							State <= S_Monitor;
							end
					end
						
					else if(TimeRem_Reg == 0)
					begin
						TimeRem_Reg <= 24/Frequency;
						State <= S_TimeDisplay;
					end
					else
					begin
						State <= S_Monitor;
					end
					
				end
	S_TimeDisplay: begin
						if(TimeRem_Reg == 0)
							begin
							LED_Out <= 4'b1111; // ALARM
							if(Time_Out == 1)
							begin
							State <= S_Monitor;
							end
							else
							begin
							State <= S_TimeDisplay;
							end
							end
						else
							begin
							LED_Out <= 4'b0000;
							State <= S_Monitor;
							end
					end
	default: begin
				State <= S_Off;
			end
	endcase
				
	end // end of else
	end // end of always block
	
	assign Time_Rem_to_Ram = TimeRem_Reg;
	
	endmodule
	