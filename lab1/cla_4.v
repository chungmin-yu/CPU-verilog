
//Name 余忠旻
//Student ID 0716221

module cla_4 (
             AND1,				//4 bits
             OR1,				//4 bits
			 ANDout,			//1 bit
			 ORout,				//1 bit
             cin,				//1 bits
             cout,				//4 bits
 ) ;
   input  [4-1:0] AND1, OR1;
   input  cin;
   output [4-1:0] cout;
   
   wire   and2, or2;
   output ANDout, ORout;

   assign cout[0] = AND1[0] | (OR1[0] & cin);
   assign cout[1] = AND1[1] | (OR1[1] & AND1[0]) | (OR1[1] & OR1[0] & cin);
   assign cout[2] = AND1[2] | (OR1[2] & AND1[1]) | (OR1[2] & OR1[1] & AND1[0]) | (OR1[2] & OR1[1] & OR1[0] & cin);
   
   assign or2 = (OR1[3] & OR1[2] & OR1[1] & OR1[0]);
   assign and2 = AND1[3] | (OR1[3] & AND1[2]) | (OR1[3] & OR1[2] & AND1[1]) | (OR1[3] & OR1[2] & OR1[1] & AND1[0]) ;
   
   assign cout[3] = and2 | (or2 & cin);
   
   assign ANDout = and2;
   assign ORout = or2;
   
endmodule
