module TimerTop_Canuz_O(clock, rst, cfg, ena, tm_out);

input clock, rst, cfg, ena;
output tm_out;

wire wireIntclockSig, wireFlag, wireReset, wireEnable;

LFSR8_8E MyLFSR(wireReset, wireEnable, clock, wireFlag);

TimerCntl MyTmrCntl(clock, rst, cfg, ena, wireFlag, wireReset, wireEnable, tm_out);

endmodule