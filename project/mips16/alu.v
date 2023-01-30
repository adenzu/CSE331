module alu(       
    input signed [15:0] a,           
    input signed [15:0] b,          
    input [3:0] shamt,
    input [2:0] alu_control,          
    output zero ,
    output reg [15:0] result
);  

reg [15:0] _result;
always @(*)
    begin
        case (alu_control)
            3'b110: result = _result >> shamt; 
            3'b111: result = _result << shamt;
            default: result = _result;
        endcase
    end
always @(*)  
    begin   
        case(alu_control)  
            3'b000: _result = a + b; // add  
            3'b001: _result = a - b; // sub  
            3'b010: _result = a & b; // and  
            3'b011: _result = a | b; // or  
            3'b100: begin if (a<b) _result = 16'd1;  
                        else _result = 16'd0;  
                        end  
            3'b101: _result = b;
            default:_result = a + b; // add  
        endcase  
    end  
assign zero = _result == 16'd0;  
endmodule 