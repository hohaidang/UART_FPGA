
module DE1_SOC_golden_top(
	input CLOCK_50,

   ///////// GPIO /////////
	inout       [1:0] GPIO_0,


   ///////// LEDR /////////
   output      [9:0]  LEDR,

   ///////// SW /////////
   input       [8:0]  SW,
	
	//////// KEY /////////
	input 		[0:0]KEY
);
	
	uart_tx #(.CLKS_PER_BIT(1)) u0	(.i_Clock(CLOCK_50),
												 .i_Tx_DV(SW[0]),
												 .i_Tx_Byte(SW[8:1]),
												 .o_Tx_Active(),
												 .o_Tx_Serial(GPIO_0[0]),
												 .o_Tx_Done()
												);

	uart_rx #(.CLKS_PER_BIT(1)) u1	(.KEY_rst(KEY[0]),
												 .i_Clock(CLOCK_50),
												 .i_Rx_Serial(GPIO_0[1]),
												 .o_Rx_DV(),
												 .o_Rx_Byte(LEDR[8:1])
												);
endmodule
