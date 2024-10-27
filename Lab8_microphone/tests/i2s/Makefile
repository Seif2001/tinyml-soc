CROSS=riscv64-unknown-elf-
CFLAGS=-march=rv32im -mabi=ilp32 -ffreestanding -nostdlib -O0 -Wall
LFLAGS=-Wl,--build-id=none,-Bstatic,-T,../common/link.ld,--strip-debug
VFILES=Hazard2_SoC.f
TBFILES=../../rtl/SoC/Hazard2_SoC_tb.v
SRC=../common/src

# Rule for simulation using iverilog
sim: i2s.vvp
	vvp i2s.vvp

# Compile Verilog files and testbench into a vvp file for simulation
i2s.vvp: $(VFILES) $(TBFILES) i2s.hex
	iverilog -f $(VFILES) -o i2s.vvp $(TBFILES)

# Generate i2s.hex file from i2s.elf
i2s.hex: i2s.elf
	$(CROSS)objdump -D i2s.elf > i2s.asm
	$(CROSS)objcopy --verilog-data-width=4 -O verilog i2s.elf /home/seif/dev/projects/tinyml-soc/test.hex

# Compile the C code into a RISC-V ELF executable
i2s.elf: ../common/link.ld ../common/crt.s i2s.c
	$(CROSS)gcc $(CFLAGS) $(LFLAGS) -o i2s.elf ../common/crt.s i2s.c $(SRC)/time.c $(SRC)/uart.c

# A pseudo target to ensure hex files are generated before simulation
hex: test.hex

# Default target to build everything
all: sim

# Clean up generated files
clean:
	rm -f *.elf *.hex *.vvp *.asm