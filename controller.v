module controller(
	//input clk
	input clk50,
	input com_start,
	input com_stop,
	input reset_key,
	//output [15:0] com_LEDR, // display received data
	//output [7:0] com_LEDG, // display transmit data
	output reg [0:6]seg,
	output reg [0:6]seg1,
	output reg [0:6]seg2,
	output com_UART_TXD, // transmit bit
	input com_UART_RXD
);


reg [13:0] addr;
wire [15:0] out;
reg [15:0] data_in = 0;
wire [95:0] data_out;

reg [95:0] filtered = 0;

wire filt_valid;
reg read_en = 0;
reg reset = 1;

reg ram_read_en = 0; 
wire ram_write_en;
reg [13:0]ram_read_addr = 0;
wire [13:0]ram_write_addr;
reg [15:0]ram_data_in;
wire [15:0]ram_data_out;

reg filt_read_en = 0, filt_write_en = 0;
reg [10:0]filt_read_addr = 0;
reg [10:0]filt_write_addr = 0;
reg [95:0]filt_ram_data_in;
wire [95:0]filt_ram_data_out;

reg proc_read_en = 0, proc_write_en = 0;
reg [12:0]proc_read_addr = 0;
reg [12:0]proc_write_addr = 0;
reg [31:0]proc_ram_data_in;
wire [31:0]proc_ram_data_out;

reg delay_read_en = 0, delay_write_en = 0;
reg [12:0]delay_read_addr = 0;
reg [12:0]delay_write_addr = 0;
reg [12:0]delay_ram_data_in;
wire [12:0]delay_ram_data_out;


reg output_read_en = 0, output_write_en = 0;
reg [12:0]output_read_addr = 0;
reg [12:0]output_write_addr = 0;
reg [31:0]output_ram_data_in;
wire [31:0]output_ram_data_out;

reg sum_read_en = 0, sum_write_en = 0;
reg [9:0]sum_read_addr = 0;
reg [9:0]sum_write_addr = 0;
reg [39:0]sum_ram_data_in;
wire [39:0]sum_ram_data_out;

reg pll_reset = 1;
wire clk;
wire pll_locked;

reg com_tx_en = 0;
reg [7:0]com_tx_data;
wire com_tx_rdy;

//RAM rr1				(clk, read_en, addr, out);
//filter_test ff1	(clk, reset, data_in, filt_valid, data_out);
PLL pll1				(pll_reset, clk50, clk, pll_locked);
//RAM rr1				(clk, read_en, addr, out);
communication com	(clk, com_start, com_stop, com_tx_data, com_tx_en, com_UART_TXD, com_UART_RXD, ram_write_en, ram_write_addr, com_tx_rdy);
ram rr1				(clk, ram_data_in, ram_read_addr, ram_read_en, ram_write_addr, ram_write_en, ram_data_out);
filter_test ff1	(clk, reset, ram_data_out, filt_valid, data_out);
filtered_ram rr2	(clk, data_out, filt_read_addr, filt_read_en, filt_write_addr, filt_write_en, filt_ram_data_out);
//filtered_ram rr2	(clk, filt_ram_data_in, filt_read_addr, filt_read_en, filt_write_addr, filt_write_en, filt_ram_data_out);
processed_ram rr3	(clk, proc_ram_data_in, proc_read_addr, proc_read_en, proc_write_addr, proc_write_en, proc_ram_data_out);
delays_ram rr4		(clk, delay_ram_data_in, delay_read_addr, delay_read_en, delay_write_addr, delay_write_en, delay_ram_data_out);
output_ram rr5		(clk, output_ram_data_in, output_read_addr, output_read_en, output_write_addr, output_write_en, output_ram_data_out);
sum_ram rr6			(clk, sum_ram_data_in, sum_read_addr, sum_read_en, sum_write_addr, sum_write_en, sum_ram_data_out);


integer i = 0, j = 0, k = 0, l = 0, d = 0, p = 0, q = 0, s = 0, t = 0, filt_state = 0, internal_state = 0;
integer filtering = 0;

reg [12:0]delay_idx = 0;
reg [95:0]filt_data = 0;
reg [31:0]proc_data = 0;
reg [31:0]output_data = 0;

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
			 
