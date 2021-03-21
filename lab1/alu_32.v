
//Name 余忠旻
//Student ID 0716221

module alu_32 (
              src1, 			//32 bits source 1 (input)
              src2, 			//32 bits source 2 (input)
              less, 			//1 bit less (input)
              A_invert,			//1 bit A_invert (input)
              B_invert,			//1 bit B_invert (input)
              cin, 				//1 bit carry in (input)
              operation, 		//last 2 bits operation (input)
              result, 			//32 bits result (output)
              cout, 			//1 bit carry out (output)
			  equal, 			//32 bits equal
			  Flow, 			//1 bit overflow
              Sign				//1 bit sign
) ;
   input [32-1:0]  src1, src2;
   input 	  	   cin, less;
   input           A_invert, B_invert;
   input [2-1:0]   operation;
   
   output 	 	   cout;   
   output [32-1:0] result;
   
   wire [8-1:0]    c;
   wire [8-1:0]    and1, or1;
   

   output 	   	   Flow;
   output          Sign;   
   wire [4-1:0]    flow;
   
   output [32-1:0] equal;   
   
   
   cla_8 cl(.AND1(and1),
        .OR1(or1),
        .cin(cin),
        .cout(c));

   alu_4 e1(.src1(src1[4-1:0]),
           .src2(src2[4-1:0]),
           .less(less),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(cin),
           .operation(operation),
           .result(result[4-1:0]),
           .AND1(and1[0]),
           .OR1(or1[0]),
		   .equal(equal[4-1:0])
           );

   alu_4 e2(.src1(src1[8-1:4]),
           .src2(src2[8-1:4]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[0]),
           .operation(operation),
           .result(result[8-1:4]),
           .AND1(and1[1]),
           .OR1(or1[1]),
		   .equal(equal[8-1:4])           
           );

   alu_4 e3(.src1(src1[12-1:8]),
           .src2(src2[12-1:8]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[1]),
           .operation(operation),
           .result(result[12-1:8]),
           .AND1(and1[2]),
           .OR1(or1[2]),
		   .equal(equal[12-1:8])
           );
   alu_4 e4(.src1(src1[16-1:12]),
           .src2(src2[16-1:12]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[2]),
           .operation(operation),
           .result(result[16-1:12]),
           .AND1(and1[3]),
           .OR1(or1[3]),
		   .equal(equal[16-1:12])
           );
   alu_4 e5(.src1(src1[20-1:16]),
           .src2(src2[20-1:16]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[3]),
           .operation(operation),
           .result(result[20-1:16]),
           .AND1(and1[4]),
           .OR1(or1[4]),
		   .equal(equal[20-1:16])
           );
   alu_4 e6(.src1(src1[24-1:20]),
           .src2(src2[24-1:20]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[4]),
           .operation(operation),
           .result(result[24-1:20]),
           .AND1(and1[5]),
           .OR1(or1[5]),
		   .equal(equal[24-1:20])
           );
   alu_4 e7(.src1(src1[28-1:24]),
           .src2(src2[28-1:24]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[5]),
           .operation(operation),
           .result(result[28-1:24]),
           .AND1(and1[6]),
           .OR1(or1[6]),
		   .equal(equal[28-1:24])
           );
   alu_4 e8(.src1(src1[32-1:28]),
           .src2(src2[32-1:28]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[6]),
           .operation(operation),
           .result(result[32-1:28]),
           .AND1(and1[7]),
           .OR1(or1[7]),
		   .equal(equal[32-1:28]),
		   .cout(flow)
           );
   
   assign cout = c[7];
   assign Flow = c[7] ^ flow[2];
   assign Sign = equal[31] ^ flow[2];
   
   
endmodule 
