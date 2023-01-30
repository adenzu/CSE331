module full_adder (a, b, cin, out, cout);
input a;
input b;
input cin;
output out;
output cout;

wire xor1_w;
wire and1_w;
wire and2_w;

xor xor1(xor1_w, a, b);
xor xor2(out, xor1_w, cin);

and and1(and1_w, xor1_w, cin);
and and2(and2_w, a, b);

or or1(cout, and1_w, and2_w);

endmodule