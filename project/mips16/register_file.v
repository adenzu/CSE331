module register_file(  
     input clock,  
     input reset,  
     input reg_write_en,  
     input [3:0] reg_write_dest,  
     input [3:0] reg_read_addr_1,  
     input [3:0] reg_read_addr_2, 
     input [15:0] reg_write_data,   
     output [15:0] reg_read_data_1,  
     output [15:0] reg_read_data_2  
);  
reg [15:0] reg_array [0:15];  
always @(posedge clock or posedge reset) 
     begin  
          if(reset) 
          begin  
               reg_array[0] <= 16'b0;  
               reg_array[1] <= 16'b0;  
               reg_array[2] <= 16'b0;  
               reg_array[3] <= 16'b0;  
               reg_array[4] <= 16'b0;  
               reg_array[5] <= 16'b0;  
               reg_array[6] <= 16'b0;  
               reg_array[7] <= 16'b0; 
               reg_array[8] <= 16'b0;  
               reg_array[9] <= 16'b0;  
               reg_array[10] <= 16'b0;  
               reg_array[11] <= 16'b0;  
               reg_array[12] <= 16'b0;  
               reg_array[13] <= 16'b0;  
               reg_array[14] <= 16'b0;  
               reg_array[15] <= 16'b0;       
          end  
          else 
          begin  
               if(reg_write_en) 
               begin  
                    reg_array[reg_write_dest] <= reg_write_data;  
               end  
          end  
     end  
assign reg_read_data_1 = ( reg_read_addr_1 == 0) ? 16'b0 : reg_array[reg_read_addr_1];  
assign reg_read_data_2 = ( reg_read_addr_2 == 0) ? 16'b0 : reg_array[reg_read_addr_2];  
 endmodule 