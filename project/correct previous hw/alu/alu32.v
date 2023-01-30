module alu32 (clock, reset, shamt, a, b, aluop, result);
input clock;
input reset;
input [3:0] shamt;
input [31:0] a;
input [31:0] b;
input [2:0] aluop;
output [31:0] result;

reg [31:0] _result;

always @(*)
    begin
        case (aluop)
            3'b011: result = _result << shamt;
            3'b111: result = _result >> shamt;
            default: result = _result;
        endcase        
    end

wire [31:0] add_w;
wire [31:0] sub_w;
wire [31:0] mult_w;
wire [31:0] xor_w;
wire [31:0] and_w;
wire [31:0] or_w;
wire [31:0] slt_w;
wire [31:0] nor_w;

wire trash;

add32 add0(a, b, 0, add_w, trash);
sub32 sub0(a, b, 0, sub_w, trash);
mult32 mult0(clock, reset, a, b, mult_w);
xor32 xor0(a, b, xor_w);    // 011
and32 and00(a, b, and_w);
or32 or0(a, b, or_w);
slt32 slt0(a, b, slt_w);
nor32 nor0(a, b, nor_w);    // 111

mux3x8 mux_0({nor_w[0], slt_w[0], or_w[0], and_w[0], xor_w[0], mult_w[0], sub_w[0], add_w[0]}, aluop, result[0]);
mux3x8 mux_1({nor_w[1], slt_w[1], or_w[1], and_w[1], xor_w[1], mult_w[1], sub_w[1], add_w[1]}, aluop, result[1]);
mux3x8 mux_2({nor_w[2], slt_w[2], or_w[2], and_w[2], xor_w[2], mult_w[2], sub_w[2], add_w[2]}, aluop, result[2]);
mux3x8 mux_3({nor_w[3], slt_w[3], or_w[3], and_w[3], xor_w[3], mult_w[3], sub_w[3], add_w[3]}, aluop, result[3]);
mux3x8 mux_4({nor_w[4], slt_w[4], or_w[4], and_w[4], xor_w[4], mult_w[4], sub_w[4], add_w[4]}, aluop, result[4]);
mux3x8 mux_5({nor_w[5], slt_w[5], or_w[5], and_w[5], xor_w[5], mult_w[5], sub_w[5], add_w[5]}, aluop, result[5]);
mux3x8 mux_6({nor_w[6], slt_w[6], or_w[6], and_w[6], xor_w[6], mult_w[6], sub_w[6], add_w[6]}, aluop, result[6]);
mux3x8 mux_7({nor_w[7], slt_w[7], or_w[7], and_w[7], xor_w[7], mult_w[7], sub_w[7], add_w[7]}, aluop, result[7]);
mux3x8 mux_8({nor_w[8], slt_w[8], or_w[8], and_w[8], xor_w[8], mult_w[8], sub_w[8], add_w[8]}, aluop, result[8]);
mux3x8 mux_9({nor_w[9], slt_w[9], or_w[9], and_w[9], xor_w[9], mult_w[9], sub_w[9], add_w[9]}, aluop, result[9]);
mux3x8 mux_10({nor_w[10], slt_w[10], or_w[10], and_w[10], xor_w[10], mult_w[10], sub_w[10], add_w[10]}, aluop, result[10]);
mux3x8 mux_11({nor_w[11], slt_w[11], or_w[11], and_w[11], xor_w[11], mult_w[11], sub_w[11], add_w[11]}, aluop, result[11]);
mux3x8 mux_12({nor_w[12], slt_w[12], or_w[12], and_w[12], xor_w[12], mult_w[12], sub_w[12], add_w[12]}, aluop, result[12]);
mux3x8 mux_13({nor_w[13], slt_w[13], or_w[13], and_w[13], xor_w[13], mult_w[13], sub_w[13], add_w[13]}, aluop, result[13]);
mux3x8 mux_14({nor_w[14], slt_w[14], or_w[14], and_w[14], xor_w[14], mult_w[14], sub_w[14], add_w[14]}, aluop, result[14]);
mux3x8 mux_15({nor_w[15], slt_w[15], or_w[15], and_w[15], xor_w[15], mult_w[15], sub_w[15], add_w[15]}, aluop, result[15]);
mux3x8 mux_16({nor_w[16], slt_w[16], or_w[16], and_w[16], xor_w[16], mult_w[16], sub_w[16], add_w[16]}, aluop, result[16]);
mux3x8 mux_17({nor_w[17], slt_w[17], or_w[17], and_w[17], xor_w[17], mult_w[17], sub_w[17], add_w[17]}, aluop, result[17]);
mux3x8 mux_18({nor_w[18], slt_w[18], or_w[18], and_w[18], xor_w[18], mult_w[18], sub_w[18], add_w[18]}, aluop, result[18]);
mux3x8 mux_19({nor_w[19], slt_w[19], or_w[19], and_w[19], xor_w[19], mult_w[19], sub_w[19], add_w[19]}, aluop, result[19]);
mux3x8 mux_20({nor_w[20], slt_w[20], or_w[20], and_w[20], xor_w[20], mult_w[20], sub_w[20], add_w[20]}, aluop, result[20]);
mux3x8 mux_21({nor_w[21], slt_w[21], or_w[21], and_w[21], xor_w[21], mult_w[21], sub_w[21], add_w[21]}, aluop, result[21]);
mux3x8 mux_22({nor_w[22], slt_w[22], or_w[22], and_w[22], xor_w[22], mult_w[22], sub_w[22], add_w[22]}, aluop, result[22]);
mux3x8 mux_23({nor_w[23], slt_w[23], or_w[23], and_w[23], xor_w[23], mult_w[23], sub_w[23], add_w[23]}, aluop, result[23]);
mux3x8 mux_24({nor_w[24], slt_w[24], or_w[24], and_w[24], xor_w[24], mult_w[24], sub_w[24], add_w[24]}, aluop, result[24]);
mux3x8 mux_25({nor_w[25], slt_w[25], or_w[25], and_w[25], xor_w[25], mult_w[25], sub_w[25], add_w[25]}, aluop, result[25]);
mux3x8 mux_26({nor_w[26], slt_w[26], or_w[26], and_w[26], xor_w[26], mult_w[26], sub_w[26], add_w[26]}, aluop, result[26]);
mux3x8 mux_27({nor_w[27], slt_w[27], or_w[27], and_w[27], xor_w[27], mult_w[27], sub_w[27], add_w[27]}, aluop, result[27]);
mux3x8 mux_28({nor_w[28], slt_w[28], or_w[28], and_w[28], xor_w[28], mult_w[28], sub_w[28], add_w[28]}, aluop, result[28]);
mux3x8 mux_29({nor_w[29], slt_w[29], or_w[29], and_w[29], xor_w[29], mult_w[29], sub_w[29], add_w[29]}, aluop, result[29]);
mux3x8 mux_30({nor_w[30], slt_w[30], or_w[30], and_w[30], xor_w[30], mult_w[30], sub_w[30], add_w[30]}, aluop, result[30]);
mux3x8 mux_31({nor_w[31], slt_w[31], or_w[31], and_w[31], xor_w[31], mult_w[31], sub_w[31], add_w[31]}, aluop, result[31]);

endmodule