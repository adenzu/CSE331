module mux3x2_64 (a, b, c, s0, s1, out);
input [63:0] a;
input [63:0] b;
input [63:0] c;
input s0;
input s1;
output [63:0] out;

wire [31:0] w0;
wire [31:0] w1;

mux2x1_32 m0(a[31:0], b[31:0], s0, w0);
mux2x1_32 m1(w0, c[31:0], s1, out[31:0]);

mux2x1_32 m00(a[31:0], b[31:0], s0, w1);
mux2x1_32 m10(w1, c[31:0], s1, out[63:32]);

endmodule