/* Name:
* Student ID: 12521589
* Purpose: A module simulating the process of querying for a TLD address
*/
module WebIP (
	input logic [7:0] in,
    output logic [7:0] out,
    input logic en
);
	assign out = en ? {in[7:4]<<2, ^(in[3:0]>>2)} : 8'bx;
endmodule