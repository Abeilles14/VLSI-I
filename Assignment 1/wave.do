onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DNSLookup_tb/DUT/clk
add wave -noupdate /DNSLookup_tb/DUT/rst
add wave -noupdate /DNSLookup_tb/DUT/client_req
add wave -noupdate /DNSLookup_tb/DUT/query_tld
add wave -noupdate /DNSLookup_tb/DUT/query_domain
add wave -noupdate /DNSLookup_tb/DUT/query_ip
add wave -noupdate /DNSLookup_tb/DUT/query_data
add wave -noupdate /DNSLookup_tb/DUT/web_addr
add wave -noupdate /DNSLookup_tb/DUT/webpage_idx_out
add wave -noupdate /DNSLookup_tb/DUT/tld_addr_out
add wave -noupdate /DNSLookup_tb/DUT/domain_ip_out
add wave -noupdate /DNSLookup_tb/DUT/web_ip_out
add wave -noupdate /DNSLookup_tb/DUT/tld_addr
add wave -noupdate /DNSLookup_tb/DUT/domain_ip
add wave -noupdate /DNSLookup_tb/DUT/web_ip
add wave -noupdate /DNSLookup_tb/DUT/webpage_idx
add wave -noupdate /DNSLookup_tb/DUT/cached_ip_map
add wave -noupdate /DNSLookup_tb/DUT/web_ip_in
add wave -noupdate -radix decimal /DNSLookup_tb/DUT/exec_time
add wave -noupdate /DNSLookup_tb/DUT/ip_resolved
add wave -noupdate /DNSLookup_tb/DUT/client_res
add wave -noupdate /DNSLookup_tb/DUT/state
add wave -noupdate /DNSLookup_tb/DUT/nextstate
add wave -noupdate -radix unsigned /DNSLookup_tb/DUT/count_en
add wave -noupdate /DNSLookup_tb/DUT/count_rst
add wave -noupdate -radix unsigned /DNSLookup_tb/DUT/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {322592 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 116
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
WaveRestoreZoom {112859 ps} {244321 ps}
