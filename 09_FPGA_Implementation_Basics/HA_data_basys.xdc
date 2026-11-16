## ============================================================================
## Constraints : HA_data_basys.xdc
## Target      : Digilent Basys 3 (XC7A35T-1CPG236C)
## Description : Maps Half Adder ports (a, b, sum, carry) to switches and LEDs.
## ============================================================================

## Switches
set_property PACKAGE_PIN V17 [get_ports {a}]
set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN V16 [get_ports {b}]
set_property IOSTANDARD LVCMOS33 [get_ports {b}]

## LEDs
set_property PACKAGE_PIN U16 [get_ports {sum}]
set_property IOSTANDARD LVCMOS33 [get_ports {sum}]
set_property PACKAGE_PIN E19 [get_ports {carry}]
set_property IOSTANDARD LVCMOS33 [get_ports {carry}]