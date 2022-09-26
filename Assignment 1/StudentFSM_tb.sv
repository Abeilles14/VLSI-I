// Specify simulation timescape
// Format: unit step / resolution
`timescale 1ns/1ps

module StudentFSM_tb;
	// Testbench wires
	logic [4:0] state_out;
	logic clk, rst;
	logic alarm, bus, hungry, class, tired, homework, design_work, brain_no_work, energy;
	
	// Instantiate the module to test
	StudentFSM DUT(StudentFSM (
		.clk(clk),
		.rst(rst),
		.alarm(alarm),
		.bus(bus),
		.hungry(hungry),
		.class(class),
		.tired(tired),
		.homework(homework),
		.design_work(design_work),
		.brain_no_work(brain_no_work),
		.energy(energy),
		.state_out(state_out)
	);
		
	// Initialize signals
	initial begin
		{clk, rst} = 2'b01;
		{alarm, bus, tired, design_work, brain_no_work, energy, hungry, class, homework} = 9'b0;
	end

	// inputs
	always begin
		#15
		// FRIDAY
		// alarm rings, bus arrives
		{alarm, bus} = 2'b11;
		#15
		// student gets off the bus, has classes, then goes to study
		{alarm, bus, class, homework} = 4'b0011;
		#35
		// assignments are done and student eats dinner
		{class, homework, hungry} = 3'b001;
		#15
		// student then leaves campus and still has energy to go to the gym
		{bus, energy, hungry} = 3'b110;
		#40
		// student is tired and has no energy left, goes to bed
		{tired, energy} = 2'b10;

		// SATURDAY
		// alarm rings, student is hungry and bus is not there yet
		{alarm, hungry} = 2'b11;
		#15
		// bus arrives
		{alarm, hungry, bus} = 3'b001;
		#15
		// no classes today, but lots of assignments, student goes to timhorton to grab coffee and study
		{bus, homework} = 2'b01;
		#40
		// student has design team meetings to do next
		{homework, design_work} = 2'b01;
		#15
		// student is done with design team work and goes to eat dinner
		{design_work, hungry} = 2'b01;
		#15
		// student then leaves campus, their brain is toast from all that studying done today, so they go out with friends
		{bus, brain_no_work, hungry} = 3'b110;
		#40
		// student is tired and goes to bed
		{bus, brain_no_work, tired} = 3'b001;
		#40
	end

	// Clock
	always begin
		#10
		clk = ~clk;
	end
endmodule
