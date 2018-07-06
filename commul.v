module commul(rst,clk,dir,dii,twsel,dor,doi);

input rst,clk;
input [35:0] dir,dii;
input [6:0] twsel;
output [35:0] dor,doi;

reg [35:0] dir_,dii_,dor_,doi_,dir1,dii1,dir11,dii11,dir111,dii111;
reg [6:0] twsel_;
reg [31:0] wr,wi,wr1,wi1,wr11,wi11,wr111,wi111;
reg [67:0] tr1,ti1,tr2,ti2,tr3,ti3,tr11,ti11,tr22,ti22,tr33,ti33,tr111,ti111;
//reg [35:0] tr4,ti4,tr44,ti44;
reg signr,signi,signwr,signwi,signrm,signim,signrr,signii,signrrr,signiii,signwrr,signwii,signwrrr,signwiii;

assign dor = dor_;
assign doi = doi_;

always @(*) begin
case (twsel)
	1: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	2: begin
		wr = 32'h3EC52F9F;
		wi = 32'hC7C5C1E;
		end
	3: begin
		wr = 32'h3B20D79E;
		wi = 32'h187DE2A6;
		end
	4: begin
		wr = 32'h3536CC52;
		wi = 32'h238E7673;
		end
	5: begin
		wr = 32'h2D413CCC;
		wi = 32'h2D413CCC;
		end
	6: begin
		wr = 32'h238E7673;
		wi = 32'h3536CC52;
		end
	7: begin
		wr = 32'h187DE2A6;
		wi = 32'h3B20D79E;
		end
	8: begin
		wr = 32'hC7C5C1E;
		wi = 32'h3EC52F9F;
		end
	9: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	10: begin
		wr = 32'hF383A3E2;
		wi = 32'h3EC52F9F;
		end
	11: begin
		wr = 32'hE7821D5A;
		wi = 32'h3B20D79E;
		end
	12: begin
		wr = 32'hDC71898D;
		wi = 32'h3536CC52;
		end
	13: begin
		wr = 32'hD2BEC334;
		wi = 32'h2D413CCC;
		end
	14: begin
		wr = 32'hCAC933AE;
		wi = 32'h238E7673;
		end
	15: begin
		wr = 32'hC4DF2862;
		wi = 32'h187DE2A6;
		end
	16: begin
		wr = 32'hC13AD061;
		wi = 32'hC7C5C1E;
		end
	17: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	18: begin
		wr = 32'h3B20D79E;
		wi = 32'h187DE2A6;
		end
	19: begin
		wr = 32'h2D413CCC;
		wi = 32'h2D413CCC;
		end
	20: begin
		wr = 32'h187DE2A6;
		wi = 32'h3B20D79E;
		end
	21: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	22: begin
		wr = 32'hE7821D5A;
		wi = 32'h3B20D79E;
		end
	23: begin
		wr = 32'hD2BEC334;
		wi = 32'h2D413CCC;
		end
	24: begin
		wr = 32'hC4DF2862;
		wi = 32'h187DE2A6;
		end
	25: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	26: begin
		wr = 32'h3B20D79E;
		wi = 32'h187DE2A6;
		end
	27: begin
		wr = 32'h2D413CCC;
		wi = 32'h2D413CCC;
		end
	28: begin
		wr = 32'h187DE2A6;
		wi = 32'h3B20D79E;
		end
	29: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	30: begin
		wr = 32'hE7821D5A;
		wi = 32'h3B20D79E;
		end
	31: begin
		wr = 32'hD2BEC334;
		wi = 32'h2D413CCC;
		end
	32: begin
		wr = 32'hC4DF2862;
		wi = 32'h187DE2A6;
		end
	33: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	34: begin
		wr = 32'h2D413CCC;
		wi = 32'h2D413CCC;
		end
	35: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	36: begin
		wr = 32'hD2BEC334;
		wi = 32'h2D413CCC;
		end
	37: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	38: begin
		wr = 32'h2D413CCC;
		wi = 32'h2D413CCC;
		end
	39: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	40: begin
		wr = 32'hD2BEC334;
		wi = 32'h2D413CCC;
		end
	41: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	42: begin
		wr = 32'h2D413CCC;
		wi = 32'h2D413CCC;
		end
	43: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	44: begin
		wr = 32'hD2BEC334;
		wi = 32'h2D413CCC;
		end
	45: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	46: begin
		wr = 32'h2D413CCC;
		wi = 32'h2D413CCC;
		end
	47: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	48: begin
		wr = 32'hD2BEC334;
		wi = 32'h2D413CCC;
		end
	49: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	50: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	51: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	52: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	53: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	54: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	55: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	56: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	57: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	58: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	59: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	60: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	61: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	62: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	63: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	64: begin
		wr = 32'h0;
		wi = 32'h40000000;
		end
	65: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	66: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	67: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	68: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	69: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	70: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	71: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	72: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	73: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	74: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	75: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	76: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	77: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	78: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	79: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	80: begin
		wr = 32'h40000000;
		wi = 32'h0;
		end
	default: begin
		wr = 32'h0;
		wi = 32'h0;
		end
	endcase
