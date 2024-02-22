set sdc_version 2.0
set_units -time ps -resistance kOhm -capacitance pF -voltage V -current mA

set clk_name clk
set clk_port_name clk
set clk_period 100
set clk_io_pct 0.2

set clk_port [get_ports $clk_port_name]

create_clock -name $clk_name -period $clk_period $clk_port

set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] $clk_port]



