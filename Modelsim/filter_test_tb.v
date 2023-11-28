/* Controller test: */

`timescale 1ns / 1ps
module filter_test_tb();

	reg clk;
	
	controller c1(clk);
	
	initial begin	
		clk <= 0;
		forever #5 clk <= !clk;
	end

endmodule


/********* Ram test   **********/
//`timescale 1ns / 1ps
//module filter_test_tb();
//
//reg clk;
//reg [13:0] addr;
//wire [15:0] out;
//reg [15:0] data_in;
//wire [104:0] data_out;
//
//reg [104:0] filtered = 0;
//
//reg read_en = 0;
//reg reset = 1;
//wire data_ready;
//
//RAM rr1(clk, read_en, addr, out);
//filtering ff1(clk, reset, data_in, data_ready, data_out);
//
//integer i = 0; 
//
//initial begin
//	clk <= 0;
//	forever #5 clk <= !clk;
//end
//
//initial begin
//	forever @ (posedge clk) begin
//		data_in <= out;
//		filtered <= data_out;
//	end
//end	
//
//initial begin
//	data_in <= 0;
//	#400
//	forever @ (posedge clk) begin : block1
//		addr <= i;
//		read_en <= 1;
//		#5
//		i = i + 1;
//		
//		if( i > 16383) begin
//			disable block1;
//		end
//	end
//end
//
//endmodule
	
/* test for delays ram: */
//`timescale 1ns / 1ps
//
//module filter_test_tb();
//reg clk;
//reg delay_read_en = 0, delay_write_en = 0;
//reg [12:0]delay_read_addr = 0;
//reg [12:0]delay_write_addr = 0;
//reg [12:0]delay_ram_data_in;
//wire [12:0]delay_ram_data_out;
//integer i;
//
//delays_ram rr3(clk, delay_ram_data_in, delay_read_addr, delay_read_en, delay_write_addr, delay_write_en, delay_ram_data_out);
//
//initial begin
//	clk <= 0;
//	forever #5 clk <= !clk;
//end
//
//initial begin
//	
//	for(i=0; i < 6144; i = i+1) begin
//		delay_read_addr = i;
//		delay_read_en = 1;
//		#20
//		delay_read_en = 0;
//	end
//end
//endmodule

/******** Test 1 for ram and filter:  ********/
//`timescale 1ns / 1ps
//
//module filter_test_tb();
//reg clk;
//reg load;
//reg [13:0] addr;
//wire [15:0] out_data;
//integer i;
//
//RAM ram1(clk, load, addr, out_data);
//
//initial begin
//	clk <= 0;
//	forever #5 clk <= !clk;
//end
//
//initial begin
//	load = 0;
//	for(i=0; i < 16384; i = i+1) begin
//		addr = i;
//		load = 1;
//		#20
//		load = 0;
//	end
//end
//endmodule

/***** SIN wave test for filter   ******/
//
//`timescale 1ns / 1ps
//
//module filter_test_tb ();
//	
//	reg clk;
//	reg clk2;
//	reg rst;
//	reg [15:0] data_in;
//	reg start = 0;
//	wire [104:0] data_out;
//	
//	integer x = 0;
//	real y = 0;
//	reg [15:0] data_cast = 0;
//	
//	filtering U1 (
//	.clk(clk),
//	.rst(rst),
//	.data_in(data_in),
//	.out(data_out));
//	
//	initial begin
//		rst <= 1;
//		data_in <= 8'b0000_0000;
//	end
//	
//	initial begin
//		clk <= 0;
//		forever #5 clk <= !clk;
//	end
//	
//	initial begin
//		clk2 <= 0;
//		forever #5 clk2 <= !clk2;
//	end
//	
//	initial begin
//		forever @(posedge clk2) begin
//			x <= x+1;	
//			y <= $sin((3.1415926535)*(1/10.0)*x)*2048.0; //smaller number in sine = faster
//			data_cast <= y;
//		end
//	end
//	
//	initial begin
//		forever @(posedge clk) begin
//			data_in <= data_cast;
//		end
//	end
//	
//	initial begin
//		#1000 rst <= 0;
//		#100 rst <= 1;
//	end
//	
//endmodule 