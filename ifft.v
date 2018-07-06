//top module, a 32-point IFFT with 4-bit integer and 24-bit decimal real and image input/output

module ifft (clk,rst,pushin,dir,dii,pushout,dor,doi);

input rst,clk,pushin;
input [27:0] dir,dii;
output pushout;
output [27:0] dor,doi;

reg pushout_,pushin_;
reg [27:0] dor_,doi_;
reg [35:0] mr0,mr1,mr2,mr3,mr4,mr5,mr6,mr7,mr8,mr9,mr10,mr11,mr12,mr13,mr14,mr15;
reg [35:0] mr16,mr17,mr18,mr19,mr20,mr21,mr22,mr23,mr24,mr25,mr26,mr27,mr28,mr29,mr30,mr31;
reg [35:0] mi0,mi1,mi2,mi3,mi4,mi5,mi6,mi7,mi8,mi9,mi10,mi11,mi12,mi13,mi14,mi15;
reg [35:0] mi16,mi17,mi18,mi19,mi20,mi21,mi22,mi23,mi24,mi25,mi26,mi27,mi28,mi29,mi30,mi31;

reg [5:0] n,go;
reg [7:0] compcount;
reg [6:0] twsel,twsel_;
reg signr,signi;
reg a,b,c,d,e,f,g,h,i,j,k,l,m,p,q;
reg [3:0] a5,b5,c5,d5,e5,f5,g5,h5,i5,j5,k5,l5,m5,p5,q5;
reg start;

reg [35:0] sr0,sr1,sr2,sr3,sr4,sr5,sr6,sr7,sr8,sr9,sr10,sr11,sr12,sr13,sr14,sr15;
reg [35:0] sr16,sr17,sr18,sr19,sr20,sr21,sr22,sr23,sr24,sr25,sr26,sr27,sr28,sr29,sr30,sr31;
reg [35:0] si0,si1,si2,si3,si4,si5,si6,si7,si8,si9,si10,si11,si12,si13,si14,si15;
reg [35:0] si16,si17,si18,si19,si20,si21,si22,si23,si24,si25,si26,si27,si28,si29,si30,si31;
//reg [35:0] mo16,mo17,mo18,mo19,mo20,mo21,mo22,mo23,mo24,mo25,mo26,mo27,mo28,mo29,mo30,mo31;
reg [35:0] di1r,di1i,di2r,di2i;
reg [35:0] do1r_,do1i_,do2r_,do2i_;
wire [35:0] do1r,do1i,do2r,do2i;

ifft2 i2 (rst,clk,twsel,di1r,di1i,di2r,di2i,do1r,do1i,do2r,do2i);

assign pushout = pushout_;
assign dor = dor_;
assign doi = doi_;

/*always @(*) begin
	if (pushin) go = 5'b11111;
	else go = 5'b0;
end*/

always @(posedge(clk)) begin
	if (pushin & n<32) n <= #1 n + 1;
	else if (~pushin) n <= #1 n;
	else n <= #1 n;
end

always @(posedge(clk)) begin
	if (a) begin
		if (a5 < 5) a5 <= #1 a5 + 1;
		else begin
			sr0  <= #1 do1r;
			si0  <= #1 do1i;
			sr16 <= #1 do2r;
			si16 <= #1 do2i;
			a <= #1 0;
			a5 <= #1 0;
			end
	end
	else a5 <= #1 a5;
	if (b) begin
		if (b5 < 5) b5 <= #1 b5 + 1;
		else begin
			sr1  <= #1 do1r;
			si1  <= #1 do1i;
			sr17 <= #1 do2r;
			si17 <= #1 do2i;
			b <= #1 0;
			b5 <= #1 0;
			end
	end
	else b5 <= #1 b5;
	if (c) begin
		if (c5 < 5) c5 <= #1 c5 + 1;
		else begin
			sr2  <= #1 do1r;
			si2  <= #1 do1i;
			sr18 <= #1 do2r;
			si18 <= #1 do2i;
			c <= #1 0;
			c5 <= #1 0;
			end
	end
	else c5 <= #1 c5;
	if (d) begin
		if (d5 < 5) d5 <= #1 d5 + 1;
		else begin
			sr3  <= #1 do1r;
			si3  <= #1 do1i;
			sr19 <= #1 do2r;
			si19 <= #1 do2i;
			d <= #1 0;
			d5 <= #1 0;
			end
	end
	else d5 <= #1 d5;
	if (e) begin
		if (e5 < 5) e5 <= #1 e5 + 1;
		else begin
			sr4  <= #1 do1r;
			si4  <= #1 do1i;
			sr20 <= #1 do2r;
			si20 <= #1 do2i;
			e <= #1 0;
			e5 <= #1 0;
			end
	end
	else e5 <= #1 e5;
	if (f) begin
		if (f5 < 5) f5 <= #1 f5 + 1;
		else begin
			sr5  <= #1 do1r;
			si5  <= #1 do1i;
			sr21 <= #1 do2r;
			si21 <= #1 do2i;
			f <= #1 0;
			f5 <= #1 0;
			end
	end
	else f5 <= #1 f5;
	if (g) begin
		if (g5 < 5) g5 <= #1 g5 + 1;
		else begin
			sr6  <= #1 do1r;
			si6  <= #1 do1i;
			sr22 <= #1 do2r;
			si22 <= #1 do2i;
			g <= #1 0;
			g5 <= #1 0;
			end
	end
	else g5 <= #1 g5;
	if (h) begin
		if (h5 < 5) h5 <= #1 h5 + 1;
		else begin
			sr7  <= #1 do1r;
			si7  <= #1 do1i;
			sr23 <= #1 do2r;
			si23 <= #1 do2i;
			h <= #1 0;
			h5 <= #1 0;
			end
	end
	else h5 <= #1 h5;
	if (i) begin
		if (i5 < 5) i5 <= #1 i5 + 1;
		else begin
			sr8  <= #1 do1r;
			si8  <= #1 do1i;
			sr24 <= #1 do2r;
			si24 <= #1 do2i;
			i <= #1 0;
			i5 <= #1 0;
			end
	end
	else i5 <= #1 i5;
	if (j) begin
		if (j5 < 5) j5 <= #1 j5 + 1;
		else begin
			sr9  <= #1 do1r;
			si9  <= #1 do1i;
			sr25 <= #1 do2r;
			si25 <= #1 do2i;
			j <= #1 0;
			j5 <= #1 0;
			end
	end
	else j5 <= #1 j5;
	if (k) begin
		if (k5 < 5) k5 <= #1 k5 + 1;
		else begin
			sr10 <= #1 do1r;
			si10 <= #1 do1i;
			sr26 <= #1 do2r;
			si26 <= #1 do2i;
			k <= #1 0;
			k5 <= #1 0;
			end
	end
	else k5 <= #1 k5;
	if (l) begin
		if (l5 < 5) l5 <= #1 l5 + 1;
		else begin
			sr11 <= #1 do1r;
			si11 <= #1 do1i;
			sr27 <= #1 do2r;
			si27 <= #1 do2i;
			l <= #1 0;
			l5 <= #1 0;
			end
	end
	else l5 <= #1 l5;
	if (m) begin
		if (m5 < 5) m5 <= #1 m5 + 1;
		else begin
			sr12 <= #1 do1r;
			si12 <= #1 do1i;
			sr28 <= #1 do2r;
			si28 <= #1 do2i;
			m <= #1 0;
			m5 <= #1 0;
			end
	end
	else m5 <= #1 m5;
	if (p) begin
		if (p5 < 5) p5 <= #1 p5 + 1;
		else begin
			sr13 <= #1 do1r;
			si13 <= #1 do1i;
			sr29 <= #1 do2r;
			si29 <= #1 do2i;
			p <= #1 0;
			p5 <= #1 0;
			end
	end
	else p5 <= #1 p5;
	if (q) begin
		if (q5 < 5) q5 <= #1 q5 + 1;
		else begin
			sr14 <= #1 do1r;
			si14 <= #1 do1i;
			sr30 <= #1 do2r;
			si30 <= #1 do2i;
			q <= #1 0;
			q5 <= #1 0;
			end
	end
	else q5 <= #1 q5;
