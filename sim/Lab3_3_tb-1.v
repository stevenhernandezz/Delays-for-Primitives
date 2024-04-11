/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #3                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #3 Delays for Primitives                                  ***
***                                                                      ***
****************************************************************************
*** Filename: Lab3_3_tb.v          Created by Steven Hernandez, 9/19/23  ***
***                                                                      ***
****************************************************************************
*** This module is a testbench for a provided circuit:                   ***
*** Here we will be testing all possible inputs for our circuit but with ***
*** updated time delays and updated circuit with OR gate and data path   ***
****************************************************************************/


`timescale 1 ns / 1 ns

`define MONITOR_STR_1 	"%d: in1 = %b, in2 = %b, | out = %b A1 = %b A2 = %b A3 = %b NT = %b"

module Lab3_1_tb();
	reg in1, in2;    //registering input
	wire out;        //wiring output

	Lab3_1 UUT(in1,in2,out);
	
	initial begin 
		$monitor(`MONITOR_STR_1, $time, in1, in2, out, UUT.A1, UUT.A2, UUT.NT, UUT.A3);
	end	    //monitoring from main code using UUT.

	initial begin 
	$vcdpluson;    //For graphical viewer
	#15 in1 = 1'b0;
	    in2 = 1'b0;      //testing same inputs 
	#15 in1 = 1'b0;
	    in2 = 1'b1;
	#15 in1 = 1'b1;
	    in2 = 1'b0;
	#15 in1 = 1'b1;
	    in2 = 1'b1;

	#15 $finish;
	end
endmodule 

