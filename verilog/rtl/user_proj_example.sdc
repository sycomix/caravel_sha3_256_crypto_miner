create_clock [get_ports wb_clk_i]  -name wb_clk_i  -period 10
create_clock [get_ports user_clock2]  -name user_clock2  -period 20
set_clock_groups -asynchronous \
   -group [get_clocks {wb_clk_i}] \
   -group [get_clocks {user_clock2}]