end

always @(posedge(clk)) begin
//	if (start) begin
	case (compcount)
		1: begin
			twsel <= pushin ? twsel + 1 : twsel;
			di1r <= mr0;		//stage 1 start in
			di1i <= mi0;
			di2r <= mr16;
			di2i <= mi16;
			a <= 1;
			end
		2: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr1;
			di1i <= #1 mi1;
			di2r <= #1 mr17;
			di2i <= #1 mi17;
			b <= #1 1;
			end
		3: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr2;
			di1i <= #1 mi2;
			di2r <= #1 mr18;
			di2i <= #1 mi18;
			c <= #1 1;
			end
		4: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr3;
			di1i <= #1 mi3;
			di2r <= #1 mr19;
			di2i <= #1 mi19;
			d <= #1 1;
			end
		5: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr4;
			di1i <= #1 mi4;
			di2r <= #1 mr20;
			di2i <= #1 mi20;
			e <= #1 1;
         		end
		6: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr5;
			di1i <= #1 mi5;
			di2r <= #1 mr21;
			di2i <= #1 mi21;
/*			sr0  <= do1r;		//stage 1 start out
			si0  <= do1i;
			sr16 <= do2r;
			si16 <= do2i;*/
			f <= #1 1;
			end
		7: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr6;
			di1i <= #1 mi6;
			di2r <= #1 mr22;
			di2i <= #1 mi22;
/*			sr1  <= do1r;
			si1  <= do1i;
			sr17 <= do2r;
			si17 <= do2i;*/
			g <= #1 1;
			end
		8: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr7;
			di1i <= #1 mi7;
			di2r <= #1 mr23;
			di2i <= #1 mi23;
/*			sr2  <= do1r;
			si2  <= do1i;
			sr18 <= do2r;
			si18 <= do2i;*/
			h <= #1 1;
			end
		9: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr8;
			di1i <= #1 mi8;
			di2r <= #1 mr24;
			di2i <= #1 mi24;
/*			sr3  <= do1r;
			si3  <= do1i;
			sr19 <= do2r;
			si19 <= do2i;*/
			i <= #1 1;
			end
		10: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr9;
			di1i <= #1 mi9;
			di2r <= #1 mr25;
			di2i <= #1 mi25;
/*			sr4  <= do1r;
			si4  <= do1i;
			sr20 <= do2r;
			si20 <= do2i;*/
			j <= #1 1;
			end
		11: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr10;
			di1i <= #1 mi10;
			di2r <= #1 mr26;
			di2i <= #1 mi26;
/*			sr5  <= do1r;
			si5  <= do1i;
			sr21 <= do2r;
			si21 <= do2i;*/
			k <= #1 1;
			end
		12: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr11;
			di1i <= #1 mi11;
			di2r <= #1 mr27;
			di2i <= #1 mi27;
/*			sr6  <= do1r;
			si6  <= do1i;
			sr22 <= do2r;
			si22 <= do2i;*/
			l <= #1 1;
			end
		13: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr12;
			di1i <= #1 mi12;
			di2r <= #1 mr28;
			di2i <= #1 mi28;
/*			sr7  <= do1r;
			si7  <= do1i;
			sr23 <= do2r;
			si23 <= do2i;*/
			m <= #1 1;
			end
		14: begin
			twsel <= #1 pushin ? twsel + 1 : twsel;
			di1r <= #1 mr13;
			di1i <= #1 mi13;
			di2r <= #1 mr29;
			di2i <= #1 mi29;
/*			sr8  <= do1r;
			si8  <= do1i;
			sr24 <= do2r;
			si24 <= do2i;*/
			p <= #1 1;
			end
		15: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 mr14;
			di1i <= #1 mi14;
			di2r <= #1 mr30;
			di2i <= #1 mi30;
/*			sr9  <= do1r;
			si9  <= do1i;
			sr25 <= do2r;
			si25 <= do2i;*/
			q <= #1 1;
			end
		default: compcount = compcount;
		endcase
//	if (compcount < 16) twsel_ = n-18;
//	else twsel = twsel + 1;
//	if (compcount > 16) compcount = compcount + 1;
//	else compcount = compcount;
		case(compcount)
		16: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 mr15;
			di1i <= #1 mi15;
			di2r <= #1 mr31;
			di2i <= #1 mi31;
/*			sr10 <= do1r;
			si10 <= do1i;
			sr26 <= do2r;
			si26 <= do2i;*/
			end
		17: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr0;		//stage 2 start in
			di1i <= #1 si0;
			di2r <= #1 sr8;
			di2i <= #1 si8;
/*			sr11 <= do1r;
			si11 <= do1i;
			sr27 <= do2r;
			si27 <= do2i;*/
			end
		18: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr1;
			di1i <= #1 si1;
			di2r <= #1 sr9;
			di2i <= #1 si9;
/*			sr12 <= do1r;
			si12 <= do1i;
			sr28 <= do2r;
			si28 <= do2i;*/
			end
		19: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr2;
			di1i <= #1 si2;
			di2r <= #1 sr10;
			di2i <= #1 si10;
/*			sr13 <= do1r;
			si13 <= do1i;
			sr29 <= do2r;
			si29 <= do2i;*/
			end
		20: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr3;
			di1i <= #1 si3;
			di2r <= #1 sr11;
			di2i <= #1 si11;
