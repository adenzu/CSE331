module mux2x1(in0, in1, selector, out);
input in0;
input in1;
input selector;
output out;

wire not_selector;

wire and0_w;
wire and1_w;

not not0(not_selector, selector);

and and0(and0_w, in0, not_selector);
and and1(and1_w, in1, selector);

or or0(out, and0_w, and1_w);

endmodule