module control (clock, reset, product0, write, shift, state);
input clock;
input reset;
input product0;
output reg write;
output reg shift;
output [2:0] state;

localparam [2:0] S0 = 3'b000;
localparam [2:0] S1 = 3'b001;
localparam [2:0] S2 = 3'b010;
localparam [2:0] S3 = 3'b011;
localparam [2:0] S4 = 3'b100;

localparam [6:0] count = 6'd32;

reg [2:0] currentState;
reg [2:0] nextState = S0;
reg [6:0] currentIteration;

assign state = currentState;

always @ (posedge clock)
begin
	if (reset) currentState <= nextState;
	else
	begin
		case (currentState)
			S0:
			begin
				if (product0) 
					currentState <= S1;
				else 
					currentState <= S2;
			end
			S1:
			begin
				currentState <= S2;
			end
			S2:
			begin
				currentState <= S3;
			end
			S3:
			begin
				if (currentIteration < 32) 
					currentState <= S0;
				else
					currentState <= S4;
				currentIteration <= currentIteration + 1;
			end
		endcase
	end
end

always @ (posedge clock)
begin
	if (reset);
	else 
	begin
		case (currentState)
			S0:
			begin
				shift <= 0;
				write <= 0;
			end
			S1:
			begin 
				shift <= 0;
				write <= 1;
			end
			S2:
			begin 
				shift <= 1;
				write <= 0;
			end
			S3:
			begin 
				shift <= 0;
				write <= 0;
			end
		endcase
	end
end
	
endmodule