set_db init_lib_search_path ../lib
set_db init_hdl_search_path ../rtl

set_db library {typical.lib ram_128x16A_typical_syn.lib}

read_hdl -sv {top.sv asic_sram_macro.sv}

elaborate top
check_design

read_sdc design.sdc

syn_generic
syn_map
syn_opt

report_area > reports/area.rpt
report_timing > reports/timing.rpt

write_hdl > ../netlist/top_synth.v