/*			sr14 <= do1r;
			si14 <= do1i;
			sr30 <= do2r;
			si30 <= do2i;*/
			end
		21: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr4;
			di1i <= #1 si4;
			di2r <= #1 sr12;
			di2i <= #1 si12;
			end
		22: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr5;
			di1i <= #1 si5;
			di2r <= #1 sr13;
			di2i <= #1 si13;
			sr15 <= #1 do1r;
			si15 <= #1 do1i;
			sr31 <= #1 do2r;
			si31 <= #1 do2i;
			end
		23: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr6;
			di1i <= #1 si6;
			di2r <= #1 sr14;
			di2i <= #1 si14;
			sr0  <= #1 do1r;		//stage 2 start out
			si0  <= #1 do1i;
			sr8  <= #1 do2r;
			si8  <= #1 do2i;
			end
		24: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr7;
			di1i <= #1 si7;
			di2r <= #1 sr15;
			di2i <= #1 si15;
			sr1  <= #1 do1r;
			si1  <= #1 do1i;
			sr9  <= #1 do2r;
			si9  <= #1 do2i;
			end
		25: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr16;
			di1i <= #1 si16;
			di2r <= #1 sr24;
			di2i <= #1 si24;
			sr2  <= #1 do1r;
			si2  <= #1 do1i;
			sr10 <= #1 do2r;
			si10 <= #1 do2i;
         		end
		26: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr17;
			di1i <= #1 si17;
			di2r <= #1 sr25;
			di2i <= #1 si25;
			sr3  <= #1 do1r;
			si3  <= #1 do1i;
			sr11 <= #1 do2r;
			si11 <= #1 do2i;
			end
		27: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr18;
			di1i <= #1 si18;
			di2r <= #1 sr26;
			di2i <= #1 si26;
			sr4  <= #1 do1r;
			si4  <= #1 do1i;
			sr12 <= #1 do2r;
			si12 <= #1 do2i;
			end
		28: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr19;
			di1i <= #1 si19;
			di2r <= #1 sr27;
			di2i <= #1 si27;
			sr5  <= #1 do1r;
			si5  <= #1 do1i;
			sr13 <= #1 do2r;
			si13 <= #1 do2i;
			end
		29: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr20;
			di1i <= #1 si20;
			di2r <= #1 sr28;
			di2i <= #1 si28;
			sr6  <= #1 do1r;
			si6  <= #1 do1i;
			sr14 <= #1 do2r;
			si14 <= #1 do2i;
			end
		30: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr21;
			di1i <= #1 si21;
			di2r <= #1 sr29;
			di2i <= #1 si29;
			sr7  <= #1 do1r;
			si7  <= #1 do1i;
			sr15 <= #1 do2r;
			si15 <= #1 do2i;
			end
		31: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr22;
			di1i <= #1 si22;
			di2r <= #1 sr30;
			di2i <= #1 si30;
			sr16 <= #1 do1r;
			si16 <= #1 do1i;
			sr24 <= #1 do2r;
			si24 <= #1 do2i;
			end
		32: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr23;
			di1i <= #1 si23;
			di2r <= #1 sr31;
			di2i <= #1 si31;
			sr17 <= #1 do1r;
			si17 <= #1 do1i;
			sr25 <= #1 do2r;
			si25 <= #1 do2i;
			end
		33: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr0;		//stage 3
			di1i <= #1 si0;
			di2r <= #1 sr4;
			di2i <= #1 si4;
			sr18 <= #1 do1r;
			si18 <= #1 do1i;
			sr26 <= #1 do2r;
			si26 <= #1 do2i;
			end
		34: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr1;
			di1i <= #1 si1;
			di2r <= #1 sr5;
			di2i <= #1 si5;
			sr19 <= #1 do1r;
			si19 <= #1 do1i;
			sr27 <= #1 do2r;
			si27 <= #1 do2i;
			end
		35: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr2;
			di1i <= #1 si2;
			di2r <= #1 sr6;
			di2i <= #1 si6;
			sr20 <= #1 do1r;
			si20 <= #1 do1i;
			sr28 <= #1 do2r;
			si28 <= #1 do2i;
			end
		36: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr3;
			di1i <= #1 si3;
			di2r <= #1 sr7;
			di2i <= #1 si7;
			sr21 <= #1 do1r;
			si21 <= #1 do1i;
			sr29 <= #1 do2r;
			si29 <= #1 do2i;
			end
		37: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr8;
			di1i <= #1 si8;
			di2r <= #1 sr12;
			di2i <= #1 si12;
			sr22 <= #1 do1r;
			si22 <= #1 do1i;
			sr30 <= #1 do2r;
			si30 <= #1 do2i;
			end
		38: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr9;
			di1i <= #1 si9;
			di2r <= #1 sr13;
			di2i <= #1 si13;
			sr23 <= #1 do1r;
			si23 <= #1 do1i;
			sr31 <= #1 do2r;
			si31 <= #1 do2i;
			end
		39: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr10;
			di1i <= #1 si10;
			di2r <= #1 sr14;
			di2i <= #1 si14;
			sr0  <= #1 do1r;
			si0  <= #1 do1i;
			sr4  <= #1 do2r;
			si4  <= #1 do2i;
			end
		40: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr11;
			di1i <= #1 si11;
			di2r <= #1 sr15;
			di2i <= #1 si15;
			sr1  <= #1 do1r;
			si1  <= #1 do1i;
			sr5  <= #1 do2r;
			si5  <= #1 do2i;
			end
		41: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr16;
			di1i <= #1 si16;
			di2r <= #1 sr20;
			di2i <= #1 si20;
			sr2  <= #1 do1r;
			si2  <= #1 do1i;
			sr6  <= #1 do2r;
			si6  <= #1 do2i;
         		end
		42: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr17;
			di1i <= #1 si17;
			di2r <= #1 sr21;
			di2i <= #1 si21;
			sr3  <= #1 do1r;
			si3  <= #1 do1i;
			sr7  <= #1 do2r;
			si7  <= #1 do2i;
			end
		43: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr18;
			di1i <= #1 si18;
			di2r <= #1 sr22;
			di2i <= #1 si22;
			sr8  <= #1 do1r;
			si8  <= #1 do1i;
			sr12 <= #1 do2r;
			si12 <= #1 do2i;
			end
		44: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr19;
			di1i <= #1 si19;
			di2r <= #1 sr23;
			di2i <= #1 si23;
			sr9  <= #1 do1r;
			si9  <= #1 do1i;
			sr13 <= #1 do2r;
			si13 <= #1 do2i;
			end
		45: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr24;
			di1i <= #1 si24;
			di2r <= #1 sr28;
			di2i <= #1 si28;
			sr10 <= #1 do1r;
			si10 <= #1 do1i;
			sr14 <= #1 do2r;
			si14 <= #1 do2i;
			end
		46: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr25;
			di1i <= #1 si25;
			di2r <= #1 sr29;
			di2i <= #1 si29;
			sr11 <= #1 do1r;
			si11 <= #1 do1i;
			sr15 <= #1 do2r;
			si15 <= #1 do2i;
			end
		47: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr26;
			di1i <= #1 si26;
			di2r <= #1 sr30;
			di2i <= #1 si30;
			sr16 <= #1 do1r;
			si16 <= #1 do1i;
			sr20 <= #1 do2r;
			si20 <= #1 do2i;
			end
		48: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr27;
			di1i <= #1 si27;
			di2r <= #1 sr31;
			di2i <= #1 si31;
			sr17 <= #1 do1r;
			si17 <= #1 do1i;
			sr21 <= #1 do2r;
			si21 <= #1 do2i;
			end
		49: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr0;		//stage 4
			di1i <= #1 si0;
			di2r <= #1 sr2;
			di2i <= #1 si2;
			sr18 <= #1 do1r;
			si18 <= #1 do1i;
			sr22 <= #1 do2r;
			si22 <= #1 do2i;
			end
		50: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr1;
			di1i <= #1 si1;
			di2r <= #1 sr3;
			di2i <= #1 si3;
			sr19 <= #1 do1r;
			si19 <= #1 do1i;
			sr23 <= #1 do2r;
			si23 <= #1 do2i;
			end
		51: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr4;
			di1i <= #1 si4;
			di2r <= #1 sr6;
			di2i <= #1 si6;
			sr24 <= #1 do1r;
			si24 <= #1 do1i;
			sr28 <= #1 do2r;
			si28 <= #1 do2i;
			end
		52: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr5;
			di1i <= #1 si5;
			di2r <= #1 sr7;
			di2i <= #1 si7;
			sr25 <= #1 do1r;
			si25 <= #1 do1i;
			sr29 <= #1 do2r;
			si29 <= #1 do2i;
			end
		53: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr8;
			di1i <= #1 si8;
			di2r <= #1 sr10;
			di2i <= #1 si10;
			sr26 <= #1 do1r;
			si26 <= #1 do1i;
			sr30 <= #1 do2r;
			si30 <= #1 do2i;
			end
		54: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr9;
			di1i <= #1 si9;
			di2r <= #1 sr11;
			di2i <= #1 si11;
			sr27 <= #1 do1r;
			si27 <= #1 do1i;
			sr31 <= #1 do2r;
			si31 <= #1 do2i;
			end
		55: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr12;
			di1i <= #1 si12;
			di2r <= #1 sr14;
			di2i <= #1 si14;
			sr0  <= #1 do1r;
			si0  <= #1 do1i;
			sr2  <= #1 do2r;
			si2  <= #1 do2i;
			end
		56: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr13;
			di1i <= #1 si13;
			di2r <= #1 sr15;
			di2i <= #1 si15;
			sr1  <= #1 do1r;
			si1  <= #1 do1i;
			sr3  <= #1 do2r;
			si3  <= #1 do2i;
			end
		57: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr16;
			di1i <= #1 si16;
			di2r <= #1 sr18;
			di2i <= #1 si18;
			sr4  <= #1 do1r;
			si4  <= #1 do1i;
			sr6  <= #1 do2r;
			si6  <= #1 do2i;
         		end
		58: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr17;
			di1i <= #1 si17;
			di2r <= #1 sr19;
			di2i <= #1 si19;
			sr5  <= #1 do1r;
			si5  <= #1 do1i;
			sr7  <= #1 do2r;
			si7  <= #1 do2i;
			end
		59: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr20;
			di1i <= #1 si20;
			di2r <= #1 sr22;
			di2i <= #1 si22;
			sr8  <= #1 do1r;
			si8  <= #1 do1i;
			sr10 <= #1 do2r;
			si10 <= #1 do2i;
			end
		60: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr21;
			di1i <= #1 si21;
			di2r <= #1 sr23;
			di2i <= #1 si23;
			sr9  <= #1 do1r;
			si9  <= #1 do1i;
			sr11 <= #1 do2r;
			si11 <= #1 do2i;
			end
		61: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr24;
			di1i <= #1 si24;
			di2r <= #1 sr26;
			di2i <= #1 si26;
			sr12 <= #1 do1r;
			si12 <= #1 do1i;
			sr14 <= #1 do2r;
			si14 <= #1 do2i;
			end
		62: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr25;
			di1i <= #1 si25;
			di2r <= #1 sr27;
			di2i <= #1 si27;
			sr13 <= #1 do1r;
			si13 <= #1 do1i;
			sr15 <= #1 do2r;
			si15 <= #1 do2i;
			end
		63: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr28;
			di1i <= #1 si28;
			di2r <= #1 sr30;
			di2i <= #1 si30;
			sr16 <= #1 do1r;
			si16 <= #1 do1i;
			sr18 <= #1 do2r;
			si18 <= #1 do2i;
			end
		64: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr29;
			di1i <= #1 si29;
			di2r <= #1 sr31;
			di2i <= #1 si31;
			sr17 <= #1 do1r;
			si17 <= #1 do1i;
			sr19 <= #1 do2r;
			si19 <= #1 do2i;
			end
		65: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr0;		//stage 5
			di1i <= #1 si0;
			di2r <= #1 sr1;
			di2i <= #1 si1;
			sr20 <= #1 do1r;
			si20 <= #1 do1i;
			sr22 <= #1 do2r;
			si22 <= #1 do2i;
			end
		66: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr2;
			di1i <= #1 si2;
			di2r <= #1 sr3;
			di2i <= #1 si3;
			sr21 <= #1 do1r;
			si21 <= #1 do1i;
			sr23 <= #1 do2r;
			si23 <= #1 do2i;
			end
		67: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr4;
			di1i <= #1 si4;
			di2r <= #1 sr5;
			di2i <= #1 si5;
			sr24 <= #1 do1r;
			si24 <= #1 do1i;
			sr26 <= #1 do2r;
			si26 <= #1 do2i;
			end
		68: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr6;
			di1i <= #1 si6;
			di2r <= #1 sr7;
			di2i <= #1 si7;
			sr25 <= #1 do1r;
			si25 <= #1 do1i;
			sr27 <= #1 do2r;
			si27 <= #1 do2i;
			end
		69: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr8;
			di1i <= #1 si8;
			di2r <= #1 sr9;
			di2i <= #1 si9;
			sr28 <= #1 do1r;
			si28 <= #1 do1i;
			sr30 <= #1 do2r;
			si30 <= #1 do2i;
			end
		70: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr10;
			di1i <= #1 si10;
			di2r <= #1 sr11;
			di2i <= #1 si11;
			sr29 <= #1 do1r;
			si29 <= #1 do1i;
			sr31 <= #1 do2r;
			si31 <= #1 do2i;
			end
		71: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr12;
			di1i <= #1 si12;
			di2r <= #1 sr13;
			di2i <= #1 si13;
			sr0  <= #1 do1r;	//0
			si0  <= #1 do1i;
			sr1  <= #1 do2r;	//16
			si1  <= #1 do2i;
			end
		72: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr14;
			di1i <= #1 si14;
			di2r <= #1 sr15;
			di2i <= #1 si15;
			sr2  <= #1 do1r;	//8
			si2  <= #1 do1i;
			sr3  <= #1 do2r;	//24
			si3  <= #1 do2i;
			end
		73: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr16;
			di1i <= #1 si16;
			di2r <= #1 sr17;
			di2i <= #1 si17;
			sr4  <= #1 do1r;	//4
			si4  <= #1 do1i;
			sr5  <= #1 do2r;	//20
			si5  <= #1 do2i;
         		end
		74: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr18;
			di1i <= #1 si18;
			di2r <= #1 sr19;
			di2i <= #1 si19;
			sr6  <= #1 do1r;	//12
			si6  <= #1 do1i;
			sr7  <= #1 do2r;	//28
			si7  <= #1 do2i;
			end
		75: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr20;
			di1i <= #1 si20;
			di2r <= #1 sr21;
			di2i <= #1 si21;
			sr8  <= #1 do1r;	//2
			si8  <= #1 do1i;
			sr9  <= #1 do2r;	//18
			si9  <= #1 do2i;
			end
		76: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr22;
			di1i <= #1 si22;
			di2r <= #1 sr23;
			di2i <= #1 si23;
			sr10 <= #1 do1r;	//10
			si10 <= #1 do1i;
			sr11 <= #1 do2r;	//26
			si11 <= #1 do2i;
			end
		77: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr24;
			di1i <= #1 si24;
			di2r <= #1 sr25;
			di2i <= #1 si25;
			sr12 <= #1 do1r;	//6
			si12 <= #1 do1i;
			sr13 <= #1 do2r;	//22
			si13 <= #1 do2i;
			end
		78: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr26;
			di1i <= #1 si26;
			di2r <= #1 sr27;
			di2i <= #1 si27;
			sr14 <= #1 do1r;	//14
			si14 <= #1 do1i;
			sr15 <= #1 do2r;	//30
			si15 <= #1 do2i;
			end
		79: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr28;
			di1i <= #1 si28;
			di2r <= #1 sr29;
			di2i <= #1 si29;
			sr16 <= #1 do1r;	//1
			si16 <= #1 do1i;
			sr17 <= #1 do2r;	//17
			si17 <= #1 do2i;
			end
		80: begin
			twsel <= #1 twsel + 1;
			di1r <= #1 sr30;
			di1i <= #1 si30;
			di2r <= #1 sr31;
			di2i <= #1 si31;
			sr18 <= #1 do1r;	//9
			si18 <= #1 do1i;
			sr19 <= #1 do2r;	//25
			si19 <= #1 do2i;
			end
		81: begin
