/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #3                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #3 Delays for Primitives                                  ***
***                                                                      ***
****************************************************************************
*** Filename: Lab3_2.v          Created by Steven Hernandez, 9/19/23     ***
***                                                                      ***
****************************************************************************
*** This module is for a circuit:                                        ***
*** For this task we will be updating the inital code with updated delays***
****************************************************************************/


`timescale 1 ns / 100 ps

`define PRIMARY_OUT	5	//ns (primary outputs)
`define FAN_OUT_1	0.5	//ns (one output fanout)
`define FAN_OUT_2	1	//ns (two output fanout)        //new time delays!
`define TIME_DELAY_1	1	//ns (one input gates)
`define TIME_DELAY_2	2	//ns (two input gates)
`define TIME_DELAY_3	4	//ns (three input gates)


module Lab3_1 (in1,in2,out1);
	input in1,in2;    //inputs
	output out1;      //output

	wire NT,A1,A2;

	not #(`TIME_DELAY_1 + `FAN_OUT_2) NOT1(NT,in1);   // NOT gate
	and #(`TIME_DELAY_2 + `FAN_OUT_1)  AND1(A1,in2,in1);    //AND gate
	and #(`TIME_DELAY_2 + `FAN_OUT_1)  AND2(A2,in1,NT);    //AND gate
	nand #(`TIME_DELAY_3 + `PRIMARY_OUT) NAND1(out1,NT,A1,A2);    //NAND gate
 
endmodule
