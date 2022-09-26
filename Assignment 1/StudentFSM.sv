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

	logic hw_done;

	assign state_out = state;


// countdown module for homework assignments
//

	always_ff @(posedge clk) begin
		if (rst)
			state <= SLEEP;
		else
			state <= nextstate;
	end
		
	always_comb begin

		case (state)
			SLEEP: begin
				if (alarm && bus)
					nextstate <= BUS;
				end
				else if (alarm && hungry)
					nextstate <= EAT;
			end
			EAT: begin
				if (bus)
					nextstate <= BUS;
				end
			end
			BUS: begin
				if (class)
					nextstate <= LECTURE;
				else if (homework)
					nextstate <= TIM_HORTONS;
				else if (energy)
					nextstate <= GYM;
				else if (!energy && !brain_no_work)
					nextstate <= SOCIALIZE;
				else if (!energy && brain_no_work)
					nextstate <= NETFLIX;
			end
			LECTURE: nextstate <= STUDY;
			TIM_HORTONS: nextstate <= STUDY;
			STUDY: begin
				if (design_work && !homework)
					nextstate <= DESIGN_TEAM;
				else if (hungry && !homework)
					nextstate <= EAT;
			end
			DESIGN_TEAM: begin
				if (hungry && !design_work)
					nextstate <= EAT;
			end
			NETFLIX: begin
				if (tired)
					nextstate <= SLEEP;
			end
			GYM: begin
				if (tired || !energy)
					nextstate <= SLEEP;
			end
			SOCIALIZE: begin
				if (tired)
					nextstate <= SLEEP;
			default: nextstate <= state;
		endcase

	end
endmodule


