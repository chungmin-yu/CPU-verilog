// Author: 0716206 陳昱丞, 0716221 余忠旻

module Multiply(
    src1_i,
    src2_i,
    sum_o
    );

//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
output [32-1:0]  sum_o;

//Internal Signals
wire   [64-1:0]	 sum_temp;
wire   [32-1:0]  sum_o;

assign sum_temp = src1_i * src2_i;
assign sum_o = sum_temp[32-1:0];


endmodule