reg [3:0] state = phaselock_s;

always @ (posedge clk) begin
	case (state)
		0: seg <= ~7'b1111110;
		1:	seg <= ~7'b0110000;
		2:	seg <= ~7'b1101101;
		3:	seg <= ~7'b1111001;
		4:	seg <= ~7'b0110011;
		5:	seg <= ~7'b1011011;
		6:	seg <= ~7'b1011111;
		7:	seg <= ~7'b1110000;
		8:	seg1 <= ~7'b1111111;
		9:	seg1 <= ~7'b1110011;
		default: seg1 <= 7'b0000000;
	endcase
	case (state)
		0: seg1 <= ~7'b1111110;
		1:	seg1 <= ~7'b0110000;
		2:	seg1 <= ~7'b1101101;
		3:	seg1 <= ~7'b1111001;
		4:	seg1 <= ~7'b0110011;
		5:	seg1 <= ~7'b1011011;
		6:	seg1 <= ~7'b1011111;
		7:	seg1 <= ~7'b1110000;
		8:	seg1 <= ~7'b1111111;
		9:	seg1 <= ~7'b1110011;
		default: seg1 <= 7'b0000000;
	endcase
	case (state)
		0: seg2 <= ~7'b1111110;
		1:	seg2 <= ~7'b0110000;
		2:	seg2 <= ~7'b1101101;
		3:	seg2 <= ~7'b1111001;
		4:	seg2 <= ~7'b0110011;
		5:	seg2 <= ~7'b1011011;
		6:	seg2 <= ~7'b1011111;
		7:	seg2 <= ~7'b1110000;
		8:	seg2 <= ~7'b1111111;
		9:	seg2 <= ~7'b1110011;
		default: seg2 <= 7'b0000000;
	endcase
end

always @ (posedge clk) begin
	
	if(filtering) begin
		// Store filtered data into another ram:
		filt_write_addr <= j;
		filt_write_en <= 1;
	end
	filt_write_en <= 0;
end
			 
