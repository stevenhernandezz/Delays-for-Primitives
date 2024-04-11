/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #3                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #3 Delays for Primitives                                  ***
***                                                                      ***
****************************************************************************
*** Filename: Lab3_1_tb.v          Created by Steven Hernandez, 9/19/23  ***
***                                                                      ***
****************************************************************************
*** This module is a testbench for a provided circuit:                   ***
*** Here we will be testing all possible inuts for our circuit           ***  
****************************************************************************/

`timescale 1 ns / 1 ns

`define MONITOR_STR_1 	"%d: in1 = %b, in2 = %b, | out = %b A1 = %b A2 = %b NT = %b"

module Lab3_1_tb();
	reg in1, in2;    //register our inputs
	wire out;      //wiring outputs

	Lab3_1 UUT(in1,in2,out);    //calling initial input
	
	initial begin 
		$monitor(`MONITOR_STR_1, $time, in1, in2, out, UUT.A1, UUT.A2, UUT.NT);
	end	      //monitoring components from this file and main file using UUT.

	initial begin 
	$vcdpluson;    //For graphical viewer
	#15 in1 = 1'b0;      //testing inputs
	    in2 = 1'b0;
	#15 in1 = 1'b0;
	    in2 = 1'b1;
	#15 in1 = 1'b1;
	    in2 = 1'b0;
	#15 in1 = 1'b1;
	    in2 = 1'b1;

	#15 $finish;
	end
endmodule 

