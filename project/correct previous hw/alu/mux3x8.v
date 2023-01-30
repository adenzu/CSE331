module mux3x8(in, selector, out);
input [7:0] in;
input [2:0] selector;
output out;

wire [2:0] not_selector;

wire [7:0] and0_w;
wire [7:0] and1_w;
wire [7:0] and2_w;

not not0(not_selector[0], selector[0]);
not not1(not_selector[1], selector[1]);
not not2(not_selector[2], selector[2]);

and and0(and2_w[0], in[0], not_selector[0], not_selector[1], not_selector[2]);
and and1(and2_w[1], in[1], selector[0], not_selector[1], not_selector[2]);
and and2(and2_w[2], in[2], not_selector[0], selector[1], not_selector[2]);
and and3(and2_w[3], in[3], selector[0], selector[1], not_selector[2]);
and and4(and2_w[4], in[4], not_selector[0], not_selector[1], selector[2]);
and and5(and2_w[5], in[5], selector[0], not_selector[1], selector[2]);
and and6(and2_w[6], in[6], not_selector[0], selector[1], selector[2]);
and and7(and2_w[7], in[7], selector[0], selector[1], selector[2]);

or or0(out, and2_w[0], and2_w[1], and2_w[2], and2_w[3], and2_w[4], and2_w[5], and2_w[6], and2_w[7]);

endmodule