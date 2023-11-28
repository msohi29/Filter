onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk -radix binary /filter_test_tb/clk
add wave -noupdate -divider {Filter Processing}
add wave -noupdate -label {raw data addr} -radix unsigned /filter_test_tb/c1/addr
add wave -noupdate -label {raw data ram out} -radix decimal /filter_test_tb/c1/out
add wave -noupdate -format Analog-Step -height 84 -label {filter data in} -max 2048.0 -min -1968.0 /filter_test_tb/c1/data_in
add wave -noupdate -label {filt valid} -radix binary -radixshowbase 0 /filter_test_tb/c1/filt_valid
add wave -noupdate -label {filter data out} /filter_test_tb/c1/data_out
add wave -noupdate -format Analog-Step -height 84 -label filtered -max 4.0503641411005935e+26 -min -4.0599464867582536e+26 /filter_test_tb/c1/filtered
add wave -noupdate -label i -radix unsigned -radixshowbase 0 /filter_test_tb/c1/i
add wave -noupdate -label j -radix unsigned -radixshowbase 0 /filter_test_tb/c1/j
add wave -noupdate -divider {Filter Ram}
add wave -noupdate -label {filt read addr} -radix unsigned -radixshowbase 0 /filter_test_tb/c1/filt_read_addr
add wave -noupdate -label {filt read en} -radix binary -radixshowbase 0 /filter_test_tb/c1/filt_read_en
add wave -noupdate -label {filt write en} -radix binary -radixshowbase 0 /filter_test_tb/c1/filt_write_en
add wave -noupdate -label {filt write addr} -radix unsigned -radixshowbase 0 /filter_test_tb/c1/filt_write_addr
add wave -noupdate -format Analog-Step -height 84 -label {filt ram out} -max 4.0503641411005935e+26 -min -4.0599464867582536e+26 /filter_test_tb/c1/filt_ram_data_out
add wave -noupdate -divider {Proccess Ram}
add wave -noupdate -label {proc ram read addr} -radix unsigned /filter_test_tb/c1/proc_read_addr
add wave -noupdate -label {proc ram write addr} -radix unsigned /filter_test_tb/c1/proc_write_addr
add wave -noupdate -label {proc ram read en} -radix binary /filter_test_tb/c1/proc_read_en
add wave -noupdate -label {proc ram write en} -radix binary /filter_test_tb/c1/proc_write_en
add wave -noupdate -format Analog-Step -height 84 -label {proc ram data in} -max 27953178.0 -min -27196822.0 -radix decimal /filter_test_tb/c1/proc_ram_data_in
add wave -noupdate -format Analog-Step -height 84 -label {proc ram data out} -max 4294966618.0 -radix unsigned /filter_test_tb/c1/proc_ram_data_out
add wave -noupdate -divider {Delay Ram}
add wave -noupdate -label {delay read addr} -radix unsigned /filter_test_tb/c1/delay_read_addr
add wave -noupdate -label {delay read en} -radix binary /filter_test_tb/c1/delay_read_en
add wave -noupdate -label {delay write en} -radix binary -radixshowbase 0 /filter_test_tb/c1/delay_write_en
add wave -noupdate -label {delay value} -radix unsigned /filter_test_tb/c1/delay_ram_data_out
add wave -noupdate -divider {Output Ram}
add wave -noupdate -label {output write addr} -radix unsigned /filter_test_tb/c1/output_write_addr
add wave -noupdate -format Analog-Step -height 84 -label {output data in} -max 4294966618.0 -radix unsigned /filter_test_tb/c1/output_ram_data_in
add wave -noupdate -label {output ram read addr} -radix unsigned /filter_test_tb/c1/output_read_addr
add wave -noupdate -format Analog-Step -height 84 -label {output ram data out} -max 4294966618.0 -radix unsigned /filter_test_tb/c1/output_ram_data_out
add wave -noupdate -divider {Sum Ram}
add wave -noupdate -label {Sum write addr} -radix unsigned /filter_test_tb/c1/sum_write_addr
add wave -noupdate -format Analog-Step -height 84 -label {Sum data in} -max 21475678870.0 -radix unsigned /filter_test_tb/c1/sum_ram_data_in
add wave -noupdate -label {Sum read addr} -radix unsigned /filter_test_tb/c1/sum_read_addr
add wave -noupdate -format Analog-Step -height 84 -label {Sum ram data out} -max 21475678870.0 -radix unsigned /filter_test_tb/c1/sum_ram_data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {411923077 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1785 us}
