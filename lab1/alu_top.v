`timescale 1ns/1ps

//Name 余忠旻
//Student ID 0716221

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
             //cout,       //1 bit carry out(output)
               and1,       //1 bit 
               or1,        //1 bit 
			   equal,      //1 bit equal
               );

   input         src1;
   input         src2;
   input         less;
   input 	 	 A_invert;
   input         B_invert;
   input         cin;
   input [2-1:0] operation;

   output        result;
 //output 	 	 cout;

   reg 		 	 result;
   output        and1, or1;    
   
   wire 	 AND, OR, ADD;
   wire 	 in1,in2;
   output 	 equal;	 
   
   assign src_in1 = A_invert ^ src1;
   assign src_in2 = B_invert ^ src2;

   assign equal = src_in1 ^ src_in2;
   
   assign AND = src_in1 & src_in2; 					//and1
   assign OR  = src_in1 | src_in2; 					//or1
   assign ADD = equal ^ cin;
   

   assign and1 = AND;
   assign or1 = OR;
   
   always@( * )
     begin
	case (operation)
	  2'b00 : result = AND;
	  2'b01 : result = OR;
	  2'b10 : result = ADD;
	  2'b11 : result = less;
	endcase
	
     end

endmodule
