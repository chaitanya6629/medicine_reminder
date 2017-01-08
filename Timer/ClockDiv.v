module ClockDiv(clock, reset, clock_out);
 
input clock;
input reset;
output clock_out;
 
reg [15:0] Cnt;
wire [15:0] wireCnt;
reg int_clk;
 
always @(posedge clock)
	begin
		if (reset == 0)
			begin
				Cnt <= 0;
				int_clk <= clock;
			end
		else if (wireCnt == 25000)
			begin
				Cnt <= 0;
				int_clk <= ~int_clk;
			end
		else
			begin
				Cnt <= wireCnt;
			end
	end

assign wireCnt = Cnt + 1;
assign clock_out = int_clk;

endmodule