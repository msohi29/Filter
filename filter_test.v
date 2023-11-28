module filter_test(
	input clk,
	input rst,
	input [15:0] data_in,
	output reg filt_valid,
	output reg [95:0]out
);

// Internal wires and reg for LP:
reg filt_start = 1;
wire filt_valid_out;
reg [1:0] err_in = 2'b00;
wire [1:0] err_out;
reg [15:0] filt_data_in = 0;
wire [95:0] filt_data_out;

reg [95:0] prev_data_out;

LP lp1(clk, 
		rst, 
		filt_data_in, 
		filt_start, 
		err_in, 
		filt_data_out, 
		filt_valid_out,
		err_out);

always @ (posedge clk) begin
//		if(data_in !== filt_data_in) begin
//			filt_start <= 1;
//		end else begin
//			filt_start <= 0;
//		end
		
		if(filt_valid_out) begin
			out <= filt_data_out;
		end
		filt_valid <= filt_valid_out;
		filt_data_in <= data_in;
end

endmodule
