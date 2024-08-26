#tx,data_st,clk,dip_switch
set_property PACKAGE_PIN Y29 [get_ports dip_switch]
set_property IOSTANDARD LVCMOS25 [get_ports dip_switch]

set_property PACKAGE_PIN AD12 [get_ports clk_p]
set_property PACKAGE_PIN AD11 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_n]


set_property PACKAGE_PIN K24 [get_ports tx]
set_property IOSTANDARD LVCMOS25 [get_ports tx]

set_property PACKAGE_PIN M19 [get_ports rx]
set_property IOSTANDARD LVCMOS25 [get_ports rx]

set_property PACKAGE_PIN AB8 [get_ports l1]
set_property IOSTANDARD LVCMOS15 [get_ports l1]
set_property PACKAGE_PIN AA8 [get_ports l2]
set_property IOSTANDARD LVCMOS15 [get_ports l2]
set_property PACKAGE_PIN AC9 [get_ports l3]
set_property IOSTANDARD LVCMOS15 [get_ports l3]
set_property PACKAGE_PIN AB9 [get_ports l4]
set_property IOSTANDARD LVCMOS15 [get_ports l4]


set_property PACKAGE_PIN G19 [get_ports rx_st]
set_property IOSTANDARD LVCMOS25 [get_ports rx_st]

create_generated_clock -name clk_p -period 5 [get_ports clk_p]









create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 8192 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clock_gen/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {Rx/bits[0]} {Rx/bits[1]} {Rx/bits[2]} {Rx/bits[3]} {Rx/bits[4]} {Rx/bits[5]} {Rx/bits[6]} {Rx/bits[7]} {Rx/bits[8]} {Rx/bits[9]} {Rx/bits[10]} {Rx/bits[11]} {Rx/bits[12]} {Rx/bits[13]} {Rx/bits[14]} {Rx/bits[15]} {Rx/bits[16]} {Rx/bits[17]} {Rx/bits[18]} {Rx/bits[19]} {Rx/bits[20]} {Rx/bits[21]} {Rx/bits[22]} {Rx/bits[23]} {Rx/bits[24]} {Rx/bits[25]} {Rx/bits[26]} {Rx/bits[27]} {Rx/bits[28]} {Rx/bits[29]} {Rx/bits[30]} {Rx/bits[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {Rx/mode[0]} {Rx/mode[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {Rx/data_rx[0]} {Rx/data_rx[1]} {Rx/data_rx[2]} {Rx/data_rx[3]} {Rx/data_rx[4]} {Rx/data_rx[5]} {Rx/data_rx[6]} {Rx/data_rx[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {Rx/counter[0]} {Rx/counter[1]} {Rx/counter[2]} {Rx/counter[3]} {Rx/counter[4]} {Rx/counter[5]} {Rx/counter[6]} {Rx/counter[7]} {Rx/counter[8]} {Rx/counter[9]} {Rx/counter[10]} {Rx/counter[11]} {Rx/counter[12]} {Rx/counter[13]} {Rx/counter[14]} {Rx/counter[15]} {Rx/counter[16]} {Rx/counter[17]} {Rx/counter[18]} {Rx/counter[19]} {Rx/counter[20]} {Rx/counter[21]} {Rx/counter[22]} {Rx/counter[23]} {Rx/counter[24]} {Rx/counter[25]} {Rx/counter[26]} {Rx/counter[27]} {Rx/counter[28]} {Rx/counter[29]} {Rx/counter[30]} {Rx/counter[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list Rx/baud_rx]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list Rx/rx]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list Rx/rx_st]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
