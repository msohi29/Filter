module controller(
	input clk
);

reg [13:0] addr;
wire [15:0] out;
reg [15:0] data_in = 0;
wire [95:0] data_out;

reg [95:0] filtered = 0;

wire filt_valid;
reg read_en = 0;
reg reset = 1;

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

//RAM rr1				(clk, read_en, addr, out);
//filter_test ff1	(clk, reset, data_in, filt_valid, data_out);
RAM rr1				(clk, read_en, addr, out);
filter_test ff1	(clk, reset, out, filt_valid, data_out);
filtered_ram rr2	(clk, data_out, filt_read_addr, filt_read_en, filt_write_addr, filt_write_en, filt_ram_data_out);
//filtered_ram rr2	(clk, filt_ram_data_in, filt_read_addr, filt_read_en, filt_write_addr, filt_write_en, filt_ram_data_out);
processed_ram rr3	(clk, proc_ram_data_in, proc_read_addr, proc_read_en, proc_write_addr, proc_write_en, proc_ram_data_out);
delays_ram rr4		(clk, delay_ram_data_in, delay_read_addr, delay_read_en, delay_write_addr, delay_write_en, delay_ram_data_out);
output_ram rr5		(clk, output_ram_data_in, output_read_addr, output_read_en, output_write_addr, output_write_en, output_ram_data_out);
sum_ram rr6			(clk, sum_ram_data_in, sum_read_addr, sum_read_en, sum_write_addr, sum_write_en, sum_ram_data_out);

// For reading data from RAW DATA BRAM
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
parameter receiving_s  = 0, 
			 filtering_s  = 1, 
			 processing_s = 2,
			 indexing_s	  = 3,
			 summing_s	  = 4,
			 sending_s    = 5,
			 done_s		  = 6;
			 
reg [2:0] state = receiving_s;

always @ (posedge clk) begin
	
	if(filtering) begin
		// Store filtered data into another ram:
		filt_write_addr <= j;
		filt_write_en <= 1;
	end
end
			 
always @ (posedge clk, posedge state) begin

case (state)

	receiving_s:	begin
						state <= filtering_s;
						end
	
	filtering_s:	begin
	
//						if(i && (i % 2048)) begin
							addr <= i;
							read_en <= 1;
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
							state <= processing_s;
						end
						end
						
	processing_s:	begin
	
							case (q)
							0: begin
								filt_read_addr <= p;
								filt_read_en <= 1;
								filt_write_en <= 0;
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
							state <= sending_s;
						end
	
						end
						
	sending_s:		begin
							sum_read_addr <= i;
							sum_read_en <= 1;
							sum_write_en <= 0;
							
							sum <= sum_ram_data_out;
							
							i <= i + 1;
							
							if(i == 768) begin
								i <= 0;
								state <= done_s;
							end
						end
						
	done_s:			begin
							i <= 1;
						end

endcase

end

endmodule
