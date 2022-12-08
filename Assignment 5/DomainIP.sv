/* Name:
* Student ID: 12521589
* Purpose: A module simulating the process of querying for a DomainIP
*/
module DomainIP (
	input logic [7:0] in,
    output logic [7:0] out,
    input logic en
);

	assign out = en ? in^8'b1111_1111 : 8'bx;
endmodule