module mult(
	input clock,
	input reset,
	input [31:0] multiplicand,
	input [31:0] multiplier,
	output [63:0] product,
	output [1:0] state
);


wire select_initial;
wire select_add;
wire select_shift;
wire select_counter_increment;
wire write_product;
wire write_counter;
wire finished;

controller c0(
	.clock(clock),
	.reset(reset),
	.finished(finished),
	.product0(product[0]),
	.select_initial(select_initial),
	.select_add(select_add),
	.select_shift(select_shift),
	.select_counter_increment(select_counter_increment),
	.write_product(write_product),
	.write_counter(write_counter),
	.state(state)
);

datapath dp0(
	.clock(clock),
	.select_initial(select_initial),
	.select_add(select_add),
	.select_shift(select_shift),
	.select_counter_increment(select_counter_increment),
	.write_product(write_product),
	.write_counter(write_counter),
	.multiplier(multiplier),
	.multiplicand(multiplicand),
	.finished(finished),
	.product(product)
);

endmodule