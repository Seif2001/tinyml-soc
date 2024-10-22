# Makefile to build UPduino v3.0 rgb_blink.v  with icestorm toolchain
# Original Makefile is taken from: 
# https://github.com/tomverbeure/upduino/tree/master/blink
# On Linux, copy the included upduinov3.rules to /etc/udev/rules.d/ so that we don't have
# to use sudo to flash the bit file.
# Thanks to thanhtranhd for making changes to thsi makefile.
VFILES=Upduino.v ../rtl/cpu/hazard2_cpu.v ../rtl/cpu/Hazard2.v ../rtl/SoC/Hazard2_SoC.v ../rtl/SoC/ahbl_splitter_4.v ../rtl/memory/ahbl_ram.v ../rtl/memory/ahbl_rom.v ../rtl/gpio/ahbl_gpio.v ../rtl/gpio/ahbl_gpio_splitter.v ../rtl/uart/ahbl_uart.v ../rtl/uart/uart_tx.v ../rtl/uart/serial_terminal.v ../rtl/timer/ahbl_counter.v ../rtl/timer/counter.v ../rtl/timer/prescaler_counter.v ../rtl/accelerator/multiplier.v ../rtl/accelerator/ahbl_mult.v
upduino.bin: upduino.asc
	icepack upduino.asc upduino.bin

upduino.asc: upduino.json upduino.pcf
	nextpnr-ice40 --up5k --package sg48 --json upduino.json --pcf upduino.pcf --asc upduino.asc --report upduino_report.txt --pcf-allow-unconstrained

upduino.json: 
	yosys -p "synth_ice40 -top Upduino -json upduino.json" $(VFILES)
flash:
	iceprog -d i:0x0403:0x6014 upduino.bin

.PHONY: clean
clean:
	$(RM) -f *.json *.asc *.bin
