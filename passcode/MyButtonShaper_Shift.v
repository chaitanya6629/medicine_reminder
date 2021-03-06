// ECE 6370
// Author: Chaitanya Narayanavaram, 6728.
`timescale 1ns/10ps
module MyButtonShaper_Shift(En, Shift_in, Shift_out, Clk, Rst);
input Shift_in, En;
output Shift_out;
reg Shift_out;
input Clk, Rst;

parameter S_Off=0, S_On1=1, S_On2=2;

reg [1:0] State, StateNext;

//Comb Logic
always @(State, Shift_in, En)
begin
if(En == 1)
begin
case (State)
S_Off: begin
		Shift_out <= 0;
		if(Shift_in == 0)
		begin
		StateNext <= S_On1;
		end
		else
		begin
		StateNext <= S_Off;
		end
	   end
S_On1: begin
		Shift_out <= 1;
		if(Shift_in == 0)
		begin
		StateNext <= S_On2;
		end
		else
		begin
		StateNext <= S_Off;
		end
	   end
S_On2: begin
		Shift_out <= 0;
		if(Shift_in == 0)
		begin
		StateNext <= S_On2;
		end
		else
		begin
		StateNext <= S_Off;
		end
	   end
default: begin
		Shift_out <= 0;
		StateNext <= S_Off;
		end
endcase
end
else
begin
Shift_out <= 0;
end
end

// Statereg
always @(posedge Clk)
begin
if(Rst == 0)
begin
State <= S_Off;
end
else
begin
State <= StateNext;
end
end

endmodule
