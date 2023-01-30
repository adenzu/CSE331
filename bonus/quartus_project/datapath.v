module datapath(
    input clock,
    input sl_sum,
    input sl_index,
    input wr_cypher,
    input wr_compared,
    input wr_sum,
    input wr_index,
    input wr_sum_out,
    input [15:0] cypher,
    input [3:0] compared,
    output stop,
    output equal,
    output [7:0] sum_out
);

reg [15:0] reg_cypher;
reg [3:0] reg_index;
reg [3:0] reg_compared;
reg [7:0] reg_sum_out;
reg [7:0] reg_sum;

wire [7:0] sum_added;
wire [7:0] sum_in;
wire [7:0] extended_compared;
wire [3:0] cypher_part0;
wire [3:0] cypher_part1;
wire [3:0] cypher_part;
wire [3:0] index_added;
wire [3:0] index_in;
wire index0;
wire index1;

// wires
assign extended_compared = {4'd0, reg_compared};
assign sum_added = reg_sum + extended_compared;
assign index_added = reg_index + 4'd1;
assign index0 = reg_index[0];
assign index1 = reg_index[1];

// mux
assign sum_in = sl_sum ? sum_added : 8'd0;
assign index_in = sl_index ? index_added : 4'd0;
assign cypher_part0 = index0 ? reg_cypher[7:4] : reg_cypher[3:0];
assign cypher_part1 = index0 ? reg_cypher[15:12] : reg_cypher[11:8];
assign cypher_part = index1 ? cypher_part1 : cypher_part0;

// outputs
assign stop = reg_index > 4'd3;
assign equal = cypher_part == reg_compared;
assign sum_out = reg_sum_out;

always@(posedge clock)
begin
    if (wr_cypher)
        reg_cypher <= cypher;
    if (wr_compared)
        reg_compared <= compared;
    if (wr_sum)
        reg_sum <= sum_in;
    if (wr_index)
        reg_index <= index_in;
    if (wr_sum_out)
        reg_sum_out <= reg_sum;
end

endmodule