CROSS=riscv64-unknown-elf-
CFLAGS=-march=rv32imac_zicsr -mabi=ilp32 -ffreestanding -nostdlib -O0 -Wall
LFLAGS=-Wl,--build-id=none,-Bstatic,-T,../common/link.ld,--strip-debug
VFILES=Hazard2_SoC.f
TBFILES=../../rtl/SoC/Hazard2_SoC_tb.v
SRC=../common/src

# Rule for simulation using iverilog
sim: interupts.vvp
	vvp interupts.vvp

# Compile Verilog files and testbench into a vvp file for simulation
interupts.vvp: $(VFILES) $(TBFILES) interupts.hex
	iverilog -f $(VFILES) -o interupts.vvp $(TBFILES)

# Generate interupts.hex file from interupts.elf
interupts.hex: interupts.elf
	$(CROSS)objdump -D interupts.elf > interupts.asm
	$(CROSS)objcopy --verilog-data-width=4 -O verilog interupts.elf /home/seif/dev/projects/tinyml-soc/test.hex

# Compile the C code into a RISC-V ELF executable
interupts.elf: ../common/link.ld ../common/crt.s interupts.c
	$(CROSS)gcc $(CFLAGS) $(LFLAGS) -o interupts.elf ../common/crt.s interupts.c $(SRC)/time.c $(SRC)/uart.c

# A pseudo target to ensure hex files are generated before simulation
hex: test.hex

# Default target to build everything
all: sim

# Clean up generated files
clean:
	rm -f *.elf *.hex *.vvp *.asm