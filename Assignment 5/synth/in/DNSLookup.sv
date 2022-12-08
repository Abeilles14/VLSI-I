/* Name:
* Student ID: 12521589
* Purpose: A State Machine Depicting a DNS server webpage rendering
*/

module DNSLookup (
	input logic clk,
	input logic rst,
	input logic client_req,
	input logic [7:0] web_addr,
	output logic [15:0] webpage_idx_out,
	output logic [7:0] tld_addr_out,
	output logic [7:0] domain_ip_out,
	output logic [7:0] web_ip_out,
	output logic [7:0] exec_time,
	output logic ip_resolved,
	output logic client_res,
	inout VDD,
	inout VSS
);

	typedef enum logic [4:0] {IDLE, CLIENT_START, CLIENT_RESOLVER_REQ, RESOLVER_ROOT_REQ, ROOT_RES, 
		RESOLVER_TLD_REQ, TLD_RES, RESOLVER_DOMAIN_REQ, DOMAIN_RES, RESOLVER_RES, CLIENT_SERVER_REQ, SERVER_RES, CACHING} enumstate;
	enumstate state, nextstate;

	logic count_en, count_rst;
	logic [3:0] web_ip_in;
	logic [7:0] tld_addr, domain_ip, web_ip, count;
	logic [15:0] cached_ip_map, webpage_idx;
	logic query_tld, query_domain, query_ip, query_data;

	// counter for request exec time (simulated as num cycles)
	counter ExecCounter(
		.clk(clk),
		.rst(count_rst),
		.en(count_en),
		.count(count)
	);

	TLDAddr WebAddrToTLDAddr (
		.in(web_addr),
		.out(tld_addr),
		.en(query_tld)
	);

	DomainIP TLDAddrToDomainIP (
		.in(tld_addr_out),
		.out(domain_ip),
		.en(query_domain)
	);

	WebIP DomainIPToWebIP (
		.in(domain_ip_out),
		.out(web_ip),
		.en(query_ip)
	);

	// web data fetching for domain ip addr
	decoder416 WebIPToWebdata (
		.in(web_ip_in),
		.out(webpage_idx),
		.en(query_data)
	);

	// assign out signals
	assign tld_addr_out = query_tld ? tld_addr : 8'bx;
	assign domain_ip_out = query_domain ? domain_ip : 8'bx;
	assign web_ip_out = query_ip ? web_ip : 8'bx;
	assign webpage_idx_out = (query_data && state >= SERVER_RES) ? webpage_idx : 16'bx;

	// state transitions
	always_ff @(posedge clk) begin
		if (rst)
			state <= IDLE;
		else
			state <= nextstate;
	end

	// timer controls
	always_ff @(posedge clk) begin

		if (state == IDLE) begin
			if (!client_req)
				{count_rst, count_en} <= 2'b10;
			else
				{count_rst, count_en} <= 2'b01;
			exec_time <= 8'bx;
		end
		else begin
			{count_rst, count_en} <= 2'b01;
			if (client_res)
				exec_time <= count;
			else
				exec_time <= 8'bx;
		end
	end

	always_ff @(posedge clk) begin
		if (rst) begin
			ip_resolved <= 1'b0;
			web_ip_in <= 4'bx;
			cached_ip_map <= 16'bx;
		end
		else
			if (state == RESOLVER_RES)
				ip_resolved <= 1'b1;
			else if (state == CLIENT_RESOLVER_REQ && cached_ip_map[7:0] != web_addr)
				ip_resolved <= 1'b0;
			else if (state == CLIENT_SERVER_REQ)
				// cache new ip if found
				web_ip_in <= ip_resolved ? web_ip_out[3:0] : cached_ip_map[11:8];
			else if (state == CACHING)
				// cache new ip if found
				cached_ip_map <= ip_resolved ? {web_ip_out, web_addr} : cached_ip_map;
	end

	// always_ff @(posedge clk) begin
	// 	if (rst)
	// 		cached_ip_map <= 16'bx;
	// 	else
	// 		if (state == CACHING)
	// 			// cache new ip if found
	// 			cached_ip_map <= ip_resolved ? {web_ip_out, web_addr} : cached_ip_map;
	// end


	// always_ff @(posedge clk) begin
	// 	if (rst)
	// 		web_ip_in <= 4'bx;
	// 	else
	// 		if (state == CACHING)
	// 			// cache new ip if found
	// 			cached_ip_map <= ip_resolved ? {web_ip_out, web_addr} : cached_ip_map;
	// 		else if (state == CLIENT_SERVER_REQ)
	// 			// cache new ip if found
	// 			web_ip_in <= ip_resolved ? web_ip_out[3:0] : cached_ip_map[11:8];
	// end

		
	always_comb begin
		// reset all outputs to init to cover all combs
		query_tld = 0;
		query_ip = 0;
		query_domain = 0;
		query_data = 0;
		client_res = 0;
		nextstate = IDLE;


		case (state)
			// initial state, if client request arrives, start counter
			IDLE: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b0000;
				if (client_req) begin
					nextstate = CLIENT_START;
				end
			end
			// client start request process
			CLIENT_START: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b0000;
				// start timer
				nextstate = CLIENT_RESOLVER_REQ;
			end
			// client query is sent to DNS recursive resolver
			CLIENT_RESOLVER_REQ: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b0000;
				// if web addr is mapped to cached ip, skip to browser req
				if (cached_ip_map[7:0] == web_addr) begin
					nextstate = CLIENT_SERVER_REQ;
				end
				else
					nextstate = RESOLVER_ROOT_REQ;
			end
			// resolver queries a DNS root nameserver
			RESOLVER_ROOT_REQ: begin
				// set addr to decode to find TLD DNS server addr in root query
				{query_tld, query_domain, query_ip, query_data} = 4'b1000;
				nextstate = ROOT_RES;
			end
			//  root server responds to resolver with TLD DNS server addr (.com)
			ROOT_RES: begin
				// map/decode the web addr to find the TLD DNS server addr
				{query_tld, query_domain, query_ip, query_data} = 4'b1000;
				nextstate = RESOLVER_TLD_REQ;
			end
			// resolver makes a request to the TLD (.com)
			RESOLVER_TLD_REQ: begin
				// set tld addr to find domain nameserver ip addr in query resolver
				{query_tld, query_domain, query_ip, query_data} = 4'b1100;
				nextstate = TLD_RES;
			end
			// TLD server responds with IP addr
			TLD_RES: begin
				//map/decode the tld addr to find the domain nameserver IP addr
				{query_tld, query_domain, query_ip, query_data} = 4'b1100;
				nextstate = RESOLVER_DOMAIN_REQ;
			end
			// resolver sends query to domain's nameserver
			RESOLVER_DOMAIN_REQ: begin
				// set domain ip to find web ip in query resolver
				{query_tld, query_domain, query_ip, query_data} = 4'b1110;
				nextstate = DOMAIN_RES;
			end
			// domain name server returns IP address for web addr to the resolver
			DOMAIN_RES: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b1110;
				nextstate = RESOLVER_RES;
			end
			// DNS resolver responds to web browser with IP addr of domain requested
			RESOLVER_RES: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b1110;
				nextstate = CLIENT_SERVER_REQ;
			end
			// browser makes an HTTP req to IP addr
			CLIENT_SERVER_REQ: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b1111;
				// web_ip_in = ip_resolved ? web_ip_out[3:0] : cached_ip_map[11:8];
				nextstate = SERVER_RES;
			end
			// server at that IP addr returns webpage to be redered
			SERVER_RES: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b1111;
				nextstate = CACHING;
			end
			// cache most recent ip and encode
			CACHING: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b1111;
				// client done request
				client_res = 1'b1;

				nextstate = IDLE;
			end
			default: begin
				{query_tld, query_domain, query_ip, query_data} = 4'b0000;
				nextstate = IDLE;
			end
		endcase
	end
endmodule


