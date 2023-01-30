module mux3x2_32 (a, b, c, s0, s1, out);
input [31:0] a;
input [31:0] b;
input [31:0] c;
input s0;
input s1;
input [31:0] out;

wire [31:0] w0;

mux2x1_32 m0(a, b, s0, w0);
mux2x1_32 m1(w0, c, s1, out);

endmodule