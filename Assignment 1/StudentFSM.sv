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
	input logic lecture,
	input logic tired,
	input logic homework,
	input logic design_work,
	input logic brain_no_work,
	input logic energy,
	input logic [3:0] num_assignments,
	input logic [3:0] num_lectures,
	output logic[4:0] state_out
);

	typedef enum logic [4:0] {SLEEP, EAT, BUS, LECTURE, TIM_HORTONS, STUDY, DESIGN_TEAM, NETFLIX, GYM, SOCIALIZE} enumstate;
	enumstate state, nextstate;

	logic count_en, count_rst;
	logic[3:0] count;

	// state output
	assign state_out = state;

	// counter for assignments or classes done
	counter WorkCounter(
		.clk(clk),
		.rst(count_rst),
		.en(count_en),
		.count(count)
	);

	always_ff @(posedge clk) begin
		if (rst) begin
			state <= SLEEP;
		end
		else
			state <= nextstate;
	end
		
	always_comb begin
		case (state)
			// student is sleeping until alarm rings
			SLEEP: begin
				if (alarm && bus)
					nextstate <= BUS;
				else if (alarm && hungry)
					nextstate <= EAT;
			end
			// student is eating until bus arrives
			EAT: begin
				if (bus)
					nextstate <= BUS;
			end
			// student takes the bus either the morning to go study/class, or evening to go gym/socialize/netflix
			BUS: begin
				if (lecture) begin
					nextstate <= LECTURE;
					count_rst <= 1'b1;
				end
				else if (homework)
					nextstate <= TIM_HORTONS;
				else if (energy)
					nextstate <= GYM;
				else if (!energy && !brain_no_work)
					nextstate <= SOCIALIZE;
				else if (!energy && brain_no_work)
					nextstate <= NETFLIX;
			end
			// student goes to a number of classes
			LECTURE: begin
				{count_rst, count_en} <= 2'b01;

				if (count >= num_lectures-1) begin
					{count_rst, count_en} <= 2'b10;
					nextstate <= STUDY;
				end
			end
			// student needs a boost from tim hortons before studying
			TIM_HORTONS: begin
				count_rst <= 1'b1;
				nextstate <= STUDY;
			end
			// student studies until all assignments are complete
			STUDY: begin
				{count_rst, count_en} <= 2'b01;

				if (count >= num_assignments-1) begin
					{count_rst, count_en} = 2'b10;

					if (design_work)
						nextstate <= DESIGN_TEAM;
					else
						nextstate <= EAT;
				end
			end
			// student needs to work on design team things
			DESIGN_TEAM: begin
				if (hungry && !design_work)
					nextstate <= EAT;
			end
			// student is tired and goes to bed
			NETFLIX: begin
				if (tired)
					nextstate <= SLEEP;
			end
			// student stays at gym until no energy left and goes to bed
			GYM: begin
				if (tired || !energy)
					nextstate <= SLEEP;
			end
			// student is tired, and goes to bed
			SOCIALIZE: begin
				if (tired)
					nextstate <= SLEEP;
			end
			default: begin
				nextstate <= SLEEP;
			end
		endcase
	end
endmodule