//			twsel <= #1 twsel + 1;
			sr20 <= #1 do1r;	//5
			si20 <= #1 do1i;
			sr21 <= #1 do2r;	//21
			si21 <= #1 do2i;
//			dor_ = sr0>>>9;	//shift 5 for divide by 32, and shift 4 for truncation
//			doi_ = si0>>>9;
			signr = sr0[35];
			sr0 = signr ? (~sr0+1)>>9 : (sr0>>9);
			dor_ = #1 signr ? (~sr0+1) : sr0;
			signi = si0[35];
			si0 = signi ? (~si0+1)>>9 : (si0>>9);
			doi_ = #1 signi ? (~si0+1) : si0;
			pushout_ = #1 1;
			end
		82: begin
			sr22 <= #1 do1r;	//13
			si22 <= #1 do1i;
			sr23 <= #1 do2r;	//29
			si23 <= #1 do2i;
//			dor_ = sr16>>>9;
//			doi_ = si16>>>9;
			signr = sr16[35];
			sr16 = signr ? (~sr16+1)>>9 : (sr16>>9);
			dor_ = #1 signr ? (~sr16+1) : sr16;
			signi = si16[35];
			si16 = signi ? (~si16+1)>>9 : (si16>>9);
			doi_ = #1 signi ? (~si16+1) : si16;
			end
		83: begin
			sr24 <= #1 do1r;	//3
			si24 <= #1 do1i;
			sr25 <= #1 do2r;	//19
			si25 <= #1 do2i;
