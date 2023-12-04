/*
 * Authors: Jacob MacDonald, Manav Sohi
 * ID: B00834513, B00844935
 * Date: Nov 25, 2023
 * Purpose: This module acts as a controller for the beamformer. It connects all the signals for 
 * 			different components of the beamformer, which are: 
 *					1. FIR II filter,
 *					2. Dual Port BRAM that hold data for:
 * 					1. Raw Data - This is the input data to the beamformer from the ADC's
 *						2. Filtered Data - This is the output of the FIR II filter.
 *						3. Processed Data - This is the data from the filtered ram broken down 
 *                                    and stored as 3 32-bit values each.
 *						4. Delays Data - This is the data used to index the processed data to find 
 * 										  output data for each channel.
 *						5. Output Data - This is all the output data from each channel contatented into single ram.
 *						6. Sum Data - This is the data after summing indices from each channel, this data will
 *										  be processed in MATLAB to form the images.
 *
*/

module controller(
	input clk50, // This is the 50MHz clock signal from DE2 board.
	input start_key, // This is the key[0] of the DE2 board. Used to start the controller state machine.
	input tx_key, // This is the key[1] of the DE2 board. Used to start the Transmission of data to PC.
	output reg [0:6]seg, // This is the HEX[0] of the DE2 board. Used to display current state of the controller.
	output reg [0:6]seg1, // This is the HEX[1] of the DE2 board. Used for debug info.
	output reg [0:6]seg2, // This is the HEX[2] of the DE2 board. Used for debug info.
	output com_UART_TXD, // Transmit bit
	input com_UART_RXD // Recieve bit
);


// Filter signals:
wire [95:0] data_out;
wire filt_valid;
reg reset = 1;

// Raw data ram signals:
reg ram_read_en = 0; 
wire ram_write_en;
reg [13:0]ram_read_addr = 0;
wire [13:0]ram_write_addr;
wire [15:0]ram_data_in;
wire [15:0]ram_data_out;

// Filtered data ram signals:
reg filt_read_en = 0, filt_write_en = 0;
reg [10:0]filt_read_addr = 0;
reg [10:0]filt_write_addr = 0;
reg [95:0]filt_ram_data_in;
wire [95:0]filt_ram_data_out;

// Processed data ram signals:
reg proc_read_en = 0, proc_write_en = 0;
reg [12:0]proc_read_addr = 0;
reg [12:0]proc_write_addr = 0;
reg [31:0]proc_ram_data_in;
wire [31:0]proc_ram_data_out;

// Delay data ram signals:
reg delay_read_en = 0, delay_write_en = 0;
reg [12:0]delay_read_addr = 0;
reg [12:0]delay_write_addr = 0;
reg [12:0]delay_ram_data_in = 0;
wire [12:0]delay_ram_data_out;

// Output data ram signals:
reg output_read_en = 0, output_write_en = 0;
reg [12:0]output_read_addr = 0;
reg [12:0]output_write_addr = 0;
reg [31:0]output_ram_data_in;
wire [31:0]output_ram_data_out;

// Sum data ram signals:
reg sum_read_en = 0; 
reg sum_write_en = 0;
reg [9:0]sum_read_addr = 0;
reg [9:0]sum_write_addr = 0;
reg [39:0]sum_ram_data_in;
wire [39:0]sum_ram_data_out;

// PLL signals:
reg pll_reset = 0;
wire clk;				// 100MHz clock signal output from PLL core.
wire pll_locked;
reg pll_on = 0; 		// Flag to start the state machine for controller once the 100 MHz output is available.

