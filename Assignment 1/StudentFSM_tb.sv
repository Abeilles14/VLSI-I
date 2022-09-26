// Specify simulation timescape
// Format: unit step / resolution
`timescale 1ns/1ps

module StudentFSM_tb;
	// Testbench wires
	logic [4:0] state_out;
	logic clk, rst;
	logic alarm, bus, hungry, lecture, tired, homework, design_work, brain_no_work, energy;
	
	// Instantiate the module to test
	StudentFSM DUT(
		.clk(clk),
		.rst(rst),
		.alarm(alarm),
		.bus(bus),
		.hungry(hungry),
		.lecture(lecture),
		.tired(tired),
		.homework(homework),
		.design_work(design_work),
		.brain_no_work(brain_no_work),
		.energy(energy),
		.state_out(state_out)
	);
		
	// clk
	// always begin
	// 	#10;
	// 	clk = ~clk;
	// end

	// Initialize signals
	initial begin
		{clk, rst} = 2'b01;
		{alarm, bus, tired, design_work, brain_no_work, energy, hungry, lecture, homework} = 9'b0;

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
		// FRIDAY
		// alarm rings, bus arrives
		{alarm, bus} = 2'b11;
		#15;
		// student gets off the bus, has classes, then goes to study
		{alarm, bus, lecture, homework} = 4'b0011;
		#35;
		// assignments are done and student eats dinner
		{lecture, homework, hungry} = 3'b001;
		#15;
		// student then leaves campus and still has energy to go to the gym
		{bus, energy, hungry} = 3'b110;
		#40;
		// student is tired and has no energy left, goes to bed
		{bus, tired, energy} = 3'b010;
		#30;

		// SATURDAY
		// alarm rings, student is hungry and bus is not there yet
		{alarm, hungry} = 2'b11;
		#15;
		// bus arrives
		// no classes today, but lots of assignments, student goes to timhorton to grab coffee and study
		{alarm, hungry, bus, homework} = 4'b0011;
		#40;
		// student has design team meetings to do next
		{bus, homework, design_work} = 3'b001;
		#15;
		// student is done with design team work and goes to eat dinner
		{design_work, hungry} = 2'b01;
		#15;
		// student then leaves campus, their brain is toast from all that studying done today, so they go home to watch their favourite TV show
		{bus, brain_no_work, hungry} = 3'b110;
		#40;
		// student is tired and goes to bed
		{bus, brain_no_work, tired} = 3'b001;
		#40;
	end
endmodule
