module communication (
	input CLOCK_50,
	input START,
	input STOP,
	input [9:0] SW, //set transmit data
	input [1:0] KEY, // used to start transmission
	output [15:0] LEDR, // display received data
	output reg [7:0] LEDG, // display transmit data
	output UART_TXD, // transmit bit
	input UART_RXD);
	
	//set up wires and registers
	wire TX_BUSY; // used to prevent a transmit event during transmit stream
	wire [7:0] RX_DATA; // store recieved data
	reg TX_START;
	wire RX_BUSY; // used to prevent a receive event during receive stream
	reg [15:0] DATA_BUFF = 0;
	reg [11:0] rd_addr = 0;
	reg [11:0] wr_addr = 0;
	reg [11:0] wr_addr_2 = 0;
	wire rd_en;
	reg wr_en;
	reg RX_BUSY_BUFF;
	//reg [1:0] RX_STATE = 0;
	reg RX_STATE = 0;
	reg START_EN;
	wire [31:0] DATA_BUFF_1;
	// map components that handle transmit and receive
	TX C1 (
		.CLK(CLOCK_50),
		.START(TX_START),
		.BUSY(TX_BUSY),
		.DATA(SW[7:0]),
		.TX_LINE(UART_TXD));

	RX C2 (
		.CLK(CLOCK_50),
		.RX_LINE(UART_RXD),
		.DATA(RX_DATA),
		.BUSY(RX_BUSY));
		
	DPRAM R1 (
		.clock(CLOCK_50),
		.data(DATA_BUFF),
		.rdaddress(rd_addr),
		.rden(rd_en),
		.wraddress(wr_addr),
		.wren(wr_en),
		.q(DATA_BUFF_1[15:0]));
	
	assign rd_en = (!RX_BUSY & START_EN);
	
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
		end else if (!STOP) begin
			START_EN <= 0;
			rd_addr <= 0;
			wr_addr <= 0;
		end
		
	end
	
endmodule 