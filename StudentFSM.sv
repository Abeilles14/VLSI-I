/* Name:
* Student ID: 12521589
* Purpose: A State Machine Depicting a UBC Engineering Student's Schedule
*/

module StudentFSM (
	input logic clk,
	input logic rst,
	input logic alarm,
	input logic bus,
	input logic hungry,
	input logic class,
	input logic tired,
	input logic homework,
	input logic design_work,
	input logic brain_no_work,
	input logic energy,
	output logic[4:0] state_out
);

typedef enum logic [4:0] {SLEEP, EAT, BUS, LECTURE, TIM_HORTONS, STUDY, DESIGN_TEAM, NETFLIX, GYM, SOCIALIZE} enumstate;
enumstate state, nextstate;

assign state_out = state;

always_ff @(posedge clk) begin
	if (rst) begin
		count <= 0;
	end

	case (state)
		SLEEP:
		EAT:
		BUS:
		LECTURE:
		TIM_HORTONS:
		STUDY:
		DESIGN_TEAM:
		NETFLIX:
		GYM:
		SOCIALIZE:
		default: nextstate = state;
	endcase

end
endmodule