//			dor_ = sr8>>>9;
//			doi_ = si8>>>9;
			signr = sr8[35];
			sr8 = signr ? (~sr8+1)>>9 : (sr8>>9);
			dor_ = #1 signr ? (~sr8+1) : sr8;
			signi = si8[35];
			si8 = signi ? (~si8+1)>>9 : (si8>>9);
			doi_ = #1 signi ? (~si8+1) : si8;
			end
		84: begin
			sr26 <= #1 do1r;	//11
			si26 <= #1 do1i;
			sr27 <= #1 do2r;	//27
			si27 <= #1 do2i;
			signr = sr24[35];
			sr24 = signr ? (~sr24+1)>>9 : (sr24>>9);
			dor_ = #1 signr ? (~sr24+1) : sr24;
			signi = si24[35];
			si24 = signi ? (~si24+1)>>9 : (si24>>9);
			doi_ = #1 signi ? (~si24+1) : si24;
			end
		85: begin
			sr28 <= #1 do1r;	//7
			si28 <= #1 do1i;
			sr29 <= #1 do2r;	//23
			si29 <= #1 do2i;
//			dor_ = sr4>>>9;
//			doi_ = si4>>>9;
			signr = sr4[35];
			sr4 = signr ? (~sr4+1)>>9 : (sr4>>9);
			dor_ = #1 signr ? (~sr4+1) : sr4;
			signi = si4[35];
			si4 = signi ? (~si4+1)>>9 : (si4>>9);
			doi_ = #1 signi ? (~si4+1) : si4;


			n = 1;
			end
		86: begin
			sr30 <= #1 do1r;	//15
			si30 <= #1 do1i;
			sr31 <= #1 do2r;	//31
			si31 <= #1 do2i;
//			dor_ = sr20>>>9;
//			doi_ = si20>>>9;
			signr = sr20[35];
			sr20 = signr ? (~sr20+1)>>9 : (sr20>>9);
			dor_ = #1 signr ? (~sr20+1) : sr20;
			signi = si20[35];
			si20 = signi ? (~si20+1)>>9 : (si20>>9);
			doi_ = #1 signi ? (~si20+1) : si20;
			end
		87: begin
//			dor_ = sr12>>>9;
//			doi_ = si12>>>9;
			signr = sr12[35];
			sr12 = signr ? (~sr12+1)>>9 : (sr12>>9);
			dor_ = #1 signr ? (~sr12+1) : sr12;
			signi = si12[35];
			si12 = signi ? (~si12+1)>>9 : (si12>>9);
			doi_ = #1 signi ? (~si12+1) : si12;
			end
		88: begin
//			dor_ = sr28>>>9;
//			doi_ = si28>>>9;
			signr = sr28[35];
			sr28 = signr ? (~sr28+1)>>9 : (sr28>>9);
			dor_ = #1 signr ? (~sr28+1) : sr28;
			signi = si28[35];
			si28 = signi ? (~si28+1)>>9 : (si28>>9);
			doi_ = #1 signi ? (~si28+1) : si28;
			end
		89: begin
//			dor_ = sr2>>>9;
//			doi_ = si2>>>9;
			signr = sr2[35];
			sr2 = signr ? (~sr2+1)>>9 : (sr2>>9);
			dor_ = #1 signr ? (~sr2+1) : sr2;
			signi = si2[35];
			si2 = signi ? (~si2+1)>>9 : (si2>>9);
			doi_ = #1 signi ? (~si2+1) : si2;
			end
		90: begin
//			dor_ = sr18>>>9;
//			doi_ = si18>>>9;
			signr = sr18[35];
			sr18 = signr ? (~sr18+1)>>9 : (sr18>>9);
			dor_ = #1 signr ? (~sr18+1) : sr18;
			signi = si18[35];
			si18 = signi ? (~si18+1)>>9 : (si18>>9);
			doi_ = #1 signi ? (~si18+1) : si18;
			end
		91: begin
//			dor_ = sr10>>>9;
//			doi_ = si10>>>9;
			signr = sr10[35];
			sr10 = signr ? (~sr10+1)>>9 : (sr10>>9);
			dor_ = #1 signr ? (~sr10+1) : sr10;
			signi = si10[35];
			si10 = signi ? (~si10+1)>>9 : (si10>>9);
			doi_ = #1 signi ? (~si10+1) : si10;
			end
		92: begin
//			dor_ = sr26>>>9;
//			doi_ = si26>>>9;
			signr = sr26[35];
			sr26 = signr ? (~sr26+1)>>9 : (sr26>>9);
			dor_ = #1 signr ? (~sr26+1) : sr26;
			signi = si26[35];
			si26 = signi ? (~si26+1)>>9 : (si26>>9);
			doi_ = #1 signi ? (~si26+1) : si26;
			end
		93: begin
//			dor_ = sr6>>>9;
//			doi_ = si6>>>9;
			signr = sr6[35];
			sr6 = signr ? (~sr6+1)>>9 : (sr6>>9);
			dor_ = #1 signr ? (~sr6+1) : sr6;
			signi = si6[35];
			si6 = signi ? (~si6+1)>>9 : (si6>>9);
			doi_ = #1 signi ? (~si6+1) : si6;
			end
		94: begin
//			dor_ = sr22>>>9;
//			doi_ = si22>>>9;
			signr = sr22[35];
			sr22 = signr ? (~sr22+1)>>9 : (sr22>>9);
			dor_ = #1 signr ? (~sr22+1) : sr22;
			signi = si22[35];
			si22 = signi ? (~si22+1)>>9 : (si22>>9);
			doi_ = #1 signi ? (~si22+1) : si22;
			end
		95: begin
