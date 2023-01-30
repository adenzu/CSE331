module instruction_memory(  
     input [15:0] pc,  
     output wire [31:0] instruction  
);  
reg [31:0] rom [0:1023];  
assign instruction = rom[pc[11:2]];  
endmodule 