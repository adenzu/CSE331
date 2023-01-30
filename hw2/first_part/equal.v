module equal(a, b, out);
input [31:0] a;
input [31:0] b;
output out;

wire [31:0] xor_w;
wire [15:0] or_w;
wire [7:0] or_w1;
wire [3:0] or_w2;
wire [1:0] or_w3;
wire not_out;

xor xor0(xor_w[0], a[0], b[0]);
xor xor1(xor_w[1], a[1], b[1]);
xor xor2(xor_w[2], a[2], b[2]);
xor xor3(xor_w[3], a[3], b[3]);
xor xor4(xor_w[4], a[4], b[4]);
xor xor5(xor_w[5], a[5], b[5]);
xor xor6(xor_w[6], a[6], b[6]);
xor xor7(xor_w[7], a[7], b[7]);
xor xor8(xor_w[8], a[8], b[8]);
xor xor9(xor_w[9], a[9], b[9]);
xor xor10(xor_w[10], a[10], b[10]);
xor xor11(xor_w[11], a[11], b[11]);
xor xor12(xor_w[12], a[12], b[12]);
xor xor13(xor_w[13], a[13], b[13]);
xor xor14(xor_w[14], a[14], b[14]);
xor xor15(xor_w[15], a[15], b[15]);
xor xor16(xor_w[16], a[16], b[16]);
xor xor17(xor_w[17], a[17], b[17]);
xor xor18(xor_w[18], a[18], b[18]);
xor xor19(xor_w[19], a[19], b[19]);
xor xor20(xor_w[20], a[20], b[20]);
xor xor21(xor_w[21], a[21], b[21]);
xor xor22(xor_w[22], a[22], b[22]);
xor xor23(xor_w[23], a[23], b[23]);
xor xor24(xor_w[24], a[24], b[24]);
xor xor25(xor_w[25], a[25], b[25]);
xor xor26(xor_w[26], a[26], b[26]);
xor xor27(xor_w[27], a[27], b[27]);
xor xor28(xor_w[28], a[28], b[28]);
xor xor29(xor_w[29], a[29], b[29]);
xor xor30(xor_w[30], a[30], b[30]);
xor xor31(xor_w[31], a[31], b[31]);

or or0(or_w[0], xor_w[0], xor_w[1]);
or or1(or_w[1], xor_w[2], xor_w[3]);
or or2(or_w[2], xor_w[4], xor_w[5]);
or or3(or_w[3], xor_w[6], xor_w[7]);
or or4(or_w[4], xor_w[8], xor_w[9]);
or or5(or_w[5], xor_w[10], xor_w[11]);
or or6(or_w[6], xor_w[12], xor_w[13]);
or or7(or_w[7], xor_w[14], xor_w[15]);
or or8(or_w[8], xor_w[16], xor_w[17]);
or or9(or_w[9], xor_w[18], xor_w[19]);
or or10(or_w[10], xor_w[20], xor_w[21]);
or or11(or_w[11], xor_w[22], xor_w[23]);
or or12(or_w[12], xor_w[24], xor_w[25]);
or or13(or_w[13], xor_w[26], xor_w[27]);
or or14(or_w[14], xor_w[28], xor_w[29]);
or or15(or_w[15], xor_w[30], xor_w[31]);

or or00(or_w1[0], or_w[0], or_w[1]);
or or01(or_w1[1], or_w[2], or_w[3]);
or or02(or_w1[2], or_w[4], or_w[5]);
or or03(or_w1[3], or_w[6], or_w[7]);
or or04(or_w1[4], or_w[8], or_w[9]);
or or05(or_w1[5], or_w[10], or_w[11]);
or or06(or_w1[6], or_w[12], or_w[13]);
or or07(or_w1[7], or_w[14], or_w[15]);

or or000(or_w2[0], or_w1[0], or_w1[1]);
or or001(or_w2[1], or_w1[2], or_w1[3]);
or or002(or_w2[2], or_w1[4], or_w1[5]);
or or003(or_w2[3], or_w1[6], or_w1[7]);

or or0000(or_w3[0], or_w2[0], or_w2[1]);
or or0001(or_w3[1], or_w2[2], or_w2[3]);

or or_not_out(not_out, or_w3[0], or_w3[1]);

not not0(out, not_out);

endmodule