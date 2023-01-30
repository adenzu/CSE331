module controller(
    input clock,
    input reset,
    input read,
    input stop,
    input equal,
    output reg sl_sum,
    output reg sl_index,
    output reg wr_cypher,
    output reg wr_compared,
    output reg wr_sum,
    output reg wr_index,
    output reg wr_sum_out,
    output reg match
);

reg [2:0] current_state;
reg [2:0] next_state;

localparam INIT = 3'b001;
localparam WAIT = 3'b010;
localparam COMP = 3'b011;
localparam INCR = 3'b100;
localparam REST = 3'b101;
localparam FNSH = 3'b110;

always@(posedge clock)
begin
    if (reset)
        current_state <= INIT;
    else
        current_state <= next_state;
end

always@(*)
begin
    case (current_state)
        INIT:
        begin
            next_state = WAIT;
        end
        WAIT:
        begin
            if (stop)
                next_state = FNSH;
            else
                if (read)
                    next_state = COMP;
                else
                    next_state = WAIT;
        end
        COMP:
        begin
            if (equal)
                next_state = INCR;
            else
                next_state = REST;
        end
        REST:
        begin
            next_state = WAIT;
        end
        INCR:
        begin
            next_state = WAIT;
        end
        FNSH:
        begin
            next_state = FNSH;
        end
    endcase
end 

always @(*) 
begin
    sl_sum = 1'd0;
    sl_index = 1'd0;
    wr_cypher = 1'd0;
    wr_compared = 1'd0;
    wr_sum = 1'd0;
    wr_index = 1'd0;
    wr_sum_out = 1'd0;
    match = 1'd0;
    case (current_state)
        INIT:
        begin
            wr_cypher = 1'd1;
            sl_index = 1'd0;
            wr_index = 1'd1;
            sl_sum = 1'd0;
            wr_sum = 1'd1;
            match = 1'd0;
        end 
        WAIT:
        begin
            wr_compared = 1'd1;
        end 
        COMP:
        begin
            sl_sum = 1'd1;
            wr_sum = 1'd1;
        end 
        REST:
        begin
            sl_index = 1'd0;
            wr_index = 1'd1;
        end
        INCR:
        begin
            sl_index = 1'd1;
            wr_index = 1'd1;
        end 
        FNSH:
        begin
            wr_sum_out = 1'd1;
            match = 1'd1;
        end 
    endcase
end

endmodule