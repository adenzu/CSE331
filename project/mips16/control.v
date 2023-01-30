module control( 
     input reset,  
     input [5:0] opcode,  
     output reg jump,
     output reg branch,
     output reg mem_read,
     output reg alu_src,
     output reg mem_write,
     output reg reg_write,
     output reg sign_or_zero,
     output reg branch_not_equal,
     output reg [1:0] reg_dst,
     output reg [1:0] mem_to_reg,  
     output reg [2:0] alu_op
);  

always @(*)  
begin  
     if(reset) 
     begin  
          reg_dst = 2'b00;  
          mem_to_reg = 2'b00;  
          alu_op = 3'b000;  
          jump = 1'b0;  
          branch = 1'b0;  
          branch_not_equal = 1'b0;
          mem_read = 1'b0;  
          mem_write = 1'b0;  
          alu_src = 1'b0;  
          reg_write = 1'b0;  
          sign_or_zero = 1'b1;
     end  
     else 
     begin  
          case(opcode)   
               6'b000000:     // R Type
               begin
                    reg_dst = 2'b01;  
                    mem_to_reg = 2'b00;  
                    alu_op = 3'b110;  
                    jump = 1'b0;  
                    branch = 1'b0;  
                    branch_not_equal = 1'b0;
                    mem_read = 1'b0;  
                    mem_write = 1'b0;  
                    alu_src = 1'b0;  
                    reg_write = 1'b1;  
                    sign_or_zero = 1'b1;  
               end
               6'b001000:     // addi
               begin
                    reg_dst = 2'b00;  
                    mem_to_reg = 2'b00;  
                    alu_op = 3'b000;  
                    jump = 1'b0;  
                    branch = 1'b0;  
                    branch_not_equal = 1'b0;
                    mem_read = 1'b0;  
                    mem_write = 1'b0;  
                    alu_src = 1'b1;  
                    reg_write = 1'b1;  
                    sign_or_zero = 1'b1;  
               end
               6'b011000:     // li
               begin
                    reg_write = 1'b1;  
                    reg_dst = 2'b00;  
                    alu_src = 1'b1;  
                    branch = 1'b0;
                    branch_not_equal = 1'b0;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'b00;  
                    jump = 1'b0;  
                    alu_op = 3'b000;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;
               end
               6'b100011:     // lw
               begin
                    reg_dst = 2'b00;  
                    mem_to_reg = 2'b01;  
                    alu_op = 3'b000;  
                    jump = 1'b0;  
                    branch = 1'b0;  
                    branch_not_equal = 1'b0;
                    mem_read = 1'b1;  
                    mem_write = 1'b0;  
                    alu_src = 1'b1;  
                    reg_write = 1'b1;  
                    sign_or_zero = 1'b1;  
               end
               6'b101011:     // sw
               begin
                    reg_dst = 2'bxx;  
                    mem_to_reg = 2'bxx;  
                    alu_op = 3'b000;  
                    jump = 1'b0;  
                    branch = 1'b0;  
                    branch_not_equal = 1'b0;
                    mem_read = 1'b0;  
                    mem_write = 1'b1;  
                    alu_src = 1'b1;  
                    reg_write = 1'b0;  
                    sign_or_zero = 1'b1;  
               end
               6'b000100:     // beq
               begin
                    reg_write = 1'b0;  
                    reg_dst = 2'bxx;  
                    alu_src = 1'b0;  
                    branch = 1'b1;  
                    branch_not_equal = 1'b0;
                    mem_write = 1'b0;  
                    mem_to_reg = 2'bxx;  
                    jump = 1'b0;  
                    alu_op = 3'b001;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;  
               end
               6'b000101:     // bne
               begin
                    reg_write = 1'b0;  
                    reg_dst = 2'bxx;  
                    alu_src = 1'b0;  
                    branch = 1'b0;
                    branch_not_equal = 1'b1;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'bxx;  
                    jump = 1'b0;  
                    alu_op = 3'b001;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;
               end
               6'b001010:     // slti
               begin
                    reg_write = 1'b1;  
                    reg_dst = 2'b00;  
                    alu_src = 1'b1;  
                    branch = 1'b0;
                    branch_not_equal = 1'b0;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'b00;  
                    jump = 1'b0;  
                    alu_op = 3'b101;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;
               end
               6'b000010:     // j
               begin
                    reg_write = 1'b0;  
                    reg_dst = 2'bxx;  
                    alu_src = 1'bx;  
                    branch = 1'bx;
                    branch_not_equal = 1'bx;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'bxx;  
                    jump = 1'b1;  
                    alu_op = 3'bxxx;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;
               end
               6'b000011:     // jal
               begin
                    reg_write = 1'b1;  
                    reg_dst = 2'b10;  
                    alu_src = 1'bx;  
                    branch = 1'bx;
                    branch_not_equal = 1'bx;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'b10;  
                    jump = 1'b1;  
                    alu_op = 3'bxxx;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;
               end
               6'b001100:     // andi
               begin
                    reg_write = 1'b1;  
                    reg_dst = 2'b00;  
                    alu_src = 1'b1;  
                    branch = 1'b0;
                    branch_not_equal = 1'b0;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'b00;  
                    jump = 1'b0;  
                    alu_op = 3'b010;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;
               end
               6'b001101:     // ori
               begin
                    reg_write = 1'b1;  
                    reg_dst = 2'b00;  
                    alu_src = 1'b1;  
                    branch = 1'b0;
                    branch_not_equal = 1'b0;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'b00;  
                    jump = 1'b0;  
                    alu_op = 3'b011;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b1;
               end
               default:
               begin
                    reg_write = 1'b0;  
                    reg_dst = 2'b00;  
                    alu_src = 1'b0;  
                    branch = 1'b0;
                    branch_not_equal = 1'b0;  
                    mem_write = 1'b0;  
                    mem_to_reg = 2'b00;  
                    jump = 1'b0;  
                    alu_op = 3'b000;  
                    mem_read = 1'b0;  
                    sign_or_zero = 1'b0;
               end
          endcase  
     end  
 end  
 endmodule