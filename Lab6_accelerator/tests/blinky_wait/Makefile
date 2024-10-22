CROSS=riscv64-unknown-elf-
CFLAGS=-march=rv32im -mabi=ilp32 -ffreestanding -nostdlib -O0 -Wall
LFLAGS=-Wl,--build-id=none,-Bstatic,-T,../common/link.ld,--strip-debug
VFILES=Hazard2_SoC.f
TBFILES=../../rtl/SoC/Hazard2_SoC_tb.v
SRC=../common/src

# Rule for simulation using iverilog
sim: blinky_wait.vvp
	vvp blinky_wait.vvp

# Compile Verilog files and testbench into a vvp file for simulation
blinky_wait.vvp: $(VFILES) $(TBFILES) blinky_wait.hex
	iverilog -f $(VFILES) -o blinky_wait.vvp $(TBFILES)

# Generate blinky_wait.hex file from blinky_wait.elf
blinky_wait.hex: blinky_wait.elf
	$(CROSS)objdump -D blinky_wait.elf > blinky_wait.asm
	$(CROSS)objcopy --verilog-data-width=4 -O verilog blinky_wait.elf /home/seif/dev/projects/tinyml-soc/test.hex

# Compile the C code into a RISC-V ELF executable
blinky_wait.elf: ../common/link.ld ../common/crt.s blinky_wait.c
	$(CROSS)gcc $(CFLAGS) $(LFLAGS) -o blinky_wait.elf ../common/crt.s blinky_wait.c $(SRC)/time.c

# A pseudo target to ensure hex files are generated before simulation
hex: test.hex

# Default target to build everything
all: sim

# Clean up generated files
clean:
	rm -f *.elf *.hex *.vvp *.asm