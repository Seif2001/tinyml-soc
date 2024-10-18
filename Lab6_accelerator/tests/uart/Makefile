CROSS=riscv64-unknown-elf-
CFLAGS=-march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -Wall
LFLAGS=-Wl,--build-id=none,-Bstatic,-T,../common/link.ld,--strip-debug
VFILES=Hazard2_SoC.f
TBFILES=../../rtl/SoC/Hazard2_SoC_tb.v
SRC=../common/src

# Rule for simulation using iverilog
sim: uart.vvp
	vvp uart.vvp

# Compile Verilog files and testbench into a vvp file for simulation
uart.vvp: $(VFILES) $(TBFILES) uart.hex
	iverilog -f $(VFILES) -o uart.vvp $(TBFILES)

# Generate uart.hex file from uart.elf
uart.hex: uart.elf
	$(CROSS)objdump -D uart.elf > uart.asm
	$(CROSS)objcopy --verilog-data-width=4 -O verilog uart.elf /home/seif/dev/projects/tinyml-soc/test.hex

# Compile the C code into a RISC-V ELF executable
uart.elf: ../common/link.ld ../common/crt.s uart.c
	$(CROSS)gcc $(CFLAGS) $(LFLAGS) -o uart.elf ../common/crt.s uart.c $(SRC)/uart.c

# A pseudo target to ensure hex files are generated before simulation
hex: test.hex

# Default target to build everything
all: sim

# Clean up generated files
clean:
	rm -f *.elf *.hex *.vvp *.asm