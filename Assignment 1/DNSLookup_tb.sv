// Specify simulation timescape
// Format: unit step / resolution
`timescale 1ns/1ps

module DNSLookup_tb();
	logic clk, rst, client_req;
	logic [7:0] web_addr, tld_addr, domain_ip, web_ip, exec_time;
	logic [15:0] webpage_idx;
	logic ip_resolved, client_res;

	// Instantiate the module to test
	DNSLookup DUT (
		.clk(clk),
		.rst(rst),
		.client_req(client_req),
		.web_addr(web_addr),
		.webpage_idx_out(webpage_idx),
		.tld_addr_out(tld_addr),
		.domain_ip_out(domain_ip),
		.web_ip_out(web_ip),
		.exec_time(exec_time),
		.ip_resolved(ip_resolved),
		.client_res(client_res)
	);

	// Initialize signals
	initial begin
		{clk, rst} = 2'b01;
		client_req <= 1'b0;

    	forever
    	begin
      		clk = ~clk;
      		#5;
    	end
	end


	// inputs
	initial begin
		#15;
		rst = 1'b0;
		#15;
		
		// query first web addr
		client_req = 1'b1;
		web_addr = 8'b1001_1010;
		#5;
		client_req = 1'b0;
		#140;

		// test that first web addr is cached by querying again
		client_req = 1'b1;
		web_addr = 8'b1001_1010;
		#5;
		client_req = 1'b0;
		#80

		// query second web addr
		client_req = 1'b1;
		web_addr = 8'b0011_1110;
		#5;
		client_req = 1'b0;
		#140;
	end
endmodule
