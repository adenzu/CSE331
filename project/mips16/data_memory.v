module data_memory  
 (  
      input clock,  
      input mem_read,  
      input mem_write_en,  
      input [15:0] mem_access_addr,  
      input [15:0] mem_write_data,  
      output [15:0] mem_read_data  
 );  
reg [15:0] ram [0:65535];  
always @(posedge clock) 
     begin  
          if (mem_write_en)  
               ram[mem_access_addr[15:1]] <= mem_write_data;  
     end  
assign mem_read_data = mem_read ? ram[mem_access_addr[15:1]]: 16'd0;   
 endmodule   