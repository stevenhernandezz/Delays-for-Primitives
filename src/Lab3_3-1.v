/***************************************************************************
***                                                                      ***
*** EE 526 L Experiment #3                  Steven Hernandez, Fall, 2023 ***
***                                                                      ***
*** Experiment #3 Delays for Primitives                                  ***
***                                                                      ***
****************************************************************************
*** Filename: Lab3_3.v          Created by Steven Hernandez, 9/19/23     ***
***                                                                      ***
****************************************************************************
*** This module is for a circuit:                                        ***
*** For this task we will be updating the inital code with updated delays***
*** as well as updating the circuit with an or gate and updated path     ***
****************************************************************************/


`timescale 1 ns / 100 ps

`define PRIMARY_OUT	5	//ns (primary outputs)
`define FAN_OUT_1	0.5	//ns (one output fanout)
`define FAN_OUT_2	1	//ns (two output fanout)
`define FAN_OUT_3	1.5	//ns (two output fanout)
`define TIME_DELAY_1	1	//ns (one input gates)
`define TIME_DELAY_2	2	//ns (two input gates)
`define TIME_DELAY_3	4	//ns (three input gates)
`define TIME_DELAY_4	5	//ns (four input gates)    //same delays but new gate


module Lab3_1 (in1,in2,out1);
	input in1,in2;      //inputs
	output out1;        //outputs

	wire NT,A1,A2,A3;    //wiring outputs

	not #(`TIME_DELAY_1 + `FAN_OUT_3) NOT1(NT,in1);    //NOT gate
	and #(`TIME_DELAY_2 + `FAN_OUT_1)  AND1(A1,in2,in1);  //AND gate
	and #(`TIME_DELAY_2 + `FAN_OUT_2)  AND2(A2,in1,NT);  //AND gate
	or #(`TIME_DELAY_2 + `FAN_OUT_1)   ORR(A3,A2,NT);    //new OR gate
	nand #(`TIME_DELAY_4 + `PRIMARY_OUT) NAND1(out1,NT,A1,A2,A3);    //AND gate
endmodule
