module datapath(
	input clock,
	input select_initial,
	input select_add,
	input select_shift,
	input select_counter_increment,
	input write_product,
	input write_counter,
	input [31:0] multiplier,
	input [31:0] multiplicand,
	output finished,
	output [63:0] product
);

reg [63:0] sum;
reg [63:0] shifted;
reg [63:0] reg_product;
reg [5:0] counter;

wire [63:0] product_shifted;
wire [63:0] product_initial;
wire [63:0] product_incremented;
wire [63:0] mux_add;
wire [63:0] mux_shift;
wire [63:0] product_in;
wire [5:0] counter_incremented;
wire [5:0] counter_in;

assign finished = counter >= 6'd32;
assign counter_incremented = counter + 6'd1;
assign product_shifted = reg_product >> 1;
assign product_incremented = {reg_product[63:32] + multiplicand, reg_product[31:0]};
assign product_initial = {32'd0, multiplier};

assign mux_shift = select_shift ? product_shifted : reg_product; 
assign mux_add = select_add ? product_incremented : mux_shift;
assign product_in = select_initial ? product_initial : mux_add;
assign counter_in = select_counter_increment ? counter_incremented : 6'd0;

assign product = reg_product;

always@(posedge clock)
	begin
		if(write_product)
			reg_product <= product_in;
		if(write_counter)
			counter <= counter_in;
	end

endmodule