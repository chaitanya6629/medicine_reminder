module LFSR8_8E(reset, enable, clock, flag);
input reset, enable, clock;
output flag;
reg flag;

reg [7:0] LFSR;

always @(posedge clock)
	begin
		if(reset == 0)
			begin
				LFSR[7:0] <= 8'h0;
				flag <= 0;
			end
		else if( (LFSR == 8'h78) && (enable == 1) )
			begin
				LFSR[7:0] <= 8'h0;
				flag <= 1;
			end
		else if(enable == 1)
			begin
				LFSR[0] <= ~LFSR[1] ^ LFSR[2] ^ LFSR[3] ^ LFSR[7];
				LFSR[7:1] <= LFSR[6:0];
				flag <= 0;
			end
		else
			begin
				LFSR[7:0] <= 8'h0;
				flag <= 0;
			end
	end

endmodule