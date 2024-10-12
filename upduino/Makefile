# Makefile to build UPduino v3.0 rgb_blink.v  with icestorm toolchain
# Original Makefile is taken from: 
# https://github.com/tomverbeure/upduino/tree/master/blink
# On Linux, copy the included upduinov3.rules to /etc/udev/rules.d/ so that we don't have
# to use sudo to flash the bit file.
# Thanks to thanhtranhd for making changes to thsi makefile.
VFILES=Hazard2_SoC.f
upduino.bin: upduino.asc
	icepack upduino.asc upduino.bin

upduino.asc: upduino.json upduino.pcf
	nextpnr-ice40 --up5k --package sg48 --json upduino.json --pcf upduino.pcf --asc upduino.asc --report upduino_report.txt

upduino.json: Upduino.v ../cpu/hazard2_cpu.v ../cpu/Hazard2.v ../SoC/ahbl_splitter_4.v ../memory/ahbl_ram.v ../memory/ahbl_rom.v ../gpio/ahbl_gpio.v ../SoC/Hazard2_SoC.v ../gpio/ahbl_gpio_splitter.v
	yosys -q -p "read_verilog -sv Upduino.v ../cpu/hazard2_cpu.v ../cpu/Hazard2.v ../SoC/ahbl_splitter_4.v ../memory/ahbl_ram.v ../memory/ahbl_rom.v ../gpio/ahbl_gpio.v ../SoC/Hazard2_SoC.v ../gpio/ahbl_gpio_splitter.v ; synth_ice40 -top Upduino -json upduino.json" 

.PHONY: flash
flash:
	iceprog -d i:0x0403:0x6014 upduino.bin

.PHONY: clean
clean:
	$(RM) -f upduino.json upduino.asc upduino.bin