// Module instantiation:
PLL pll1				(pll_reset, clk50, clk, pll_locked);
ram rr1				(clk, ram_data_in, ram_read_addr, ram_read_en, ram_write_addr, ram_write_en, ram_data_out);
filter_test ff1	(clk, reset, ram_data_out, filt_valid, data_out);
filtered_ram rr2	(clk, data_out, filt_read_addr, filt_read_en, filt_write_addr, filt_write_en, filt_ram_data_out);
processed_ram rr3	(clk, proc_ram_data_in, proc_read_addr, proc_read_en, proc_write_addr, proc_write_en, proc_ram_data_out);
delays_ram rr4		(clk, delay_ram_data_in, delay_read_addr, delay_read_en, delay_write_addr, delay_write_en, delay_ram_data_out);
output_ram rr5		(clk, output_ram_data_in, output_read_addr, output_read_en, output_write_addr, output_write_en, output_ram_data_out);
sum_ram rr6			(clk, sum_ram_data_in, sum_read_addr, sum_read_en, sum_write_addr, sum_write_en, sum_ram_data_out);

// Transmit module signals:
wire TX_BUSY;
reg  [7:0] data_in = 0; // output buffer for TX
reg TX_START;
reg TX_EN = 0;

TX tt1 (
	.CLK(clk),
	.START(TX_START),
	.BUSY(TX_BUSY),
	.DATA(data_in),
	.TX_LINE(com_UART_TXD)
);

// Variables to hold state informations:
reg [3:0] sending_state = 4'd0; 		// Used for the TX module states.
reg [4:0] summing_state = 5'd0;  		// Used for the summing module states.
reg [3:0] debug = 4'd0;					// Used for the debug prints to Seven segment display.
reg [2:0] processing_state = 3'd0;  // Used for the processing module states. 
reg [2:0] indexing_state = 3'd0;    // Used for the indexing module states.


integer i = 0; // Counter for raw data ram index.
integer j = 0; // Counter for filtered data ram index.
integer k = 0; // Counter for output data ram index.
integer l = 0; // Counter for output data ram index.
integer t = 0; // Counter for Sum data ram index.
integer p = 0; // Counter for filtered data ram index.


reg start = 0;     // Flag to start the state machine.
reg filtering = 0; // Flag to start filered data ram storage.

// Variables to hold data at summing state.
reg [31:0]data_1; 
reg [31:0]data_2;
reg [31:0]data_3;
reg [31:0]data_4;
reg [31:0]data_5;
reg [31:0]data_6;
reg [31:0]data_7;
reg [31:0]data_8;

reg [39:0]sum; 


// States:
parameter phaselock_s  = 0,
			 receiving_s  = 1, 
			 filtering_s  = 2, 
			 processing_s = 3,
			 indexing_s	  = 4,
			 summing_s	  = 5,
			 sending_s    = 6,
			 done_s		  = 7;
			 
// Variable to hold the state information of the controller:			 
reg [3:0] state = receiving_s;

// PLL turning on:
always @ (posedge clk50) begin

	if(pll_locked) begin
		pll_on <= 1; // Set the flag to 
	end
end

// Storing Filtered values
always @ (posedge clk) begin
	if(pll_on)begin // Wait for 100 MHz signal
		
		if(filtering) begin // Wait for filter to start sending output data
			
			// Store filtered data into another ram:
			filt_write_addr <= j;
			filt_write_en <= 1;
		
		end else begin
			filt_write_en <= 0;
		end
	end
end
		 
