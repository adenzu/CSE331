module bonus(
    input clock,
    input reset,
    input [15:0] cypher,
    input [3:0] compared,
    input read,
    output match,
    output [7:0] sum
);

wire sl_sum;
wire sl_index;
wire wr_cypher;
wire wr_compared;
wire wr_sum;
wire wr_index;
wire wr_sum_out;
wire stop;
wire equal;

controller ctr(
    .clock(clock),
    .reset(reset),
    .read(read),
    .stop(stop),
    .equal(equal),
    .sl_sum(sl_sum),
    .sl_index(sl_index),
    .wr_cypher(wr_cypher),
    .wr_compared(wr_compared),
    .wr_sum(wr_sum),
    .wr_index(wr_index),
    .wr_sum_out(wr_sum_out),
    .match(match)
);

datapath dp(
    .clock(clock),
    .sl_sum(sl_sum),
    .sl_index(sl_index),
    .wr_cypher(wr_cypher),
    .wr_compared(wr_compared),
    .wr_sum(wr_sum),
    .wr_index(wr_index),
    .wr_sum_out(wr_sum_out),
    .cypher(cypher),
    .compared(compared),
    .stop(stop),
    .equal(equal),
    .sum_out(sum)
);

endmodule