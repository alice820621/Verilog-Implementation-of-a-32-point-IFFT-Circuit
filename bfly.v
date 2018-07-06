//sub-module, an adder and subtractor for the butterfly structure

module bfly2(rst,clk,di1r,di1i,di2r,di2i,do1r,do1i,do2r,do2i);

input rst,clk;
input [35:0] di1r,di1i,di2r,di2i;
output [35:0] do1r,do1i,do2r,do2i;

reg [35:0] do1r_,do1i_,do2r_,do2i_;

assign do1r = do1r_;
assign do1i = do1i_;
assign do2r = do2r_;
assign do2i = do2i_;

always @(*) begin
	do1r_ = di1r + di2r;
	do1i_ = di1i + di2i;
	do2r_ = di1r - di2r;
	do2i_ = di1i - di2i;
end



endmodule
