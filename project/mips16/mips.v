module mips( 
     input clock,
     input reset,  
     output [15:0] pc_out,
     output [15:0] alu_result,
     output [31:0] instr_out
);

reg [15:0] pc_current;

wire jump;
wire branch;
wire alu_src;  
wire mem_read;
wire mem_write;
wire reg_write;
wire JRControl;  
wire zero_flag;  
wire beq_control;
wire bne_control;  
wire sign_or_zero;  
wire branch_not_equal;
wire [1:0] reg_dst;
wire [1:0] mem_to_reg;  
wire [2:0] alu_op;
wire [2:0] ALU_Control;  
wire [3:0] reg_write_dest;  
wire [3:0] reg_read_addr_1;  
wire [3:0] reg_read_addr_2;   
wire [15:0] ALU_out;  
wire [15:0] imm_ext;  
wire [15:0] read_data2;
wire [15:0] no_sign_ext;  
wire [15:0] mem_read_data;  
wire [15:0] reg_write_data;  
wire [15:0] reg_read_data_1;  
wire [15:0] reg_read_data_2; 
wire [31:0] instr;  

wire signed [15:0] im_shift_1;
wire signed [15:0] PC_j;
wire signed [15:0] PC_beq;
wire signed [15:0] PC_4beq;
wire signed [15:0] PC_4beqj;
wire signed [15:0] PC_jr;  
wire signed [15:0] pc_next;
wire signed [15:0] pc_incr;
 
always @(posedge clock or posedge reset)  
     begin   
          if(reset) 
               pc_current <= 16'd0;  
          else
               pc_current <= pc_next;  
     end

assign instr_out = instr;
assign pc_incr = pc_current + 16'd4; 
assign reg_read_addr_1 = instr[25:22];  
assign reg_read_addr_2 = instr[21:18];  
assign imm_ext = instr[17:2];  
assign im_shift_1 = {imm_ext[13:0],2'b0};  
assign no_sign_ext = ~(im_shift_1) + 1'b1;  
assign beq_control = branch & zero_flag;  
assign bne_control = branch_not_equal & ~zero_flag;
assign PC_j = instr[25:16];  
assign PC_jr = reg_read_data_1;  
assign pc_out = pc_current;  
assign alu_result = ALU_out;  

assign reg_write_dest = (reg_dst==2'b10) ? 4'b1111: ((reg_dst==2'b01) ? instr[17:14] : instr[21:18]);  
assign read_data2 = alu_src ? imm_ext : reg_read_data_2;  
assign PC_beq = im_shift_1[15] ? (pc_incr - no_sign_ext): (pc_incr + im_shift_1);  
assign PC_4beq = (beq_control | bne_control) ? PC_beq : pc_incr;  
assign PC_4beqj = jump ? PC_j : PC_4beq;  
assign pc_next = JRControl ? PC_jr : PC_4beqj;  
assign reg_write_data = (mem_to_reg == 2'b10) ? pc_incr : ((mem_to_reg == 2'b01) ? mem_read_data : ALU_out);  

instruction_memory inst_mem(
     .pc(pc_current),
     .instruction(instr)
);  
  
control control_unit(
     .reset(reset),
     .opcode(instr[31:26]),
     .reg_dst(reg_dst),
     .mem_to_reg(mem_to_reg),
     .alu_op(alu_op),
     .jump(jump),
     .branch(branch),
     .mem_read(mem_read),  
     .mem_write(mem_write),
     .alu_src(alu_src),
     .reg_write(reg_write),
     .sign_or_zero(sign_or_zero),
     .branch_not_equal(branch_not_equal)
);  

register_file reg_file(
     .clock(clock),
     .reset(reset),
     .reg_write_en(reg_write),  
     .reg_write_dest(reg_write_dest),  
     .reg_write_data(reg_write_data),  
     .reg_read_addr_1(reg_read_addr_1),  
     .reg_read_data_1(reg_read_data_1),  
     .reg_read_addr_2(reg_read_addr_2),  
     .reg_read_data_2(reg_read_data_2)
); 

JR_Control JRControl_unit(
     .alu_op(alu_op),
     .funct(instr[9:4]),
     .jrcont(JRControl)
);       

alu_control ALU_Control_unit(
     .ALUOp(alu_op),
     .func(instr[9:4]),
     .ALU_Control(ALU_Control)
);  

alu alu_unit(
     .a(reg_read_data_1),
     .b(read_data2),
     .shamt(instr[13:10]),
     .alu_control(ALU_Control),
     .result(ALU_out),
     .zero(zero_flag)
);  

data_memory datamem(
     .clock(clock),
     .mem_access_addr(ALU_out),  
     .mem_write_data(reg_read_data_2),
     .mem_write_en(mem_write),
     .mem_read(mem_read),  
     .mem_read_data(mem_read_data)
); 

endmodule  