end

always @(*) begin
	signr = dir[35];
	dir1 = dir[35] ? ~dir+1 : dir;
	signi = dii[35];
	dii1 = dii[35] ? ~dii+1 : dii;
	signwr = wr[31];
	wr1 = wr[31] ? ~wr+1 : wr;
	signwi = wi[31];
	wi1 = wi[31] ? ~wi+1 : wi;

	tr1 = (signrr^signwrr) ? ~(dir11*wr11)+1 : (dir11*wr11);
	tr2 = (signiii^signwiii) ? ~(dii111*wi111)+1 : (dii111*wi111);
	ti1 = (signrr^signwii) ? ~(dir11*wi11)+1 : (dir11*wi11);
	ti2 = (signiii ^signwrrr) ? ~(dii111*wr111)+1 : (dii111*wr111);

//	tr1 = (signr^signwr) ? ~tr1+1 : tr1;
//	tr2 = (signi^signwi) ? ~tr2+1 : tr2;
//	ti1 = (signr^signwi) ? ~ti1+1 : ti1;
//	ti2 = (signi^signwr) ? ~ti2+1 : ti2;

	tr3 = tr111-tr22;
	ti3 = ti111+ti22;

//	signrm <= tr3[67];
//	signim <= ti3[67];
	dor_ = tr33[67] ? ~((~tr33+1)>>30)+1 : (tr33 >> 30);
	doi_ = ti33[67] ? ~((~ti33+1)>>30)+1 : (ti33 >> 30);

//	dor_ <= tr44;
//	doi_ <= ti44;
end

always @(posedge(clk) or posedge(rst)) begin
    if(rst) begin
//	dir_ <= 0;
//	dii_ <= 0;
	twsel_ <= 0;
	tr1 <= 0;
	ti1 <= 0;
	tr2 <= 0;
	ti2 <= 0;
	tr3 <= 0;
	ti3 <= 0;
//	tr4 <= 0;
//	ti4 <= 0;
	dor_ <= 0;
	doi_ <= 0;
    end else begin
//	dir_ <= dir;
//	dii_ <= dii;
	twsel_ <= #1 twsel;
	dir11 <= #1 dir1;
	dii11 <= #1 dii1;
	dir111 <= #1 dir11;
	dii111 <= #1 dii11;
	wr11 <= #1 wr1;
	wi11 <= #1 wi1;
	wr111 <= #1 wr11;
	wi111 <= #1 wi11;
	signrr <= #1 signr;
	signii <= #1 signi;
	signrrr <= #1 signrr;
	signiii <= #1 signii;
	signwrr <= #1 signwr;
	signwii <= #1 signwi;
	signwrrr <= #1 signwrr;
	signwiii <= #1 signwii;
//	signrmm <= signrm;
//	signimm <= signim;
	tr11 <= #1 tr1;
	ti11 <= #1 ti1;
	tr111 <= #1 tr11;
	ti111 <= #1 ti11;
	tr22 <= #1 tr2;
	ti22 <= #1 ti2;
	tr33 <= #1 tr3;
	ti33 <= #1 ti3;
//	tr44 <= tr4;
//	ti44 <= ti4;
    end
end



endmodule

