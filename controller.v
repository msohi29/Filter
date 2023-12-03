module controller(
	//input clk,
	input clk50,
	//input com_start,
	//input com_stop,
	input start_key,
	input tx_key,
	output reg [0:6]seg,
	output reg [0:6]seg1,
	output reg [0:6]seg2,
	output com_UART_TXD, // transmit bit
	input com_UART_RXD
);


reg [13:0] addr;
wire [15:0] out;
//reg [15:0] data_in = 0;
wire [95:0] data_out;

//reg [95:0] filtered = 0;

wire filt_valid;
//reg read_en = 0;
reg reset = 1;

reg ram_read_en = 0; 
wire ram_write_en;
reg [13:0]ram_read_addr = 0;
wire [13:0]ram_write_addr;
wire [15:0]ram_data_in;
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
reg [12:0]delay_ram_data_in = 0;
wire [12:0]delay_ram_data_out;


reg output_read_en = 0, output_write_en = 0;
reg [12:0]output_read_addr = 0;
reg [12:0]output_write_addr = 0;
reg [31:0]output_ram_data_in;
wire [31:0]output_ram_data_out;

reg sum_read_en = 0; 
reg sum_write_en = 0;
reg [9:0]sum_read_addr = 0;
reg [9:0]sum_write_addr = 0;
reg [39:0]sum_ram_data_in;
wire [39:0]sum_ram_data_out;

reg pll_reset = 0;
wire clk;
wire pll_locked;
reg pll_on = 0;

PLL pll1				(pll_reset, clk50, clk, pll_locked);
	
//communication com	(clk, com_rx_start, com_rx_stop, sum_ram_data_out, com_tx_en, com_UART_TXD, com_UART_RXD, ram_write_en, ram_write_addr, ram_data_in, sum_read_en, sum_read_addr);
ram rr1				(clk, ram_data_in, ram_read_addr, ram_read_en, ram_write_addr, ram_write_en, ram_data_out);
filter_test ff1	(clk, reset, ram_data_out, filt_valid, data_out);
filtered_ram rr2	(clk, data_out, filt_read_addr, filt_read_en, filt_write_addr, filt_write_en, filt_ram_data_out);
//filtered_ram rr2	(clk, filt_ram_data_in, filt_read_addr, filt_read_en, filt_write_addr, filt_write_en, filt_ram_data_out);
processed_ram rr3	(clk, proc_ram_data_in, proc_read_addr, proc_read_en, proc_write_addr, proc_write_en, proc_ram_data_out);
delays_ram rr4		(clk, delay_ram_data_in, delay_read_addr, delay_read_en, delay_write_addr, delay_write_en, delay_ram_data_out);
output_ram rr5		(clk, output_ram_data_in, output_read_addr, output_read_en, output_write_addr, output_write_en, output_ram_data_out);
sum_ram rr6			(clk, sum_ram_data_in, sum_read_addr, sum_read_en, sum_write_addr, sum_write_en, sum_ram_data_out);

wire TX_BUSY;
reg  [7:0] data_in = 0; // output buffer for TX
reg TX_START;

TX tt1 (
	.CLK(clk),
	.START(TX_START),
	.BUSY(TX_BUSY),
	.DATA(data_in),
	.TX_LINE(com_UART_TXD)
);

reg TX_EN = 0;

reg [3:0] sending_state = 0;

integer i = 0;
integer j = 0;
integer k = 0;
integer l = 0;
integer t = 0;
integer p = 0;

reg [3:0] mn = 4'd0;
reg [2:0]q = 3'd0;
reg [2:0]internal_state = 3'd0;
reg [4:0]s = 4'd0;
integer filtering = 0;

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
			 
reg [3:0] state = receiving_s;

// PLL on
always @ (posedge clk50) begin

	if(pll_locked) begin
		pll_on <= 1;
	end
end

// Storing Filed values
always @ (posedge clk) begin

// Controller state machine
if(pll_on)begin
	if(filtering) begin
		// Store filtered data into another ram:
		filt_write_addr <= j;
		filt_write_en <= 1;
	end
	filt_write_en <= 0;
end
end
		 
always @ (posedge clk) begin	
if(pll_on) begin
	if(!start_key) begin
		if(state < summing_s) begin
			state <= state + 1;
		end
	end
	if(!tx_key) begin
		TX_EN <= 1;
		mn <= 6;
		state <= sending_s;
	end
	
	case (state)
		receiving_s:	begin
								i <= 0;
//								state <= filtering_s;
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
								q <= 0;
