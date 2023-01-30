module controller(
	input clock,
	input reset,
	input finished,
	input product0,
	output select_initial,
	output select_add,
	output select_shift,
	output select_counter_increment,
	output write_product,
	output write_counter,
	output [1:0] state
);

reg [1:0] current_state;
reg [1:0] next_state;
reg reg_select_initial;
reg reg_select_add;
reg reg_select_shift;
reg reg_select_counter_increment;
reg reg_write_product;
reg reg_write_counter;

localparam START = 2'b00;
localparam CHECK = 2'b01;
localparam ADD   = 2'b10;
localparam SHIFT = 2'b11;

assign select_initial = reg_select_initial;
assign select_add = reg_select_add;
assign select_shift = reg_select_shift;
assign select_counter_increment = reg_select_counter_increment;
assign write_product = reg_write_product;
assign write_counter = reg_write_counter;

assign state = current_state;

always@(posedge clock)
	begin
		if (reset)
			current_state <= START;
		else
			current_state <= next_state;
	end

always@(*)
	begin
		case (current_state)
			START:
				begin
					next_state = CHECK; 
				end
			CHECK:
				begin
					if(finished)
						next_state = CHECK;
					else 
						if(product0)
							next_state = ADD;
						else
							next_state = SHIFT;
				end
			ADD:
				begin
					next_state = SHIFT;
				end
			SHIFT:
				begin
					next_state = CHECK;
				end
		endcase
	end

always@(*)
	begin
		reg_select_initial = 1'd0;
		reg_select_add = 1'd0;
		reg_select_shift = 1'd0;
		reg_select_counter_increment = 1'd0;
		reg_write_product = 1'd0;
		reg_write_counter = 1'd0;
		case (current_state)
			START:
				begin
					reg_select_initial = 1'd1;
					reg_write_product = 1'd1;
					reg_select_counter_increment = 1'd0;
					reg_write_counter = 1'd1;
				end
			ADD:
				begin
					reg_select_add = 1'd1;
					reg_write_product = 1'd1;
				end
			SHIFT:
				begin
					reg_select_shift = 1'd1;
					reg_select_add = 1'd0;
					reg_write_product = 1'd1;
					reg_select_counter_increment = 1'd1;
					reg_write_counter = 1'd1;
				end
		endcase 
	end


endmodule