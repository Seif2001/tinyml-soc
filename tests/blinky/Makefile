CROSS=riscv64-unknown-elf-
CFLAGS=-march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -O2 -Wall
LFLAGS=-Wl,--build-id=none,-Bstatic,-T,../link.ld,--strip-debug
VFILES=Hazard2_SoC.f
TBFILES=../../SoC/Hazard2_SoC_tb.v

# Rule for simulation using iverilog
sim: blinky.vvp
	vvp blinky.vvp

# Compile Verilog files and testbench into a vvp file for simulation
blinky.vvp: $(VFILES) $(TBFILES) blinky.hex
	iverilog -f $(VFILES) -o blinky.vvp $(TBFILES)

# Generate blinky.hex file from blinky.elf
blinky.hex: blinky.elf
	$(CROSS)objdump -D blinky.elf > blinky.asm
	$(CROSS)objcopy --verilog-data-width=4 -O verilog blinky.elf /home/seif/dev/projects/tinyml-soc/test.hex

# Compile the C code into a RISC-V ELF executable
blinky.elf: ../link.ld ../crt.s blinky.c
	$(CROSS)gcc $(CFLAGS) $(LFLAGS) -o blinky.elf ../crt.s blinky.c

# A pseudo target to ensure hex files are generated before simulation
hex: test.hex

# Default target to build everything
all: sim

# Clean up generated files
clean:
	rm -f *.elf *.hex *.vvp *.asm