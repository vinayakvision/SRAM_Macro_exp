reset

read design -golden -sv -define SYNTHESIS rtl/*.sv

read library -liberty lib/typical.lib lib/ram_128x16A_typical_syn.lib

read design -revised -verilog netlist/top_synth.v

set undefined cell black_box

set system mode lec

add compared points -all

compare

report verification

