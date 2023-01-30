module test;

reg clock = 1'b0;
reg reset = 1'b0;
reg [15:0] cypher = 16'd0;
reg [3:0] compared = 4'd0;
reg read = 1'b0;

wire match;
wire [7:0] sum;

bonus bns(
    .clock(clock),
    .reset(reset),
    .cypher(cypher),
    .compared(compared),
    .read(read),
    .match(match),
    .sum(sum)
);

always 
begin
    #1
    clock = ~clock;    
end

initial 
begin
    #64
    reset = 1'b1;
    read = 1'b0;
    cypher = 16'b0110010110101001;

    #5
    reset = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b0;
    compared = 4'b0110;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b1111;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b1111;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b1001;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b1010;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b0000;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b1001;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b1010;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b0101;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b1;
    compared = 4'b0110;

    #4
    read = 1'b0;

    #64
    reset = 1'b0;
    read = 1'b0;
end

endmodule