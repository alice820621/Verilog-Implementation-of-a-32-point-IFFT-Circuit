module fifo(rst,clk,dir,dii,dor,doi);

input rst,clk;
input [28:0] dir,dii;
output [28:0] dor,doi;

reg [35:0] dor_,doi_;
reg [35:0] mr0,mr1,mr2,mr3,mr4,mr5,mr6,mr7,mr8,mr9,mr10,mr11,mr12,mr13,mr14,mr15;
reg [35:0] mr16,mr17,mr18,mr19,mr20,mr21,mr22,mr23,mr24,mr25,mr26,mr27,mr28,mr29,mr30,mr31;
reg [35:0] mi0,mi1,mi2,mi3,mi4,mi5,mi6,mi7,mi8,mi9,mi10,mi11,mi12,mi13,mi14,mi15;
reg [35:0] mi16,mi17,mi18,mi19,mi20,mi21,mi22,mi23,mi24,mi25,mi26,mi27,mi28,mi29,mi30,mi31;
reg [5:0] n;

assign dor = dor_;
assign doi = doi_;

always @(dir) begin
	if (n<32) n = n + 1;
	else n = 1;
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
	n <= 0;
    end
    else begin
	case (n)
	1: begin
		mr0 = dir;
		mr0 = mr0 << 4;
		mi0 = dii;
		mi0 = mi0 << 4;
		end
	2: begin
		mr1 = dir;
		mr1 = mr1 << 4;
		mi1 = dii;
		mi1 = mi1 << 4;
		end
	3: begin
		mr2 = dir;
		mr2 = mr2 << 4;
		mi2 = dii;
		mi2 = mi2 << 4;
		end
	4: begin
		mr3 = dir;
		mr3 = mr3 << 4;
		mi3 = dii;
		mi3 = mi3 << 4;
		end
	5: begin
		mr4 = dir;
		mr4 = mr4 << 4;
		mi4 = dii;
		mi4 = mi4 << 4;
		end
	6: begin
		mr5 = dir;
		mr5 = mr5 << 4;
		mi5 = dii;
		mi5 = mi5 << 4;
		end
	7: begin
		mr6 = dir;
		mr6 = mr6 << 4;
		mi6 = dii;
		mi6 = mi6 << 4;
		end
	8: begin
		mr7 = dir;
		mr7 = mr7 << 4;
		mi7 = dii;
		mi7 = mi7 << 4;
		end
	9: begin
		mr8 = dir;
		mr8 = mr8 << 4;
		mi8 = dii;
		mi8 = mi8 << 4;
		end
	10: begin
		mr9 = dir;
		mr9 = mr9 << 4;
		mi9 = dii;
		mi9 = mi9 << 4;
		end
	11: begin
		mr10 = dir;
		mr10 = mr10 << 4;
		mi10 = dii;
		mi10 = mi10 << 4;
		end
	12: begin
		mr11 = dir;
		mr11 = mr11 << 4;
		mi11 = dii;
		mi11 = mi11 << 4;
		end
	13: begin
		mr12 = dir;
		mr12 = mr12 << 4;
		mi12 = dii;
		mi12 = mi12 << 4;
		end
	14: begin
		mr13 = dir;
		mr13 = mr13<< 4;
		mi13 = dii;
		mi13 = mi13 << 4;
		end
	15: begin
		mr14 = dir;
		mr14 = mr14 << 4;
		mi14 = dii;
		mi14 = mi14 << 4;
		end
	16: begin
		mr15 = dir;
		mr15 = mr15 << 4;
		mi15 = dii;
		mi15 = mi15 << 4;
		end
	17: begin
		mr16 = dir;
		mr16 = mr16 << 4;
		mi16 = dii;
		mi16 = mi16 << 4;
		end
	18: begin
		mr17 = dir;
		mr17 = mr17 << 4;
		mi17 = dii;
		mi17 = mi17 << 4;
		end
	19: begin
		mr18 = dir;
		mr18 = mr18 << 4;
		mi18 = dii;
		mi18 = mi18 << 4;
		end
	20: begin
		mr19 = dir;
		mr19 = mr19 << 4;
		mi19 = dii;
		mi19 = mi19 << 4;
		end
	21: begin
		mr20 = dir;
		mr20 = mr20 << 4;
		mi20 = dii;
		mi20 = mi20 << 4;
		end
	22: begin
		mr21 = dir;
		mr21 = mr21 << 4;
		mi21 = dii;
		mi21 = mi21 << 4;
		end
	23: begin
		mr22 = dir;
		mr22 = mr22 << 4;
		mi22 = dii;
		mi22 = mi22 << 4;
		end
	24: begin
		mr23 = dir;
		mr23 = mr23 << 4;
		mi23 = dii;
		mi23 = mi23 << 4;
		end
	25: begin
		mr24 = dir;
		mr24 = mr24 << 4;
		mi24 = dii;
		mi24 = mi24 << 4;
		end
	26: begin
		mr25 = dir;
		mr25 = mr25 << 4;
		mi25 = dii;
		mi25 = mi25 << 4;
		end
	27: begin
		mr26 = dir;
		mr26 = mr26 << 4;
		mi26 = dii;
		mi26 = mi26 << 4;
		end
	28: begin
		mr27 = dir;
		mr27 = mr27 << 4;
		mi27 = dii;
		mi27 = mi27 << 4;
		end
	29: begin
		mr28 = dir;
		mr28 = mr28 << 4;
		mi28 = dii;
		mi28 = mi28 << 4;
		end
	30: begin
		mr29 = dir;
		mr29 = mr29 << 4;
		mi29 = dii;
		mi29 = mi29 << 4;
		end
	31: begin
		mr30 = dir;
		mr30 = mr30 << 4;
		mi30 = dii;
		mi30 = mi30 << 4;
		end
	32: begin
		mr31 = dir;
		mr31 = mr31 << 4;
		mi31 = dii;
		mi31 = mi31 << 4;
		end
	default: mr0 = mr0;
	endcase
    end
end



endmodule
