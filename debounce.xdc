# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN T22 [get_ports {LD[0]}]
set_property PACKAGE_PIN T21 [get_ports {LD[1]}]
set_property PACKAGE_PIN U22 [get_ports {LD[2]}]
set_property PACKAGE_PIN U21 [get_ports {LD[3]}]
set_property PACKAGE_PIN V22 [get_ports {LD[4]}]
set_property PACKAGE_PIN W22 [get_ports {LD[5]}]
set_property PACKAGE_PIN U19 [get_ports {LD[6]}]
set_property PACKAGE_PIN U14 [get_ports {LD[7]}]

# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9 [get_ports GCLK]

# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN P16 [get_ports BTNC]
set_property PACKAGE_PIN T18 [get_ports BTNU]

set_property IOSTANDARD LVCMOS33 [get_ports {LD[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LD[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LD[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports BTNU]
set_property IOSTANDARD LVCMOS33 [get_ports GCLK]
set_property IOSTANDARD LVCMOS33 [get_ports {LD[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LD[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LD[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LD[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports BTNC]
set_property IOSTANDARD LVCMOS33 [get_ports {LD[0]}]
