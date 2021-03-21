
//Name 余忠旻
//Student ID 0716221

module alu_4 (
             src1,				//4 bits source 1 (input)
             src2,				//4 bits souece 2 (input)
             less, 				//1 bit less (input)
             A_invert, 			//1 bit A_invert (input)
             B_invert, 			//1 bit B_invert (input)
             cin, 				//1 bit carry in (input)
             operation, 		//last 2 bits operation (input) 
             result, 			//4 bits result (output)
             cout, 				//4 bits carry out (output)
             AND1, 				//1 bit
             OR1,  				//1 bit
			 equal, 			//4 bits equal
) ;
   
   input [4-1:0] src1, src2;
   input         cin, less;
   input         A_invert, B_invert;
   input [2-1:0] operation;

   output  AND1, OR1;
   output [4-1:0] result;
   output [4-1:0] cout;   
      
   wire   [4-1:0] c;
   wire   [4-1:0] and1, or1;     
   
   output [4-1:0] equal;  
   

   
   
   cla_4 cl(.AND1(and1),
           .OR1(or1),
           .cin(cin),
           .cout(c),
		   .ANDout(AND1),
           .ORout(OR1)
           );
   
   
   alu_top a1(.src1(src1[0]),
              .src2(src2[0]),
              .less(less),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(cin),
              .operation(operation),
              .result(result[0]),
              .and1(and1[0]),
              .or1(or1[0]),
			  .equal(equal[0])
              );

   alu_top a2(.src1(src1[1]),
              .src2(src2[1]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[0]),
              .operation(operation),
              .result(result[1]),
              .and1(and1[1]),
              .or1(or1[1]),
			  .equal(equal[1])
              );

   alu_top a3(.src1(src1[2]),
              .src2(src2[2]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[1]),
              .operation(operation),
              .result(result[2]),
              .and1(and1[2]),
              .or1(or1[2]),
			  .equal(equal[2])	      
              );

   alu_top a4(.src1(src1[3]),
              .src2(src2[3]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[2]),
              .operation(operation),
              .result(result[3]),
              .and1(and1[3]),
              .or1(or1[3]),
			  .equal(equal[3])	      
              );

   
   assign cout = c;

   
endmodule 
