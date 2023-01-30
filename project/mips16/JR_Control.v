module JR_Control( 
   input [2:0] alu_op, 
   input [5:0] funct,
   output jrcont
);
assign jrcont = {alu_op,funct} == 9'b110001000;
endmodule