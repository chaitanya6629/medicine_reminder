// ECE 6370
// Author: Chaitanya Narayanavaram, 6728.
`timescale 1ns/10ps
module MyIDVerifier2(Valid_Bit_In, D_In_Bit, ID_MissMatch_Flag, LastBitFlag, Clk, Rst);
input Valid_Bit_In, D_In_Bit;
output ID_MissMatch_Flag, LastBitFlag; 
reg ID_MissMatch_Flag, LastBitFlag;
input Clk, Rst;

parameter S_Initial=0, S_1=1, S_2=2, S_3=3, S_4=4, S_5=5, S_6=6, S_7=7,
		  S_8=8, S_9=9, S_10=10, S_11=11, S_12=12, S_13=13, S_14=14, S_15=15, S_0=16;
reg [4:0] State;

always @(posedge Clk) // Using One-Procedure
begin
if(Rst == 0)
begin
State <= S_0;
end
else
begin
case(State)
S_0: begin // This state is only for reset
		ID_MissMatch_Flag <= 0;
		LastBitFlag <= 0;
		State <= S_Initial;
		end
S_Initial: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 0)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0; // This will become 1 only in the last state
				end
			State <= S_1;
			end
			else
			begin
			State <= S_Initial;
			end
			end
S_1: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 1)
			begin
			ID_MissMatch_Flag <= 1;
			LastBitFlag <= 0;
			end
		State <= S_2;
		end
		else
			begin
			State <= S_1;
			end
		end
S_2: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 1)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0;
				end
			State <= S_3;
			end
			else
			begin
			State <= S_2;
			end
			end
S_3: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 0)
			begin
			ID_MissMatch_Flag <= 1;
			LastBitFlag <= 0;
			end
		State <= S_4;
		end
		else
			begin
			State <= S_3;
			end
		end
S_4: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 1)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0;
				end
			State <= S_5;
			end
			else
			begin
			State <= S_4;
			end
			end
S_5: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 1)
			begin
			ID_MissMatch_Flag <= 1;
			LastBitFlag <= 0;
			end
		State <= S_6;
		end
		else
			begin
			State <= S_5;
			end
		end		
S_6: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 1)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0;
				end
			State <= S_7;
			end
		else
		begin
		State <= S_6;
		end
		end
S_7: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 0)
			begin
			ID_MissMatch_Flag <= 1;
			LastBitFlag <= 0;
			end
		State <= S_8;
		end
		else
			begin
			State <= S_7;
			end
		end
S_8: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 0)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0;
				end
			State <= S_9;
			end
		else
		begin
		State <= S_8;
		end
		end
S_9: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 1)
			begin
			ID_MissMatch_Flag <= 1;
			LastBitFlag <= 0;
			end
		State <= S_10;
		end
		else
			begin
			State <= S_9;
			end
		end			
S_10: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 0)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0;
				end
			State <= S_11;
			end
			else
			begin
			State <= S_10;
			end
		end
S_11: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 0)
			begin
			ID_MissMatch_Flag <= 1;
			LastBitFlag <= 0;
			end
		State <= S_12;
		end
		else
			begin
			State <= S_11;
			end
		end
S_12: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 0)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0;
				end
			State <= S_13;
			end
			else
			begin
			State <= S_12;
			end
		end
S_13: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 0)
			begin
			ID_MissMatch_Flag <= 1;
			LastBitFlag <= 0;
			end
		State <= S_14;
		end
		else
			begin
			State <= S_13;
			end
		end
S_14: begin
			if(Valid_Bit_In == 1)
			begin
				if(D_In_Bit != 0)
				begin
				ID_MissMatch_Flag <= 1;
				LastBitFlag <= 0;
				end
			State <= S_15;
			end
			else
			begin
			State <= S_14;
			end
		end
S_15: begin
		if(Valid_Bit_In == 1)
		begin
			if(D_In_Bit != 1)
			begin
			ID_MissMatch_Flag <= 1;
			//LastBitFlag <= 1;
			end
			LastBitFlag <= 1;
		State <= S_Initial;
		end
		else
			begin
			State <= S_15;
			end
		end
default: begin
			State <= S_Initial;
			end
endcase
end
end

endmodule