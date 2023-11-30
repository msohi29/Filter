module communication (
	input CLOCK_50,
	input START,
	input STOP,
	input [9:0] data_in, //set transmit data
	input transmit_en,
	//output [15:0] LEDR, // display received data
	//output reg [7:0] LEDG, // display transmit data
	output UART_TXD, // transmit bit
	input UART_RXD,
	output wr_en,
	output reg[13:0] wr_address,
	output transmit_rdy
	);
	
	//set up wires and registers
	wire TX_BUSY; // used to prevent a transmit event during transmit stream
	wire [7:0] RX_DATA; // store recieved data
	reg TX_START;
	wire RX_BUSY; // used to prevent a receive event during receive stream
	reg [15:0] DATA_BUFF = 0;
	reg [13:0] wr_addr = 0;
	wire rd_en;
	reg RX_BUSY_BUFF;
	reg RX_STATE = 0;
	reg START_EN;
	
	// map components that handle transmit and receive
	TX C1 (
		.CLK(CLOCK_50),
		.START(TX_START),
		.BUSY(TX_BUSY),
		.DATA(data_in[7:0]),
		.TX_LINE(UART_TXD));

	RX C2 (
		.CLK(CLOCK_50),
		.RX_LINE(UART_RXD),
		.DATA(RX_DATA),
		.BUSY(RX_BUSY));
	
	assign wr_en = (!RX_BUSY & START_EN);
	
	assign transmit_rdy = ~TX_BUSY;
	
	always @ (posedge CLOCK_50) begin
		RX_BUSY_BUFF <= RX_BUSY;
		if (RX_BUSY_BUFF & !RX_BUSY) begin
			
			if (!RX_STATE) begin
				DATA_BUFF[7:0] <= RX_DATA;
				RX_STATE <= 1;
			end else if (RX_STATE) begin
				DATA_BUFF[15:8] <= RX_DATA[7:0];
				RX_STATE <= 0;
				wr_addr <= wr_addr + 1;
			end
		end
		
		if (!START) begin
			START_EN <= 1;
		end else if (STOP) begin
			START_EN <= 0;
		end
		
	end
	
	always @ (posedge CLOCK_50) begin
		if (transmit_en == 1'b1 && TX_BUSY == 1'b0) begin // on enable signal and while a stream isn't happening
			TX_START <= 1'b1; //start
			//LEDG <= data_in[7:0];
		end else begin
			TX_START <= 1'b0;
		end
	end
	
endmodule 