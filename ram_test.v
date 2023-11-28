module RAM(
	input clk,
	input load,
	input [13:0] addr,
	output reg [15:0] out_data
);

// Internal wires and reg for BRAM:
reg read_en = 1, write_en = 0 /* synthesis keep */;
wire [15:0] in_data /* synthesis keep */;
reg [13:0] read_addr  = 14'd0/* synthesis keep */;
reg [13:0] write_addr = 14'd0/* synthesis keep */;
wire [15:0] q /* synthesis keep */; 

ram r1(clk, in_data, read_addr, read_en, write_addr, write_en, q);	

always @ (posedge clk) begin
	if(load) begin
		read_addr <= addr;
		write_addr <= 0;
		read_en <= 1;
		write_en <= 0;
		out_data <= q;
	end else begin
		read_en <= 0;
		write_en <= 0;
		read_addr <= 0;
		write_addr <= 0;
	end
end

endmodule
