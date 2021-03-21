
//Name 余忠旻
//Student ID 0716221

module cla_8 (
             AND1, 				//8 bits
             OR1, 				//8 bits             
			 cin,				//1 bit
             cout,				//1 bit
 ) ;
   input  [8-1:0] AND1, OR1;
   input  cin;
   output [8-1:0] cout;

   
   assign cout[0] = AND1[0] | (OR1[0] & cin);
   assign cout[1] = AND1[1] | (OR1[1] & AND1[0]) | (OR1[1] & OR1[0] & cin);
   assign cout[2] = AND1[2] | (OR1[2] & AND1[1]) | (OR1[2] & OR1[1] & AND1[0]) | (OR1[2] & OR1[1] & OR1[0] & cin);
   assign cout[3] = AND1[3] | (OR1[3] & AND1[2]) | (OR1[3] & OR1[2] & AND1[1]) | (OR1[3] & OR1[2] & OR1[1] & AND1[0]) | (OR1[3] & OR1[2] & OR1[1] & OR1[0] & cin);
   assign cout[4] = AND1[4] | (OR1[4] & AND1[3]) | (OR1[4] & OR1[3] & AND1[2]) | (OR1[4] & OR1[3] & OR1[2] & AND1[1]) | (OR1[4] & OR1[3] & OR1[2] & OR1[1] & AND1[0]) | (OR1[4] & OR1[3] & OR1[2] & OR1[1] & OR1[0] & cin);
   assign cout[5] = AND1[5] | (OR1[5] & AND1[4]) | (OR1[5] & OR1[4] & AND1[3]) | (OR1[5] & OR1[4] & OR1[3] & AND1[2]) | (OR1[5] & OR1[4] & OR1[3] & OR1[2] & AND1[1]) | (OR1[5] & OR1[4] & OR1[3] & OR1[2] & OR1[1] & AND1[0]) | (OR1[5] & OR1[4] & OR1[3] & OR1[2] & OR1[1] & OR1[0] & cin);
   assign cout[6] = AND1[6] | (OR1[6] & AND1[5]) | (OR1[6] & OR1[5] & AND1[4]) | (OR1[6] & OR1[5] & OR1[4] & AND1[3]) | (OR1[6] & OR1[5] & OR1[4] & OR1[3] & AND1[2]) | (OR1[6] & OR1[5] & OR1[4] & OR1[3] & OR1[2] & AND1[1]) | (OR1[6] & OR1[5] & OR1[4] & OR1[3] & OR1[2] & OR1[1] & AND1[0]) | (OR1[6] & OR1[5] & OR1[4] & OR1[3] & OR1[2] & OR1[1] & OR1[0] & cin);
   assign cout[7] = AND1[7] | (OR1[7] & AND1[6]) | (OR1[7] & OR1[6] & AND1[5]) | (OR1[7] & OR1[6] & OR1[5] & AND1[4]) | (OR1[7] & OR1[6] & OR1[5] & OR1[4] & AND1[3]) | (OR1[7] & OR1[6] & OR1[5] & OR1[4] & OR1[3] & AND1[2]) | (OR1[7] & OR1[6] & OR1[5] & OR1[4] & OR1[3] & OR1[2] & AND1[1]) | (OR1[7] & OR1[6] & OR1[5] & OR1[4] & OR1[3] & OR1[2] & OR1[1]) & AND1[0] | (OR1[7] & OR1[6] & OR1[5] & OR1[4] & OR1[3] & OR1[2] & OR1[1] & OR1[0] & cin);

   
endmodule


