module adder (a, b, cin, out, cout);
input [31:0] a;
input [31:0] b;
input cin;
output [31:0] out;
output cout;

wire [31:0] c;

full_adder fa1(a[0], b[0], 0, out[0], c[0]);
full_adder fa2(a[1], b[1], c[0], out[1], c[1]);
full_adder fa3(a[2], b[2], c[1], out[2], c[2]);
full_adder fa4(a[3], b[3], c[2], out[3], c[3]);
full_adder fa5(a[4], b[4], c[3], out[4], c[4]);
full_adder fa6(a[5], b[5], c[4], out[5], c[5]);
full_adder fa7(a[6], b[6], c[5], out[6], c[6]);
full_adder fa8(a[7], b[7], c[6], out[7], c[7]);
full_adder fa9(a[8], b[8], c[7], out[8], c[8]);
full_adder fa10(a[9], b[9], c[8], out[9], c[9]);
full_adder fa20(a[10], b[10], c[9], out[10], c[10]);
full_adder fa30(a[11], b[11], c[10], out[11], c[11]);
full_adder fa40(a[12], b[12], c[11], out[12], c[12]);
full_adder fa50(a[13], b[13], c[12], out[13], c[13]);
full_adder fa60(a[14], b[14], c[13], out[14], c[14]);
full_adder fa70(a[15], b[15], c[14], out[15], c[15]);
full_adder fa80(a[16], b[16], c[15], out[16], c[16]);
full_adder fa90(a[17], b[17], c[16], out[17], c[17]);
full_adder fa100(a[18], b[18], c[17], out[18], c[18]);
full_adder fa200(a[19], b[19], c[18], out[19], c[19]);
full_adder fa300(a[20], b[20], c[19], out[20], c[20]);
full_adder fa400(a[21], b[21], c[20], out[21], c[21]);
full_adder fa500(a[22], b[22], c[21], out[22], c[22]);
full_adder fa600(a[23], b[23], c[22], out[23], c[23]);
full_adder fa700(a[24], b[24], c[23], out[24], c[24]);
full_adder fa800(a[25], b[25], c[24], out[25], c[25]);
full_adder fa900(a[26], b[26], c[25], out[26], c[26]);
full_adder fa1000(a[27], b[27], c[26], out[27], c[27]);
full_adder fa2000(a[28], b[28], c[27], out[28], c[28]);
full_adder fa3000(a[29], b[29], c[28], out[29], c[29]);
full_adder fa4000(a[30], b[30], c[29], out[30], c[30]);
full_adder fa5000(a[31], b[31], c[30], out[31], c[31]);

endmodule