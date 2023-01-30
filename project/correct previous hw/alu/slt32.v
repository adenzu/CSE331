module slt32 (a, b, out);
input [31:0] a;
input [31:0] b;
output [31:0] out;

wire [31:0] sub1_w;

localparam one = 1'b1;

sub32 sub_1(a, b, sub1_w);
and and_1(out, sub1_w[31], one);

endmodule