module ifft2_tb();

reg rst,clk;
reg [35:0] di1r,di1i,di2r,di2i;
wire [35:0] do1r,do1i,do2r,do2i;

ifft2 a (rst,clk,di1r,di1i,di2r,di2i,do1r,do1i,do2r,do2i);

initial begin
	$dumpfile("ifft2.vcd");
	$dumpvars(0, ifft2_tb);
end

initial begin
	clk = 0;
	rst = 1;
	#1 rst = 0;
end

initial	begin
	forever
	#4 clk = ~clk;
end

initial begin
	di1r = 36'h10000000;
	di1i = 36'h0;
	di2r = 36'h10000000;
	di2i = 36'h0;
	#20;
	di1r = 36'h20000000;
	di1i = 36'h10000000;
	di2r = 36'h10000000;
	di2i = 36'h10000000;
end

initial begin
	#500;
	$finish;
end

endmodule