always @ (posedge clk) begin	
if(pll_on) begin
	
	// Wait for start signal to turn on the controller:
	if(!start_key) begin
		start <= 1;
	end
	
	// Wait for TX key signal before starting the TX module:
	if(!tx_key) begin
		TX_EN <= 1;
		debug <= 6;
	end
	
	if(start) begin
	case (state)
		receiving_s:	begin
								state <= filtering_s;
							end
		
		filtering_s:	begin
		
							//if(i && (i % 2048)) begin
								ram_read_addr <= i;
								ram_read_en <= 1;
							//end
		
							
							if(i >= 13) begin
								filtering <= 1;
								j <= j + 1;
							end
							
							if(i < 16383) begin
								i <= i + 1;
							end
							
							if( j == 2048) begin
								filtering <= 0;
								j <= 0;
								processing_state <= 0;
								state <= processing_s;
							end
							end
							
		processing_s:	begin
		
								case (processing_state)
								3'd0: begin
									filt_read_addr <= p;
									filt_read_en <= 1;
									processing_state <= 3'd1;
									end
								3'd1: begin
									processing_state <= 3'd2;
									end
								3'd2: begin
									processing_state <= 3'd3;
									end
								3'd3: begin
									proc_ram_data_in <= filt_ram_data_out[31:0];
									proc_write_addr <= (3*p) + (processing_state-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									processing_state <= 3'd4;
									end
								3'd4:	begin
									proc_ram_data_in <= filt_ram_data_out[63:32];
									proc_write_addr <= (3*p) + (processing_state-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									processing_state <= 3'd5;
									end
								3'd5: begin
									proc_ram_data_in <= filt_ram_data_out[95:64];
									proc_write_addr <= (3*p) + (processing_state-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									p <= p + 1;
									processing_state <= 3'd0;
									end
								endcase
								
								if(p >= 2048) begin
									processing_state <= 3'd0;
									p <= 0;
									state <= indexing_s;
								end
							end
		
		indexing_s:		begin
							
							case (indexing_state)
							
							3'd0: begin
								delay_read_addr <= (768*l) + k;
								delay_read_en <= 1;
								delay_write_en <= 0;
								indexing_state <= 3'd1;
								end
								
							3'd1: begin
								indexing_state <= 3'd2;
								end
								
							3'd2:	begin
								indexing_state <= 3'd3;
								end
		
							3'd3: begin
								proc_read_addr <= delay_ram_data_out;
								proc_read_en <= 1;
								proc_write_en <= 0;
								indexing_state <= 3'd4;
								end
							
							3'd4: begin
								output_ram_data_in <= proc_ram_data_out;
								indexing_state <= 3'd5;
								end
							
							3'd5: begin
								
								output_write_addr <= (768*l) + k;
								output_write_en <= 1;
								output_read_en <= 0;
								k <= k + 1;
								indexing_state <= 3'd0;
								end
							
							endcase
								
							if(k == 768) begin
								l = l + 1;
								k <= 0;
								if(l < 7) begin
									state <= filtering_s;
								end
								else begin
									i <= 0;
									state <= summing_s;
								end
								
							end
							end
							
		summing_s:		begin
							
							if(summing_state < 4'd8) begin
								output_read_addr <= t + (768*summing_state);
								output_read_en <= 1;
								output_write_en <= 0;
								
								case (summing_state)
									4'd0: begin
										summing_state <= 4'd1;
										end
									4'd1: begin
											data_1 <= output_ram_data_out;
											summing_state <= 4'd2;
										end
									4'd2: begin
											data_2 <= output_ram_data_out;
											summing_state <= 4'd3;
										end
									4'd3: begin
											data_3 <= output_ram_data_out;
											summing_state <= 4'd4;
										end
									4'd4: begin
											data_4 <= output_ram_data_out;
											summing_state <= 4'd5;
										end
									4'd5: begin
											data_5 <= output_ram_data_out;
											summing_state <= 4'd6;
										end
									4'd6:	begin
											data_6 <= output_ram_data_out;
											summing_state <= 4'd7;
										end
									4'd7: begin
											data_7 <= output_ram_data_out; 
											summing_state <= 4'd8;
										end
								endcase
							end else begin
								summing_state <= 4'd0;
								data_8 <= output_ram_data_out;
								
								sum <= data_1 + data_2 + data_3 + data_4 + data_5 + data_6 + data_7 + data_8;
								
								sum_ram_data_in <= sum;
								sum_write_addr <= t;
								sum_write_en <= 1;
								
								t <= t + 1;
							end
							
							if(t == 768) begin
								t <= 0;
								i <= 0;
								state <= sending_s;
								debug <= 1;
								sum_write_en <= 0;
								sum_read_en <= 1;
							end
		
							end
							
		sending_s:		begin
								
								if (TX_EN && !TX_BUSY) begin // on enable signal and while a stream isn't happening
									debug <= 7;
									case (sending_state)
										4'd0: begin	
												data_in <= 0;
												sending_state = 1;
												end
										4'd1: begin
												sending_state <= 2;
												end
										4'd2: begin
												TX_START <= 1'b1;
												data_in = sum_ram_data_out[39:32];
												sending_state = 3;
												end
										4'd3: begin
												sending_state = 4;
												end
										4'd4: begin
												TX_START <= 1'b1;
												data_in = sum_ram_data_out[31:24];
												sending_state <= 5;
												end
										4'd5: begin
												sending_state <= 6;
												end
										4'd6: begin
												TX_START <= 1'b1;
												data_in = sum_ram_data_out[23:16];
												sending_state <= 7;
												end
										4'd7: begin	
												sending_state <= 8;
												end
										4'd8: begin
												TX_START <= 1'b1;
												data_in = sum_ram_data_out[15:8];
												sending_state <= 9;
												end
										4'd9: begin
												sending_state <= 10;
												end
									4'd10: 	begin
												TX_START <= 1'b1;
												data_in = sum_ram_data_out[7:0];
												sending_state <= 11;
												end
									4'd11: 	begin
												TX_START <= 1'b0;
												sum_read_addr = sum_read_addr + 1;
												sending_state = 0;
												end
									endcase
								end else begin
									debug <= 8;
									TX_START <= 1'b0;
								end
		
								if(sum_read_addr >= 768) begin
									TX_EN <= 0;
									state <= done_s;
								end
							end
							
		done_s:			begin
								state <= done_s;
							end
		default:			begin
								state <= 9;
							end
	endcase
	end
	end
end
	
always @ (posedge clk) begin
if(pll_on)begin
	case (state)
		4'd0: seg <= ~7'b1111110;
		4'd1:	seg <= ~7'b0110000;
		4'd2:	seg <= ~7'b1101101;
		4'd3:	seg <= ~7'b1111001;
		4'd4:	seg <= ~7'b0110011;
		4'd5:	seg <= ~7'b1011011;
		4'd6:	seg <= ~7'b1011111;
		4'd7:	seg <= ~7'b1110000;
		4'd8:	seg <= ~7'b1111110;
		4'd9:	seg <= ~7'b1110011;
		default: seg <= 7'b1010100;
	endcase
	case (debug)
		4'd0: seg1 <= ~7'b1111110;
		4'd1:	seg1 <= ~7'b0110000;
		4'd2:	seg1 <= ~7'b1101101;
		4'd3:	seg1 <= ~7'b1111001;
		4'd4:	seg1 <= ~7'b0110011;
		4'd5:	seg1 <= ~7'b1011011;
		4'd6:	seg1 <= ~7'b1011111;
		4'd7:	seg1 <= ~7'b1110000;
		4'd8:	seg1 <= ~7'b1111110;
		4'd9:	seg1 <= ~7'b1110011;
		default: seg1 <= 7'b1010100;
	endcase
	case (sending_state)
		4'd0: 	seg2 <= ~7'b1111110;
		4'd1:		seg2 <= ~7'b0110000;
		4'd2:		seg2 <= ~7'b1101101;
		4'd3:		seg2 <= ~7'b1111001;
		4'd4:		seg2 <= ~7'b0110011;
		4'd5:		seg2 <= ~7'b1011011;
		4'd6:		seg2 <= ~7'b1011111;
		4'd7:		seg2 <= ~7'b1110000;
		4'd8:		seg2 <= ~7'b1111110;
		4'd9:		seg2 <= ~7'b1110011;
		4'd10:	seg2 <= ~7'b1110111; // Hex -> A
		4'd11:	seg2 <= ~7'b0011111; // Hex -> B
		4'd12:	seg2 <= ~7'b1001110; // Hex -> C
		4'd13:	seg2 <= ~7'b0111101; // Hex -> D
		4'd14:	seg2 <= ~7'b1001111; // Hex -> E
		4'd15:	seg2 <= ~7'b1000111; // Hex -> F
		default: seg2 <=  7'b1010100;
	endcase
end
end
	
endmodule
