CROSS=riscv64-unknown-elf-
CFLAGS=-march=rv32i -mabi=ilp32 -ffreestanding -lgcc -O0 -Wall
LFLAGS=-Wl,--build-id=none,-Bstatic,-T,../common/link.ld,--strip-debug
VFILES=Hazard2_SoC.f
TBFILES=../../rtl/SoC/Hazard2_SoC_tb.v
SRC=../common/src

# Rule for simulation using iverilog
sim: multiply.vvp
	vvp multiply.vvp

# Compile Verilog files and testbench into a vvp file for simulation
multiply.vvp: $(VFILES) $(TBFILES) multiply.hex
	iverilog -f $(VFILES) -o multiply.vvp $(TBFILES)

# Generate multiply.hex file from multiply.elf
multiply.hex: multiply.elf
	$(CROSS)objdump -D multiply.elf > multiply.asm
	$(CROSS)objcopy --verilog-data-width=4 -O verilog multiply.elf /home/seif/dev/projects/tinyml-soc/test.hex

# Compile the C code into a RISC-V ELF executable
multiply.elf: ../common/link.ld ../common/crt.s multiply.c
	$(CROSS)gcc $(CFLAGS) $(LFLAGS) -o multiply.elf ../common/crt.s multiply.c $(SRC)/time.c $(SRC)/uart.c

# A pseudo target to ensure hex files are generated before simulation
hex: test.hex

# Default target to build everything
all: sim

# Clean up generated files
clean:
	rm -f *.elf *.hex *.vvp *.asm