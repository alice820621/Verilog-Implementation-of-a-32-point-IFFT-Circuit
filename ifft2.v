//sub-module, collecting signals from bfly.v and commul.v

module ifft2(rst,clk,twsel,di1r,di1i,di2r,di2i,do1r,do1i,do2r,do2i);

input rst,clk;
input [6:0] twsel;
input [35:0] di1r,di1i,di2r,di2i;
output [35:0] do1r,do1i,do2r,do2i;

reg [35:0] di1r_,di1i_,di2r_,di2i_,do1r_,do1i_,do2r_,do2i_,ci1r,ci1i,ci2r,ci2i;
reg [35:0] do1rp,do1ip,do1rpp,do1ipp,do1rppp,do1ippp,do1rpppp,do1ipppp;
wire [35:0] bo1r,bo1i,bo2r,bo2i,co2r,co2i;
reg [6:0] twsel1,twsel2,twsel3;

bfly2 a (rst,clk,di1r,di1i,di2r,di2i,bo1r,bo1i,bo2r,bo2i);
commul b (rst,clk,bo2r,bo2i,twsel1,co2r,co2i);

assign do1r = do1r_;
assign do1i = do1i_;
assign do2r = do2r_;
assign do2i = do2i_;

always @(posedge(clk) or posedge(rst)) begin
    if(rst) begin
//        di1r_ <= 0;
//        di1i_ <= 0;
//        di2r_ <= 0;
//        di2i_ <= 0;
	ci1r <= 0;
	ci1i <= 0;
	ci2r <= 0;
	ci2i <= 0;
	do1r_ <= 0;
	do1i_ <= 0;
	do2r_ <= 0;
	do2i_ <= 0;
        twsel1 <= 0;
	twsel2 <= 0;
    end else begin
//        di1r_ <= di1r;
//        di1i_ <= di1i;
//        di2r_ <= di2r;
//        di2i_ <= di2i;
//	ci1r <= bo1r;
//	ci1i <= bo1i;
//	ci2r <= bo2r;
//	ci2i <= bo2i;
	do1rp <= #1 bo1r;
	do1ip <= #1 bo1i;
	do1rpp <= #1 do1rp;
	do1ipp <= #1 do1ip;
	do1rppp <= #1 do1rpp;
	do1ippp <= #1 do1ipp;
	do1rpppp <= do1rppp;
	do1ipppp <= do1ippp;
	do1r_ <= #1 do1rpppp;
	do1i_ <= #1 do1ipppp;
	do2r_ <= #1 co2r;
	do2i_ <= #1 co2i;
	twsel1 <= #1 twsel;
//        twsel2 <= twsel1;
//	twsel3 <= twsel2;
    end
end



endmodule
