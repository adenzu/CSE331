module datapath (clock, reset, multiplicand, multiplier, write, shift, product, product0);
input clock;
input reset;
input [31:0] multiplicand;
input [31:0] multiplier;
input write;
input shift;
output [31:0] product;
output product0;

reg [63:0] product_;

initial begin
	product_[31:0] = multiplier;
end

wire trash;
wire [31:0] sum;
wire [63:0] mux_w;

wire not_reset;
wire true_reset;
wire truest_reset;
wire anti_p0;

or or0(product0, product[0], 0);

//equal eq0(product_[31:0], multiplier, not_reset);
//not not1(true_reset, not_reset);
//and and1(truest_reset, true_reset, reset);

mux3x2_64 mm0(product_, {sum, product_[31:0]}, {1'b0, product_[63:1]}, write, shift, mux_w);

//mux2x1_32 mm00(mux_w[31:0], multiplier, true_reset, product_[31:0]);
//mux2x1_32 mm01(mux_w[63:32], 32'b0, true_reset, product_[63:32]);

adder add0(multiplicand, product_[63:32], 0, sum, trash);

or32 or0_32(32'b0, product_[31:0], product);

endmodule