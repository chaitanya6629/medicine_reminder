module TimerCntl(clock, reset, set, enable, flag_in, rst_out, ena_out, time_out);

input clock, reset, set, enable, flag_in;
output rst_out, ena_out, time_out;
reg rst_out, ena_out, time_out;

parameter S_Off = 0, S_Sec = 1, S_Min = 2, S_Hour = 3;

reg [1:0] State;
reg [23:0] Cnt;
reg [5:0] CntMins;

always @(posedge clock)
	begin
	if(reset == 0)
			begin
				State <= S_Off;
				Cnt <= 0;
			end
		else
			begin
		case(State)
			S_Off:
				begin
					ena_out <= 0;
					time_out <= 0;
					rst_out <= 0;
					if( (enable == 1) && (set == 0) )
						begin
							State <= S_Sec;
							Cnt <= 0;
						end
					else if( (enable == 1) && (set == 1) )
						begin
							State <= S_Min;
							Cnt <= 0;
						end
					else
						begin
							State <= S_Off;
							Cnt <= 0;
						end
				end
			S_Sec:
				begin
					if(enable == 1)
					begin
					if(Cnt == 205000)
						begin
							ena_out <= 0;
							time_out <= 1;
							rst_out <= 1;
							State <= S_Sec;
							Cnt <= 0;
						end
					else
						begin
							if(flag_in == 1)
								begin
									ena_out <= 0;
									time_out = 0;
									rst_out <= 0;
									Cnt <= Cnt + 1;
									State <= S_Sec;
								end
							else
								begin
									ena_out <= 1;
									time_out <= 0;
									rst_out <= 1;
									State <= S_Sec;
								end
						end
						end
						else
						begin
						Cnt <= 0;
						ena_out <= 0;
						rst_out <= 0;
						State <= S_Sec;
						end
				end
			S_Min:
				begin
					if(Cnt == 12000000)
						begin
							ena_out <= 0;
							time_out <= 0;
							rst_out <= 1;
							State <= S_Hour;
							Cnt <= 0;
						end
					else
						begin
							if(flag_in == 1)
								begin
									ena_out <= 0;
									time_out <= 0;
									rst_out <= 0;
									Cnt <= Cnt + 1;
									State <= S_Min;
								end
							else
								begin
									ena_out <= 1;
									time_out <= 0;
									rst_out <= 1;
									State <= S_Min;
								end
						end
				end
			S_Hour: begin
						if(CntMins == 60)
							begin
							time_out <= 1;
							ena_out <= 0;
							rst_out <= 0;
							State <= S_Min;
							end
						else
							begin
							CntMins <= CntMins + 1;
							time_out <= 0;
							Cnt <= 0;
							State <= S_Min;
							end
					end
							
			default:
				begin
					ena_out <= 0;
					time_out <= 0;
					rst_out <= 0;
					State <= S_Off;
					Cnt <= 0;
				end
		endcase
	end
	end

endmodule