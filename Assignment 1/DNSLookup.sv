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
	output logic client_res
);

	typedef enum logic [4:0] {IDLE, CLIENT_START, CLIENT_RESOLVER_REQ, RESOLVER_ROOT_REQ, ROOT_RES, 
		RESOLVER_TLD_REQ, TLD_RES, RESOLVER_DOMAIN_REQ, DOMAIN_RES, RESOLVER_RES, CLIENT_SERVER_REQ, SERVER_RES, CACHING} enumstate;
	enumstate state, nextstate;

	logic count_en, count_rst;
	logic [3:0] count, web_ip_in;
	logic [7:0] tld_addr, domain_ip, web_ip;
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

	always_ff @(posedge clk) begin
		if (rst) begin
			state <= IDLE;
		end
		else
			state <= nextstate;
	end
		
	always_comb begin
		case (state)
			// initial state, if client request arrives, start counter and check/decode server for cached addr
			IDLE: begin
				{count_rst, count_en} <= 2'b10;

				if (client_req) begin
					{client_res, ip_resolved} <= 2'b00;
					nextstate <= CLIENT_START;
				end
			end
			// client start request process
			CLIENT_START: begin
				// start timer
				{count_rst, count_en} <= 2'b01;
				nextstate <= CLIENT_RESOLVER_REQ;
			end
			// client query is sent to DNS recursive resolver
			CLIENT_RESOLVER_REQ: begin

				// if web addr is mapped to cached ip, skip to browser req
				if (cached_ip_map[7:0] == web_addr) begin
					nextstate <= CLIENT_SERVER_REQ;
				end
				else
					nextstate <= RESOLVER_ROOT_REQ;
			end
			// resolver queries a DNS root nameserver
			RESOLVER_ROOT_REQ: begin
				// set addr to decode to find TLD DNS server addr in root query
				query_tld <= 1'b1;
				tld_addr_out <= tld_addr;
				nextstate <= ROOT_RES;
			end
			//  root server responds to resolver with TLD DNS server addr (.com)
			ROOT_RES: begin
				// map/decode the web addr to find the TLD DNS server addr
				query_tld <= 1'b0;
				nextstate <= RESOLVER_TLD_REQ;
			end
			// resolver makes a request to the TLD (.com)
			RESOLVER_TLD_REQ: begin
				// set tld addr to find domain nameserver ip addr in query resolver
				query_domain <= 1'b1;
				domain_ip_out <= domain_ip;
				nextstate <= TLD_RES;
			end
			// TLD server responds with IP addr
			TLD_RES: begin
				//map/decode the tld addr to find the domain nameserver IP addr
				query_domain <= 1'b0;
				nextstate <= RESOLVER_DOMAIN_REQ;
			end
			// resolver sends query to domain's nameserver
			RESOLVER_DOMAIN_REQ: begin
				// set domain ip to find web ip in query resolver
				query_ip <= 1'b1;
				web_ip_out <= web_ip;
				nextstate <= DOMAIN_RES;
			end
			// domain name server returns IP address for web addr to the resolver
			DOMAIN_RES: begin
				query_ip <= 1'b0;
				nextstate <= RESOLVER_RES;
			end
			// DNS resolver responds to web browser with IP addr of domain requested
			RESOLVER_RES: begin
				ip_resolved <= 1'b1;
				nextstate <= CLIENT_SERVER_REQ;
			end
			// browser makes an HTTP req to IP addr
			CLIENT_SERVER_REQ: begin
				query_data <= 1'b1;
				web_ip_in <= ip_resolved ? web_ip_out[3:0] : cached_ip_map[11:8];
				webpage_idx_out <= webpage_idx;
				nextstate <= SERVER_RES;
			end
			// server at that IP addr returns webpage to be redered
			SERVER_RES: begin
				query_data <= 1'b0;
				nextstate <= CACHING;
			end
			// cache most recent ip and encode
			CACHING: begin
				// cache new ip if found
				cached_ip_map <= ip_resolved ? {web_ip_out, web_addr} : cached_ip_map;

				// stop counter and output exec time
				exec_time <= count;
				// client done request
				client_res <= 1'b1;
				nextstate <= IDLE;
			end
			default: begin
				nextstate <= IDLE;
			end
		endcase
	end
endmodule


