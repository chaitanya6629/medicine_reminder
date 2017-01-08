`timescale 1ns/10ps
module MyButtonShaper(En, Button_in, Button_out, Clk, Rst);
input Button_in, En;
output Button_out;
reg Button_out;
input Clk, Rst;

parameter S_Off=0, S_On1=1, S_On2=2;

reg [1:0] State, StateNext;

//Comb Logic
always @(State, Button_in, En)
begin
if(En == 1)
begin
case (State)
S_Off: begin
		Button_out <= 0;
		if(Button_in == 0)
		begin
		StateNext <= S_On1;
		end
		else
		begin
		StateNext <= S_Off;
		end
	   end
S_On1: begin
		Button_out <= 1;
		if(Button_in == 0)
		begin
		StateNext <= S_On2;
		end
		else
		begin
		StateNext <= S_Off;
		end
	   end
S_On2: begin
		Button_out <= 0;
		if(Button_in == 0)
		begin
		StateNext <= S_On2;
		end
		else
		begin
		StateNext <= S_Off;
		end
	   end
default: begin
		Button_out <= 0;
		StateNext <= S_Off;
		end
endcase
end
else
begin
Button_out <= 0;
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
