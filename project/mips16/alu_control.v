module alu_control(
   input [2:0] ALUOp, 
   input [5:0] func,
   output reg[2:0] ALU_Control
);  
wire [8:0] alu_controlIn;  
assign alu_controlIn = {ALUOp,func};  
always @(alu_controlIn)  
   begin
      casex (alu_controlIn)  
         9'b000xxxxxx:  ALU_Control=3'b000; // addi, lw, sw, li
         9'b001xxxxxx:  ALU_Control=3'b001; // beq, bne
         9'b101xxxxxx:  ALU_Control=3'b100; // slti
         9'b010xxxxxx:  ALU_Control=3'b010; // andi
         9'b011xxxxxx:  ALU_Control=3'b011; // ori
         9'b110100000:  ALU_Control=3'b000; // add  
         9'b110100010:  ALU_Control=3'b001; // sub 
         9'b110101010:  ALU_Control=3'b100; // slt 
         9'b110001000:  ALU_Control=3'bxxx; // jr
         9'b110100100:  ALU_Control=3'b010; // and 
         9'b110100101:  ALU_Control=3'b011; // or 
         9'b110000000:  ALU_Control=3'b111; // sll  
         9'b110000010:  ALU_Control=3'b110; // srl 
         default:       ALU_Control=3'b000;  
      endcase  
   end
endmodule  
