`timescale 1 ns/1 ns

module Timer_tb();

reg Clk_s, Rst_s, Cfg_s, Ena_s;
wire [0:0] Tm_out_s;

TimerTop_Canuz_O CompToTest(Clk_s, Rst_s, Cfg_s, Ena_s, Tm_out_s);

// Clock Procedure
always
	begin
		Clk_s <= 0;
		#10;
		Clk_s <= 1;
		#10;
	end

// Vector Procedure
initial
	begin
		Rst_s <= 0;
		Cfg_s <= 0;
		Ena_s <= 0;
		@(posedge Clk_s);
		#1000000 Rst_s <= 1;
		@(posedge Clk_s);
		#1000000 Cfg_s <= 0; Ena_s <= 1;
		@(posedge Clk_s);
		#1015000000 Cfg_s <= 0; Ena_s <= 0;
		@(posedge Clk_s);
		#1000000 Rst_s <= 0;
		@(posedge Clk_s);
		#1000000 Rst_s <= 1;
		@(posedge Clk_s);
		@(posedge Clk_s);
		@(posedge Clk_s);
	end

endmodule