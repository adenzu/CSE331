module sub32 (a, b, cin, out, ccout);
input [31:0] a;
input [31:0] b;
input cin;
output [31:0] out;
output ccout;

wire [31:0] not_out;
wire [31:0] temp_out;
wire [31:0] cout;


not not0(temp_out[0], b[0]);
not not1(temp_out[1], b[1]);
not not2(temp_out[2], b[2]);
not not3(temp_out[3], b[3]);
not not4(temp_out[4], b[4]);
not not5(temp_out[5], b[5]);
not not6(temp_out[6], b[6]);
not not7(temp_out[7], b[7]);
not not8(temp_out[8], b[8]);
not not9(temp_out[9], b[9]);
not not10(temp_out[10], b[10]);
not not11(temp_out[11], b[11]);
not not12(temp_out[12], b[12]);
not not13(temp_out[13], b[13]);
not not14(temp_out[14], b[14]);
not not15(temp_out[15], b[15]);
not not16(temp_out[16], b[16]);
not not17(temp_out[17], b[17]);
not not18(temp_out[18], b[18]);
not not19(temp_out[19], b[19]);
not not20(temp_out[20], b[20]);
not not21(temp_out[21], b[21]);
not not22(temp_out[22], b[22]);
not not23(temp_out[23], b[23]);
not not24(temp_out[24], b[24]);
not not25(temp_out[25], b[25]);
not not26(temp_out[26], b[26]);
not not27(temp_out[27], b[27]);
not not28(temp_out[28], b[28]);
not not29(temp_out[29], b[29]);
not not30(temp_out[30], b[30]);
not not31(temp_out[31], b[31]);

add32 add_10(temp_out, 32'b1, 0, not_out, cout);
add32 add_1(a, not_out, cin, out, cout);

endmodule