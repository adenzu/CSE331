module mult32 (clock, reset, multiplicand, multiplier, product, write1, shift1, product01, state);
input clock;
input reset;
input [31:0] multiplicand;
input [31:0] multiplier;
output [31:0] product;
output write1;
output shift1;
output product01;
output [2:0] state;

wire product0;
wire write;
wire shift;

assign write1 = write;
assign shift1 = shift;
assign product01 = product0;
	
control control0(clock, reset, product0, write, shift, state);
datapath datapath0(clock, reset, multiplicand, multiplier, write, shift, product, product0);

endmodule