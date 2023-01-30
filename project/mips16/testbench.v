module testbench;  

reg clock;  
reg reset;  

wire [3:0] rs;
wire [3:0] rt;
wire [3:0] rd;
wire [5:0] opcode;
wire [15:0] pc_out;
wire [15:0] alu_result;
wire [31:0] instr_out;

wire signed [15:0] rs_value;  
wire signed [15:0] rt_value;  
wire signed [15:0] rd_value;  


mips mips_module(  
     .clock(clock),   
     .reset(reset),   
     .pc_out(pc_out),   
     .alu_result(alu_result),  
     .instr_out(instr_out)
);  

assign opcode = instr_out[31:26];
assign rs = instr_out[25:22];
assign rt = instr_out[21:18];
assign rd = instr_out[17:14];
assign rs_value = mips_module.reg_file.reg_array[rs];
assign rt_value = mips_module.reg_file.reg_array[rt];
assign rd_value = mips_module.reg_file.reg_array[rd];



initial $readmemb("../../special1.txt", mips_module.inst_mem.rom); 

initial 
     begin  
          clock = 0;  
          forever 
               begin
                    #10
                    clock = ~clock;
                    if (clock)
                         begin
                              if (pc_out[2])
                                   $display("after");
                              else 
                                   $display("before");
                              $display("pc: %d", pc_out);
                              $display("rs: %d", rs_value);
                              $display("rt: %d", rt_value);
                              if (opcode == 6'b000000)
                                   begin
                                        $display("rd: %d", rd_value);
                                   end
                              $display("--------------------");
                         end
               end  
     end  
initial 
     begin  
          reset = 1;  
          #100;  
          reset = 0;  
     end  
 endmodule 