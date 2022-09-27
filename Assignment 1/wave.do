onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /StudentFSM_tb/DUT/clk
add wave -noupdate /StudentFSM_tb/DUT/rst
add wave -noupdate /StudentFSM_tb/DUT/alarm
add wave -noupdate /StudentFSM_tb/DUT/bus
add wave -noupdate /StudentFSM_tb/DUT/hungry
add wave -noupdate /StudentFSM_tb/DUT/lecture
add wave -noupdate /StudentFSM_tb/DUT/tired
add wave -noupdate /StudentFSM_tb/DUT/homework
add wave -noupdate /StudentFSM_tb/DUT/design_work
add wave -noupdate /StudentFSM_tb/DUT/brain_no_work
add wave -noupdate /StudentFSM_tb/DUT/energy
add wave -noupdate /StudentFSM_tb/DUT/num_assignments
add wave -noupdate /StudentFSM_tb/DUT/num_lectures
add wave -noupdate /StudentFSM_tb/DUT/state_out
add wave -noupdate /StudentFSM_tb/DUT/state
add wave -noupdate /StudentFSM_tb/DUT/nextstate
add wave -noupdate /StudentFSM_tb/DUT/count_en
add wave -noupdate /StudentFSM_tb/DUT/count_rst
add wave -noupdate /StudentFSM_tb/DUT/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {290428 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {127779 ps}