//								state <= processing_s;
							end
							end
							
		processing_s:	begin
		
								case (q)
								3'd0: begin
									filt_read_addr <= p;
									filt_read_en <= 1;
									q <= 3'd1;
									end
								3'd1: begin
									q <= 3'd2;
									end
								3'd2: begin
									q <= 3'd3;
									end
								3'd3: begin
									proc_ram_data_in <= filt_ram_data_out[31:0];
									proc_write_addr <= (3*p) + (q-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									q <= 3'd4;
									end
								3'd4:	begin
									proc_ram_data_in <= filt_ram_data_out[63:32];
									proc_write_addr <= (3*p) + (q-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									q <= 3'd5;
									end
								3'd5: begin
									proc_ram_data_in <= filt_ram_data_out[95:64];
									proc_write_addr <= (3*p) + (q-3);
									proc_write_en <= 1;
									proc_read_en <= 0;
									p <= p + 1;
									q <= 3'd0;
									end
								endcase
								
								if(p >= 2048) begin
									q <= 3'd0;
									p <= 0;
//									state <= indexing_s;
								end
							end
		
		indexing_s:		begin
							
							case (internal_state)
							
							3'd0: begin
								delay_read_addr <= (768*l) + k;
								delay_read_en <= 1;
								delay_write_en <= 0;
								internal_state <= 3'd1;
								end
								
							3'd1: begin
								internal_state <= 3'd2;
								end
								
							3'd2:	begin
								internal_state <= 3'd3;
								end
		
							3'd3: begin
								proc_read_addr <= delay_ram_data_out;
								proc_read_en <= 1;
								proc_write_en <= 0;
								internal_state <= 3'd4;
								end
							
							3'd4: begin
								output_ram_data_in <= proc_ram_data_out;
								internal_state <= 3'd5;
								end
							
							3'd5: begin
								
								output_write_addr <= (768*l) + k;
								output_write_en <= 1;
								output_read_en <= 0;
								k <= k + 1;
								internal_state <= 3'd0;
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
//									state <= summing_s;
								end
								
							end
							end
							
		summing_s:		begin
							
							if(s < 4'd8) begin
								output_read_addr <= t + (768*s);
								output_read_en <= 1;
								output_write_en <= 0;
								
								case (s)
									4'd0: begin
										s <= 4'd1;
										end
									4'd1: begin
											data_1 <= output_ram_data_out;
											s <= 4'd2;
										end
									4'd2: begin
											data_2 <= output_ram_data_out;
											s <= 4'd3;
										end
									4'd3: begin
											data_3 <= output_ram_data_out;
											s <= 4'd4;
										end
									4'd4: begin
											data_4 <= output_ram_data_out;
											s <= 4'd5;
										end
									4'd5: begin
											data_5 <= output_ram_data_out;
											s <= 4'd6;
										end
									4'd6:	begin
											data_6 <= output_ram_data_out;
											s <= 4'd7;
										end
									4'd7: begin
											data_7 <= output_ram_data_out; 
											s <= 4'd8;
										end
								endcase
							end else begin
								s <= 4'd0;
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
								internal_state <= 0;
//								state <= sending_s;
								mn <= 1;
								sum_write_en <= 0;
								sum_read_en <= 1;
							end
		
							end
							
		sending_s:		begin
								
								if (TX_EN && !TX_BUSY) begin // on enable signal and while a stream isn't happening
									mn <= 7;
									case (sending_state)
										0: begin	
											data_in <= 0;
											sending_state = 1;
											end
										1: begin
											sending_state <= 2;
											end
										2: begin
											TX_START <= 1'b1;
											data_in = sum_ram_data_out[39:32];
											sending_state = 3;
											end
										3: begin
											sending_state = 4;
											end
										4: begin
											TX_START <= 1'b1;
											data_in = sum_ram_data_out[31:24];
											sending_state <= 5;
											end
										5: begin
											sending_state <= 6;
											end
										6: begin
											TX_START <= 1'b1;
											data_in = sum_ram_data_out[23:16];
											sending_state <= 7;
											end
										7: begin	
											sending_state <= 8;
											end
										8: begin
											TX_START <= 1'b1;
											data_in = sum_ram_data_out[15:8];
											sending_state <= 9;
											end
										9: begin
											sending_state <= 10;
											end
										10: begin
											TX_START <= 1'b1;
											data_in = sum_ram_data_out[7:0];
											sending_state <= 11;
											end
										11: begin
											TX_START <= 1'b0;
											sum_read_addr = sum_read_addr + 1;
											sending_state = 0;
											end
									endcase
								end else begin
									mn <= 8;
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
	case (mn)
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
		4'd0: seg2 <= ~7'b1111110;
		4'd1:	seg2 <= ~7'b0110000;
		4'd2:	seg2 <= ~7'b1101101;
		4'd3:	seg2 <= ~7'b1111001;
		4'd4:	seg2 <= ~7'b0110011;
		4'd5:	seg2 <= ~7'b1011011;
		4'd6:	seg2 <= ~7'b1011111;
		4'd7:	seg2 <= ~7'b1110000;
		4'd8:	seg2 <= ~7'b1111110;
		4'd9:	seg2 <= ~7'b1110011;
	4'd10:	seg2 <= ~7'b1110111;
	4'd11:	seg2 <= ~7'b0011111;
	4'd12:	seg2 <= ~7'b1001110;
	4'd13:	seg2 <= ~7'b0111101;
	4'd14:	seg2 <= ~7'b1001111;
	4'd15:	seg2 <= ~7'b1000111;
		default: seg2 <= 7'b1010100;
	endcase
end
end
	
endmodule
