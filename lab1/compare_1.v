
//Name 余忠旻
//Student ID 0716221

module compare_1 (
                 bc,                 
				 c_trol
                 ) ;
				   
   
   input  [3-1:0] bc;
   output [3-1:0] c_trol;

   assign c_trol[2] = bc[0] | (~bc[1] & bc[2]);
   assign c_trol[1] = ~bc[2];
   assign c_trol[0] = (bc[1] ^ bc[0]) | bc[2];

   
endmodule 
