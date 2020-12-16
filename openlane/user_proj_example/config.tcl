set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_proj_example

set ::env(STD_CELL_LIBRARY) sky130_fd_sc_hd

set ::env(VERILOG_FILES) "\
   $script_dir/../../verilog/rtl/defines.v \
   $script_dir/../../verilog/rtl/user_proj_example.v"

set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i user_clock2"
set ::env(CLOCK_PERIOD) "20"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 2820 3420"
set ::env(DESIGN_IS_CORE) 0

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg


set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.2
set ::env(ROUTING_CORES) 16
set ::env(DIODE_INSERTION_STRATEGY) 3
set ::env(BASE_SDC_FILE) "$script_dir/../../verilog/rtl/user_proj_example.sdc"