//			dor_ = sr14>>>9;
//			doi_ = si14>>>9;
			signr = sr14[35];
			sr14 = signr ? (~sr14+1)>>9 : (sr14>>9);
			dor_ = #1 signr ? (~sr14+1) : sr14;
			signi = si14[35];
			si14 = signi ? (~si14+1)>>9 : (si14>>9);
			doi_ = #1 signi ? (~si14+1) : si14;
			end
		96: begin
//			dor_ = sr30>>>9;
//			doi_ = si30>>>9;
			signr = sr30[35];
			sr30 = signr ? (~sr30+1)>>9 : (sr30>>9);
			dor_ = #1 signr ? (~sr30+1) : sr30;
			signi = si30[35];
			si30 = signi ? (~si30+1)>>9 : (si30>>9);
			doi_ = #1 signi ? (~si30+1) : si30;
			end
		97: begin
//			dor_ = sr1>>>9;
//			doi_ = si1>>>9;
			signr = sr1[35];
			sr1 = signr ? (~sr1+1)>>9 : (sr1>>9);
			dor_ = #1 signr ? (~sr1+1) : sr1;
			signi = si1[35];
			si1 = signi ? (~si1+1)>>9 : (si1>>9);
			doi_ = #1 signi ? (~si1+1) : si1;
			end
		98: begin
//			dor_ = sr17>>>9;
//			doi_ = si17>>>9;
			signr = sr17[35];
			sr17 = signr ? (~sr17+1)>>9 : (sr17>>9);
			dor_ = #1 signr ? (~sr17+1) : sr17;
			signi = si17[35];
			si17 = signi ? (~si17+1)>>9 : (si17>>9);
			doi_ = #1 signi ? (~si17+1) : si17;
			end
		99: begin
//			dor_ = sr9>>>9;
//			doi_ = si9>>>9;
			signr = sr9[35];
			sr9 = signr ? (~sr9+1)>>9 : (sr9>>9);
			dor_ = #1 signr ? (~sr9+1) : sr9;
			signi = si9[35];
			si9 = signi ? (~si9+1)>>9 : (si9>>9);
			doi_ = #1 signi ? (~si9+1) : si9;
			end
		100: begin
//			dor_ = sr25>>>9;
//			doi_ = si25>>>9;
			signr = sr25[35];
			sr25 = signr ? (~sr25+1)>>9 : (sr25>>9);
			dor_ = #1 signr ? (~sr25+1) : sr25;
			signi = si25[35];
			si25 = signi ? (~si25+1)>>9 : (si25>>9);
			doi_ = #1 signi ? (~si25+1) : si25;
			end
		101: begin
//			dor_ = sr5>>>9;
//			doi_ = si5>>>9;
			signr = sr5[35];
			sr5 = signr ? (~sr5+1)>>9 : (sr5>>9);
			dor_ = #1 signr ? (~sr5+1) : sr5;
			signi = si5[35];
			si5 = signi ? (~si5+1)>>9 : (si5>>9);
			doi_ = #1 signi ? (~si5+1) : si5;
			end
		102: begin
//			dor_ = sr21>>>9;
//			doi_ = si21>>>9;
			signr = sr21[35];
			sr21 = signr ? (~sr21+1)>>9 : (sr21>>9);
			dor_ = #1 signr ? (~sr21+1) : sr21;
			signi = si21[35];
			si21 = signi ? (~si21+1)>>9 : (si21>>9);
			doi_ = #1 signi ? (~si21+1) : si21;
			end
		103: begin
//			dor_ = sr13>>>9;
//			doi_ = si13>>>9;
			signr = sr13[35];
			sr13 = signr ? (~sr13+1)>>9 : (sr13>>9);
			dor_ = #1 signr ? (~sr13+1) : sr13;
			signi = si13[35];
			si13 = signi ? (~si13+1)>>9 : (si13>>9);
			doi_ = #1 signi ? (~si13+1) : si13;
			end
		104: begin
//			dor_ = sr29>>>9;
//			doi_ = si29>>>9;
			signr = sr29[35];
			sr29 = signr ? (~sr29+1)>>9 : (sr29>>9);
			dor_ = #1 signr ? (~sr29+1) : sr29;
			signi = si29[35];
			si29 = signi ? (~si29+1)>>9 : (si29>>9);
			doi_ = #1 signi ? (~si29+1) : si29;
			end
		105: begin
//			dor_ = sr3>>>9;
//			doi_ = si3>>>9;
			signr = sr3[35];
			sr3 = signr ? (~sr3+1)>>9 : (sr3>>9);
			dor_ = #1 signr ? (~sr3+1) : sr3;
			signi = si3[35];
			si3 = signi ? (~si3+1)>>9 : (si3>>9);
			doi_ = #1 signi ? (~si3+1) : si3;
			end
		106: begin
//			dor_ = sr19>>>9;
//			doi_ = si19>>>9;
			signr = sr19[35];
			sr19 = signr ? (~sr19+1)>>9 : (sr19>>9);
			dor_ = #1 signr ? (~sr19+1) : sr19;
			signi = si19[35];
			si19 = signi ? (~si19+1)>>9 : (si19>>9);
			doi_ = #1 signi ? (~si19+1) : si19;
			end
		107: begin
//			dor_ = sr11>>>9;
//			doi_ = si11>>>9;
			signr = sr11[35];
			sr11 = signr ? (~sr11+1)>>9 : (sr11>>9);
			dor_ = #1 signr ? (~sr11+1) : sr11;
			signi = si11[35];
			si11 = signi ? (~si11+1)>>9 : (si11>>9);
			doi_ = #1 signi ? (~si11+1) : si11;
			end
		108: begin
//			dor_ = sr27>>>9;
//			doi_ = si27>>>9;
			signr = sr27[35];
			sr27 = signr ? (~sr27+1)>>9 : (sr27>>9);
			dor_ = #1 signr ? (~sr27+1) : sr27;
			signi = si27[35];
			si27 = signi ? (~si27+1)>>9 : (si27>>9);
			doi_ = #1 signi ? (~si27+1) : si27;
			end
		109: begin
//			dor_ = sr7>>>9;
//			doi_ = si7>>>9;
			signr = sr7[35];
			sr7 = signr ? (~sr7+1)>>9 : (sr7>>9);
			dor_ = #1 signr ? (~sr7+1) : sr7;
			signi = si7[35];
			si7 = signi ? (~si7+1)>>9 : (si7>>9);
			doi_ = #1 signi ? (~si7+1) : si7;
			end
		110: begin
//			dor_ = sr23>>>9;
//			doi_ = si23>>>9;
			signr = sr23[35];
			sr23 = signr ? (~sr23+1)>>9 : (sr23>>9);
			dor_ = #1 signr ? (~sr23+1) : sr23;
			signi = si23[35];
			si23 = signi ? (~si23+1)>>9 : (si23>>9);
			doi_ = #1 signi ? (~si23+1) : si23;
			end
		111: begin
//			dor_ = sr15>>>9;
//			doi_ = si15>>>9;
			signr = sr15[35];
			sr15 = signr ? (~sr15+1)>>9 : (sr15>>9);
			dor_ = #1 signr ? (~sr15+1) : sr15;
			signi = si15[35];
			si15 = signi ? (~si15+1)>>9 : (si15>>9);
			doi_ = #1 signi ? (~si15+1) : si15;
			end
		112: begin
