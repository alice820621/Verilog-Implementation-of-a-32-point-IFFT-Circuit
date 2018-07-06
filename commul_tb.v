//a testbench for commul.v

module commul_tb();

reg rst,clk;
reg [35:0] dir,dii;
reg [6:0] twsel;
wire [35:0] dor,doi;

commul a (rst,clk,dir,dii,twsel,dor,doi);

initial begin
	$dumpfile("commul.vcd");
	$dumpvars(0, commul_tb);
end

initial begin
	clk = 0;
	rst = 0;
	forever
	#1 clk = ~clk;
end

initial begin
	dir = 36'h10000000;
	dii = 36'b0;
	twsel = 5'd0;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
	#2 twsel = twsel+1;
end

initial begin
	#500;
	$finish;
end

endmodule
