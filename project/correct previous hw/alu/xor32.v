module xor32 (a, b, out);
input [31:0] a;
input [31:0] b;
output [31:0] out;

xor xor_0(out[0], b[0], a[0]);
xor xor_1(out[1], b[1], a[1]);
xor xor_2(out[2], b[2], a[2]);
xor xor_3(out[3], b[3], a[3]);
xor xor_4(out[4], b[4], a[4]);
xor xor_5(out[5], b[5], a[5]);
xor xor_6(out[6], b[6], a[6]);
xor xor_7(out[7], b[7], a[7]);
xor xor_8(out[8], b[8], a[8]);
xor xor_9(out[9], b[9], a[9]);
xor xor_10(out[10], b[10], a[10]);
xor xor_11(out[11], b[11], a[11]);
xor xor_12(out[12], b[12], a[12]);
xor xor_13(out[13], b[13], a[13]);
xor xor_14(out[14], b[14], a[14]);
xor xor_15(out[15], b[15], a[15]);
xor xor_16(out[16], b[16], a[16]);
xor xor_17(out[17], b[17], a[17]);
xor xor_18(out[18], b[18], a[18]);
xor xor_19(out[19], b[19], a[19]);
xor xor_20(out[20], b[20], a[20]);
xor xor_21(out[21], b[21], a[21]);
xor xor_22(out[22], b[22], a[22]);
xor xor_23(out[23], b[23], a[23]);
xor xor_24(out[24], b[24], a[24]);
xor xor_25(out[25], b[25], a[25]);
xor xor_26(out[26], b[26], a[26]);
xor xor_27(out[27], b[27], a[27]);
xor xor_28(out[28], b[28], a[28]);
xor xor_29(out[29], b[29], a[29]);
xor xor_30(out[30], b[30], a[30]);
xor xor_31(out[31], b[31], a[31]);


endmodule