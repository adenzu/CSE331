module mult32 (clock, reset, multiplicand, multiplier, product);
input clock;
input reset;
input [31:0] multiplicand;
input [31:0] multiplier;
output [31:0] product;

wire product0;
wire write;
wire shift;

assign write1 = write;
assign shift1 = shift;
assign product01 = product0;

wire [63:0] product_;

or32 or0(32'b0, product_[31:0], product);
	
control control0(clock, reset, product0, write, shift, state);
datapath datapath0(clock, reset, multiplicand, multiplier, write, shift, product_, product0);

endmodule