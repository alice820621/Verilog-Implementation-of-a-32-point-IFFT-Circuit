//a testbench for ifft.v

module ifft_tb();

reg rst,clk,pushin;
reg [27:0] dir,dii;
wire pushout;
wire [27:0] dor,doi;

ifft a (clk,rst,pushin,dir,dii,pushout,dor,doi);

initial begin
	$dumpfile("ifft.vcd");
	$dumpvars(0, ifft_tb);
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
	#1;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h1000000;
	dii = 28'h800000;
	#2;
	pushin = 1'b1;
	dir = 28'h1000000;
	dii = 28'h1000000;
	#2;
	pushin = 1'b1;
	dir = 28'h800000;
	dii = 28'hf000000;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#2;
	pushin = 1'b1;
	dir = 28'h0;
	dii = 28'h0;
	#1
	pushin = 1'b0;
end

/*initial begin
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
end*/

initial begin
	#500;
	$finish;
end

endmodule
