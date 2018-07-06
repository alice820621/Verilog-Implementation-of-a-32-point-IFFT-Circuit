//a testbench for bfly2.v

module bfly2_tb();

reg rst,clk;
reg [35:0] di1r,di1i,di2r,di2i;
wire [35:0] do1r,do1i,do2r,do2i;

bfly2 a(rst,clk,di1r,di1i,di2r,di2i,do1r,do1i,do2r,do2i);

initial begin
	$dumpfile("bfly2.vcd");
	$dumpvars(0, bfly2_tb);
end

initial begin
	clk = 0;
	rst = 0;
	forever
	#1 clk = ~clk;
end

initial begin
	di1r = 36'h111111111;
	di1i = 36'h222222222;
	di2r = 36'h333333333;
	di2i = 36'h444444444;
end

initial begin
	#500;
	$finish;
end

endmodule
