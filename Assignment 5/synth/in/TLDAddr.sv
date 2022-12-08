/* Name:
* Student ID: 12521589
* Purpose: A module simulating the process of querying for a TLD address
*/
module TLDAddr (
	input logic [7:0] in,
    output logic [7:0] out,
    input logic en
);

	assign out = en ? in>>2 : 8'bx;
endmodule