always @ (posedge clk, posedge state, negedge reset_key) begin

	if(!reset_key) begin
		i = 0;
		j = 0;
		k = 0;
		l = 0;
		d = 0;
		p = 0;
		q = 0;
		s = 0;
		t = 0;
		filt_state = 0;
		pll_reset = 1;
		com_tx_en <= 0;
		internal_state = 0;
		state <= phaselock_s;
	end
	else begin
	case (state)
		phaselock_s:	begin
								pll_reset = 0;
								if(pll_locked) begin
									state = receiving_s;
								end
							end

		receiving_s:	begin
							state = filtering_s;
							end
		
		filtering_s:	begin
		
	//						if(i && (i % 2048)) begin
								ram_read_addr <= i;
								ram_read_en <= 1;
	//						end
		
							
							if(i >= 13) begin
								filtering <= 1;
								j <= j + 1;
							end
							
							if(i < 16383) begin
								i <= i + 1;
							end
							
							if(i == 16383 && j == 2048) begin
									filtering <= 0;
									j <= 0;
									i <= 0;
									reset <= 0;
									state <= summing_s;
								end
							
							
							if( j == 2048) begin
								filtering <= 0;
								j <= 0;
								q <= 0;
								state <= processing_s;
							end
							end
							
		processing_s:	begin
		
								case (q)
								0: begin
									filt_read_addr <= p;
									filt_read_en <= 1;
									q <= 1;
									end
								1: begin
									q <= 2;
									end
								2: begin
									q <= 3;
									end
								3: begin
									proc_ram_data_in <= filt_ram_data_out[31:0];
									proc_write_addr <= (3*p) + (q-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									q <= 4;
									end
								4:	begin
									proc_ram_data_in <= filt_ram_data_out[63:32];
									proc_write_addr <= (3*p) + (q-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									q <= 5;
									end
								5: begin
									proc_ram_data_in <= filt_ram_data_out[95:64];
									proc_write_addr <= (3*p) + (q-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									p <= p + 1;
									q <= 0;
									end
								endcase
								
								if(p >= 2048) begin
									q <= 0;
									p <= 0;
									state <= indexing_s;
								end
							end
		
		indexing_s:		begin
							
							case (internal_state)
							
							0: begin
								delay_read_addr <= (768*l) + k;
								delay_read_en <= 1;
								delay_write_en <= 0;
								internal_state <= 1;
								end
								
							1: begin
								internal_state <= 2;
								end
								
							2:	begin
								internal_state <= 3;
								end
		
							3: begin
								proc_read_addr <= delay_ram_data_out;
								proc_read_en <= 1;
								proc_write_en <= 0;
								internal_state <= 4;
								end
							
							4: begin
								output_ram_data_in <= proc_ram_data_out;
								internal_state <= 5;
								end
							
							5: begin
								
								output_write_addr <= (768*l) + k;
								output_write_en <= 1;
								output_read_en <= 0;
								k <= k + 1;
								internal_state <= 0;
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
							
							if(s < 8) begin
								output_read_addr <= t + (768*s);
								output_read_en <= 1;
								output_write_en <= 0;
								
								case (s)
									0: begin
										s <= 1;
										end
									1: begin
											data_1 <= output_ram_data_out;
											s <= 2;
										end
									2: begin
											data_2 <= output_ram_data_out;
											s <= 3;
										end
									3: begin
											data_3 <= output_ram_data_out;
											s <= 4;
										end
									4: begin
											data_4 <= output_ram_data_out;
											s <= 5;
										end
									5: begin
											data_5 <= output_ram_data_out;
											s <= 6;
										end
									6:	begin
											data_6 <= output_ram_data_out;
											s <= 7;
										end
									7: begin
											data_7 <= output_ram_data_out; 
											s <= 8;
										end
								endcase
							end else begin
								s <= 0;
								data_8 <= output_ram_data_out;
								
								sum <= data_1 + data_2 + data_3 + data_4 + data_5 + data_6 + data_7 + data_8;
								
								sum_ram_data_in <= sum;
								sum_write_addr <= t;
								sum_write_en <= 1;
								sum_read_en <= 0;
								
								t <= t + 1;
							end
							
							if(t == 768) begin
								t <= 0;
								i<=0;
								internal_state <= 0;
								state <= sending_s;
							end
		
							end
							
		sending_s:		begin
								case (internal_state)
									// initiate read
									0: begin
											com_tx_en = 0;
											if(com_tx_rdy) begin
												sum_read_addr <= i;
												sum_read_en <= 1;
												sum_write_en <= 0;
											
												internal_state = 1;
											end
										end
									1: begin
										internal_state = 2;
										end
									2: begin
										internal_state = 3;
										end
									// send byte 1
									3: begin
											com_tx_en = 0;
											if(com_tx_rdy) begin
												com_tx_data = sum_ram_data_out[39:32];
//												com_tx_data <= "a";
												com_tx_en = 1;
												internal_state = 4;
											end
										end
									// send byte 2
									4: begin
											com_tx_en = 0;
											if(com_tx_rdy) begin
												com_tx_data = sum_ram_data_out[31:24];
//												com_tx_data <= "a";
												com_tx_en = 1;
												internal_state = 5;
											end
										end
									// send byte 3
									5: begin
											com_tx_en = 0;
											if(com_tx_rdy) begin
												com_tx_data = sum_ram_data_out[23:16];
//												com_tx_data <= "a";
												com_tx_en = 1;
												internal_state = 6;
											end
										end
									// send byte 4
									6: begin
											com_tx_en = 0;
											if(com_tx_rdy) begin
												com_tx_data = sum_ram_data_out[15:8];
												com_tx_data <= "a";
												com_tx_en = 1;
												internal_state = 7;
											end
										end
									// send byte 5
									7: begin
											com_tx_en = 0;
											if(com_tx_rdy) begin
												com_tx_data = sum_ram_data_out[7:0];
//												com_tx_data <= "M";
												com_tx_en = 1;
												internal_state = 0;
												i <= i+1;
												if(i >= 768) begin
													
													state <= done_s;
												end
											end
										end
								endcase
								
							end
							
		done_s:			begin
								com_tx_en <= 0;
								state <= done_s;
							end

	endcase

	end
	end

endmodule