//			dor_ = sr31>>>9;
//			doi_ = si31>>>9;
			signr = sr31[35];
			sr31 = signr ? (~sr31+1)>>9 : (sr31>>9);
			dor_ = #1 signr ? (~sr31+1) : sr31;
			signi = si31[35];
			si31 = signi ? (~si31+1)>>9 : (si31>>9);
			doi_ = #1 signi ? (~si31+1) : si31;
			end
		113: begin
//			start = 0;
			compcount = 0;
			twsel = 1;
			pushout_ = #1 0;
			end
		default: compcount = compcount;
		endcase
	if (compcount > 14) compcount = compcount + 1;
//	end
	else compcount = compcount;
end

always @(posedge(clk) or posedge(rst)) begin
    if(rst) begin
        mr0 <= 0;
        mr1 <= 0;
        mr2 <= 0;
        mr3 <= 0;
        mr4 <= 0;
        mr5 <= 0;
        mr6 <= 0;
        mr7 <= 0;
        mr8 <= 0;
        mr9 <= 0;
        mr10 <= 0;
        mr11 <= 0;
        mr12 <= 0;
        mr13 <= 0;
        mr14 <= 0;
        mr15 <= 0;
	mr16 <= 0;
	mr17 <= 0;
	mr18 <= 0;
	mr19 <= 0;
	mr20 <= 0;
	mr21 <= 0;
	mr22 <= 0;
	mr23 <= 0;
	mr24 <= 0;
	mr25 <= 0;
	mr26 <= 0;
	mr27 <= 0;
	mr28 <= 0;
	mr29 <= 0;
	mr30 <= 0;
	mr31 <= 0;
	mi0 <= 0;
	mi1 <= 0;
	mi2 <= 0;
	mi3 <= 0;
	mi4 <= 0;
	mi5 <= 0;
	mi6 <= 0;
	mi7 <= 0;
	mi8 <= 0;
	mi9 <= 0;
	mi10 <= 0;
	mi11 <= 0;
	mi12 <= 0;
	mi13 <= 0;
	mi14 <= 0;
	mi15 <= 0;
	mi16 <= 0;
	mi17 <= 0;
	mi18 <= 0;
	mi19 <= 0;
	mi20 <= 0;
	mi21 <= 0;
	mi22 <= 0;
	mi23 <= 0;
	mi24 <= 0;
	mi25 <= 0;
	mi26 <= 0;
	mi27 <= 0;
	mi28 <= 0;
	mi29 <= 0;
	mi30 <= 0;
	mi31 <= 0;
	n <= 1;
	a <= 0;
	a5 <= 0;
	b <= 0;
	b5 <= 0;
	c <= 0;
	c5 <= 0;
	d <= 0;
	d5 <= 0;
	e <= 0;
	e5 <= 0;
	f <= 0;
	f5 <= 0;
	g <= 0;
	g5 <= 0;
	h <= 0;
	h5 <= 0;
	i <= 0;
	i5 <= 0;
	j <= 0;
	j5 <= 0;
	k <= 0;
	k5 <= 0;
	l <= 0;
	l5 <= 0;
	m <= 0;
	m5 <= 0;
	p <= 0;
	p5 <= 0;
	q <= 0;
	q5 <= 0;
	compcount <= 0;
	dor_ <= 0;
	doi_ <= 0;
	pushout_ <= 0;
	twsel <= 1;
	start <= 0;
    end
    else begin
	do1r_ <= do1r;
	do1i_ <= do1i;
	do2r_ <= do2r;
	do2i_ <= do2i;
