`timescale 1ns/1ps

//`define BONUS

//Name 余忠旻
//Student ID 0716221

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
		   bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );
   

   input           rst_n;
   input [32-1:0]  src1;
   input [32-1:0]  src2;
   input [4-1:0]   ALU_control;
   input [3-1:0]   bonus_control; 

   output [32-1:0] result;
   output          zero;
   output          cout;
   output          overflow;

   reg [32-1:0]    result;
   reg             zero;
   reg             cout;
   reg             overflow;

   
   wire [32-1:0]   re;
   wire [32-1:0]   equal; 	 
   wire            c;
   wire 	   	   set, s;   
   wire 	   	   sign_check, a, sign;
   wire 	  	   eq;
   wire 	   	   flow;
   wire [3-1:0]    c_trol, bc;
   
   alu_32 a1(.src1(src1),
            .src2(src2),
            .less(set),
            .A_invert(ALU_control[3]),
            .B_invert(ALU_control[2]),
            .cin(ALU_control[2]),
            .operation(ALU_control[1:0]),
            .result(re),
            .cout(c),
			.equal(equal),
			.Flow(flow),
            .Sign(sign)
            );
   
   compare_1 com1(.c_trol(c_trol),
                 .bc(bc)
                 );
  
   assign bc = bonus_control;
   
   assign sign_check = equal[31]; 
   assign eq = &equal;   
   assign s = sign_check ? sign : src1[31];

   assign a = ALU_control[1] & ~ALU_control[0];

   
   `ifdef BONUS
      assign set = c_trol[2] ^ ( c_trol[1] & s | c_trol[0] & eq );
   `else
      assign set =  s;
    `endif


   
   always @ ( * ) begin
      if (rst_n) begin
         result <= re;
		 zero <= ~|re;         
		 cout <= c & a;
		 overflow <= flow;         
      end 
   end
   
   

endmodule
