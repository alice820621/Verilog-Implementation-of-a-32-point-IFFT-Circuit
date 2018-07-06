module fifo_tb();

reg rst,clk;
reg [28:0] dir,dii;
wire [28:0] dor,doi;

fifo a (rst,clk,dir,dii,dor,doi);

initial begin
	$dumpfile("fifo.vcd");
	$dumpvars(0, fifo_tb);
end

initial begin
	clk = 0;
	rst = 1;
	#1 rst = 0;
end

initial begin
	forever
	#1 clk = ~clk;
end

initial begin
	#4;
	dir = 28'h100000;
	dii = 28'h010000;
	#2;
	dir = 28'h200000;
	dii = 28'h020000;
	#2;
	dir = 28'h300000;
	dii = 28'h030000;
	#2;
	dir = 28'h400000;
	dii = 28'h040000;
	#2;
	dir = 28'h500000;
	dii = 28'h050000;
	#2;
	dir = 28'h600000;
	dii = 28'h060000;
	#2;
	dir = 28'h700000;
	dii = 28'h070000;
	#2;
	dir = 28'h800000;
	dii = 28'h080000;
	#2;
	dir = 28'h900000;
	dii = 28'h090000;
	#2;
	dir = 28'h1000000;
	dii = 28'h0100000;
	#2;
	dir = 28'h1100000;
	dii = 28'h0110000;
	#2;
	dir = 28'h1200000;
	dii = 28'h0120000;
	#2;
	dir = 28'h1300000;
	dii = 28'h0130000;
	#2;
	dir = 28'h1400000;
	dii = 28'h0140000;
	#2;
	dir = 28'h1500000;
	dii = 28'h0150000;
	#2;
	dir = 28'h1600000;
	dii = 28'h0160000;
	#2;
	dir = 28'h1700000;
	dii = 28'h0170000;
	#2;
	dir = 28'h1800000;
	dii = 28'h0180000;
	#2;
	dir = 28'h1900000;
	dii = 28'h0190000;
	#2;
	dir = 28'h2000000;
	dii = 28'h0200000;
	#2;
	dir = 28'h2100000;
	dii = 28'h0210000;
	#2;
	dir = 28'h2200000;
	dii = 28'h0220000;
	#2;
	dir = 28'h2300000;
	dii = 28'h0230000;
	#2;
	dir = 28'h2400000;
	dii = 28'h0240000;
	#2;
	dir = 28'h2500000;
	dii = 28'h0250000;
	#2;
	dir = 28'h2600000;
	dii = 28'h0260000;
	#2;
	dir = 28'h2700000;
	dii = 28'h0270000;
	#2;
	dir = 28'h2800000;
	dii = 28'h0280000;
	#2;
	dir = 28'h2900000;
	dii = 28'h0290000;
	#2;
	dir = 28'h3000000;
	dii = 28'h0300000;
	#2;
	dir = 28'h3100000;
	dii = 28'h0310000;
	#2;
	dir = 28'h3200000;
	dii = 28'h0320000;
end

initial begin
	#400;
	dir = 28'h1;
	dii = 28'h1;
	#2;
	dir = 28'h2;
	dii = 28'h2;
	#2;
	dir = 28'h3;
	dii = 28'h3;
	#2;
	dir = 28'h4;
	dii = 28'h4;
	#2;
	dir = 28'h5;
	dii = 28'h5;
	#2;
	dir = 28'h6;
	dii = 28'h6;
	#2;
	dir = 28'h7;
	dii = 28'h7;
	#2;
	dir = 28'h8;
	dii = 28'h8;
end

initial begin
	#500;
	$finish;
end

endmodule
