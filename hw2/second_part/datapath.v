module datapath (clock, reset, multiplicand, multiplier, write, shift, product, product0);
input clock;
input reset;
input [31:0] multiplicand;
input [31:0] multiplier;
input write;
input shift;
output [63:0] product;
output product0;

wire trash;
wire [31:0] sum;
wire [63:0] mux_w;

or or0(product0, product[0], 0);

mux3x2_64 mm0(product, {sum, product[31:0]}, {1'b0, product[63:1]}, write, shift, mux_w);

mux2x1_32 mm00(mux_w[31:0], multiplier, reset, product[31:0]);
mux2x1_32 mm01(mux_w[63:32], 32'b0, reset, product[63:32]);

add32 add0(multiplicand, product[63:32], 0, sum, trash);

endmodule