//	pushin_ <= pushin;
	case (n)
	1: begin
		if (pushin) begin
		mr0 = dir;
		mr0 = mr0 << 4;
		mr0[35:32] = mr0[31] ? 4'hF : 4'h0;
		mi0 = dii;
		mi0 = mi0 << 4;
		mi0[35:32] = mi0[31] ? 4'hF : 4'h0;
		end
		else mr0 = mr0;
		end
	2: begin
		if (pushin) begin
		mr1 = dir;
		mr1 = mr1 << 4;
		mr1[35:32] = mr1[31] ? 4'hF : 4'h0;
		mi1 = dii;
		mi1 = mi1 << 4;
		mi1[35:32] = mi1[31] ? 4'hF : 4'h0;
		end
		else mr1 = mr1;
		end
	3: begin
		if (pushin) begin
		mr2 = dir;
		mr2 = mr2 << 4;
		mr2[35:32] = mr2[31] ? 4'hF : 4'h0;
		mi2 = dii;
		mi2 = mi2 << 4;
		mi2[35:32] = mi2[31] ? 4'hF : 4'h0;
		end
		else mr2 = mr2;
		end
	4: begin
		if (pushin) begin
		mr3 = dir;
		mr3 = mr3 << 4;
		mr3[35:32] = mr3[31] ? 4'hF : 4'h0;
		mi3 = dii;
		mi3 = mi3 << 4;
		mi3[35:32] = mi3[31] ? 4'hF : 4'h0;
		end
		else mr3 = mr3;
		end
	5: begin
		if (pushin) begin
		mr4 = dir;
		mr4 = mr4 << 4;
		mr4[35:32] = mr4[31] ? 4'hF : 4'h0;
		mi4 = dii;
		mi4 = mi4 << 4;
		mi4[35:32] = mi4[31] ? 4'hF : 4'h0;
		end
		else mr4 = mr4;
		end
	6: begin
		if (pushin) begin
		mr5 = dir;
		mr5 = mr5 << 4;
		mr5[35:32] = mr5[31] ? 4'hF : 4'h0;
		mi5 = dii;
		mi5 = mi5 << 4;
		mi5[35:32] = mi5[31] ? 4'hF : 4'h0;
		end
		else mr5 = mr5;
		end
	7: begin
		if (pushin) begin
		mr6 = dir;
		mr6 = mr6 << 4;
		mr6[35:32] = mr6[31] ? 4'hF : 4'h0;
		mi6 = dii;
		mi6 = mi6 << 4;
		mi6[35:32] = mi6[31] ? 4'hF : 4'h0;
		end
		else mr6 = mr6;
		end
	8: begin
		if (pushin) begin
		mr7 = dir;
		mr7 = mr7 << 4;
		mr7[35:32] = mr7[31] ? 4'hF : 4'h0;
		mi7 = dii;
		mi7 = mi7 << 4;
		mi7[35:32] = mi7[31] ? 4'hF : 4'h0;
		end
		else mr7 = mr7;
		end
	9: begin
		if (pushin) begin
		mr8 = dir;
		mr8 = mr8 << 4;
		mr8[35:32] = mr8[31] ? 4'hF : 4'h0;
		mi8 = dii;
		mi8 = mi8 << 4;
		mi8[35:32] = mi8[31] ? 4'hF : 4'h0;
		end
		else mr8 = mr8;
		end
	10: begin
		if (pushin) begin
		mr9 = dir;
		mr9 = mr9 << 4;
		mr9[35:32] = mr9[31] ? 4'hF : 4'h0;
		mi9 = dii;
		mi9 = mi9 << 4;
		mi9[35:32] = mi9[31] ? 4'hF : 4'h0;
		end
		else mr9 = mr9;
		end
	11: begin
		if (pushin) begin
		mr10 = dir;
		mr10 = mr10 << 4;
		mr10[35:32] = mr10[31] ? 4'hF : 4'h0;
		mi10 = dii;
		mi10 = mi10 << 4;
		mi10[35:32] = mi10[31] ? 4'hF : 4'h0;
		end
		else mr10 = mr10;
		end
	12: begin
		if (pushin) begin
		mr11 = dir;
		mr11 = mr11 << 4;
		mr11[35:32] = mr11[31] ? 4'hF : 4'h0;
		mi11 = dii;
		mi11 = mi11 << 4;
		mi11[35:32] = mi11[31] ? 4'hF : 4'h0;
		end
		else mr11 = mr11;
		end
	13: begin
		if (pushin) begin
		mr12 = dir;
		mr12 = mr12 << 4;
		mr12[35:32] = mr12[31] ? 4'hF : 4'h0;
		mi12 = dii;
		mi12 = mi12 << 4;
		mi12[35:32] = mi12[31] ? 4'hF : 4'h0;
		end
		else mr12 = mr12;
		end
	14: begin
		if (pushin) begin
		mr13 = dir;
		mr13 = mr13<< 4;
		mr13[35:32] = mr13[31] ? 4'hF : 4'h0;
		mi13 = dii;
		mi13 = mi13 << 4;
		mi13[35:32] = mi13[31] ? 4'hF : 4'h0;
		end
		else mr13 = mr13;
		end
	15: begin
		if (pushin) begin
		mr14 = dir;
		mr14 = mr14 << 4;
		mr14[35:32] = mr14[31] ? 4'hF : 4'h0;
		mi14 = dii;
		mi14 = mi14 << 4;
		mi14[35:32] = mi14[31] ? 4'hF : 4'h0;
		end
		else mr14 = mr14;
		end
	16: begin
		if (pushin) begin
		mr15 = dir;
		mr15 = mr15 << 4;
		mr15[35:32] = mr15[31] ? 4'hF : 4'h0;
		mi15 = dii;
		mi15 = mi15 << 4;
		mi15[35:32] = mi15[31] ? 4'hF : 4'h0;
		end
		else mr15 = mr15;
		end
	17: begin
		if (pushin) begin
		mr16 = dir;
		mr16 = mr16 << 4;
		mr16[35:32] = mr16[31] ? 4'hF : 4'h0;
		mi16 = dii;
		mi16 = mi16 << 4;
		mi16[35:32] = mi16[31] ? 4'hF : 4'h0;
		end
		else mr16 = mr16;
		end
	18: begin
		if (pushin) begin
		mr17 = dir;
		mr17 = mr17 << 4;
		mr17[35:32] = mr17[31] ? 4'hF : 4'h0;
		mi17 = dii;
		mi17 = mi17 << 4;
		mi17[35:32] = mi17[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;	//1
		end
		else mr17 = mr17;
		end
	19: begin
		if (pushin) begin
		mr18 = dir;
		mr18 = mr18 << 4;
		mr18[35:32] = mr18[31] ? 4'hF : 4'h0;
		mi18 = dii;
		mi18 = mi18 << 4;
		mi18[35:32] = mi18[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;	//2
		end
		else mr18 = mr18;
		end
	20: begin
		if (pushin) begin
		mr19 = dir;
		mr19 = mr19 << 4;
		mr19[35:32] = mr19[31] ? 4'hF : 4'h0;
		mi19 = dii;
		mi19 = mi19 << 4;
		mi19[35:32] = mi19[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr19 = mr19;
		end
	21: begin
		if (pushin) begin
		mr20 = dir;
		mr20 = mr20 << 4;
		mr20[35:32] = mr20[31] ? 4'hF : 4'h0;
		mi20 = dii;
		mi20 = mi20 << 4;
		mi20[35:32] = mi20[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr20 = mr20;
		end
	22: begin
		if (pushin) begin
		mr21 = dir;
		mr21 = mr21 << 4;
		mr21[35:32] = mr21[31] ? 4'hF : 4'h0;
		mi21 = dii;
		mi21 = mi21 << 4;
		mi21[35:32] = mi21[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr21 = mr21;
		end
	23: begin
		if (pushin) begin
		mr22 = dir;
		mr22 = mr22 << 4;
		mr22[35:32] = mr22[31] ? 4'hF : 4'h0;
		mi22 = dii;
		mi22 = mi22 << 4;
		mi22[35:32] = mi22[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr22 = mr22;
		end
	24: begin
		if (pushin) begin
		mr23 = dir;
		mr23 = mr23 << 4;
		mr23[35:32] = mr23[31] ? 4'hF : 4'h0;
		mi23 = dii;
		mi23 = mi23 << 4;
		mi23[35:32] = mi23[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr23 = mr23;
		end
	25: begin
		if (pushin) begin
		mr24 = dir;
		mr24 = mr24 << 4;
		mr24[35:32] = mr24[31] ? 4'hF : 4'h0;
		mi24 = dii;
		mi24 = mi24 << 4;
		mi24[35:32] = mi24[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr24 = mr24;
		end
	26: begin
		if (pushin) begin
		mr25 = dir;
		mr25 = mr25 << 4;
		mr25[35:32] = mr25[31] ? 4'hF : 4'h0;
		mi25 = dii;
		mi25 = mi25 << 4;
		mi25[35:32] = mi25[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr25 = mr25;
		end
	27: begin
		if (pushin) begin
		mr26 = dir;
		mr26 = mr26 << 4;
		mr26[35:32] = mr26[31] ? 4'hF : 4'h0;
		mi26 = dii;
		mi26 = mi26 << 4;
		mi26[35:32] = mi26[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr26 = mr26;
		end
	28: begin
		if (pushin) begin
		mr27 = dir;
		mr27 = mr27 << 4;
		mr27[35:32] = mr27[31] ? 4'hF : 4'h0;
		mi27 = dii;
		mi27 = mi27 << 4;
		mi27[35:32] = mi27[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr27 = mr27;
		end
	29: begin
		if (pushin) begin
		mr28 = dir;
		mr28 = mr28 << 4;
		mr28[35:32] = mr28[31] ? 4'hF : 4'h0;
		mi28 = dii;
		mi28 = mi28 << 4;
		mi28[35:32] = mi28[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr28 = mr28;
		end
	30: begin
		if (pushin) begin
		mr29 = dir;
		mr29 = mr29 << 4;
		mr29[35:32] = mr29[31] ? 4'hF : 4'h0;
		mi29 = dii;
		mi29 = mi29 << 4;
		mi29[35:32] = mi29[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;
		end
		else mr29 = mr29;
		end
	31: begin
		if (pushin) begin
		mr30 = dir;
		mr30 = mr30 << 4;
		mr30[35:32] = mr30[31] ? 4'hF : 4'h0;
		mi30 = dii;
		mi30 = mi30 << 4;
		mi30[35:32] = mi30[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;	//14
		end
		else mr30 = mr30;
		end
	32: begin
		if (pushin) begin
//		start = 1;
		mr31 = dir;
		mr31 = mr31 << 4;
		mr31[35:32] = mr31[31] ? 4'hF : 4'h0;
		mi31 = dii;
		mi31 = mi31 << 4;
		mi31[35:32] = mi31[31] ? 4'hF : 4'h0;
		compcount = compcount + 1;	//15
		end
		else mr31 = mr31;
		end
	default: n = n;
	endcase
    end
end



endmodule
