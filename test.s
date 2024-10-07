    .section .text
    .globl _start           # Define global entry point

# Constants
    .equ IO_BASE, 0x40000000     # I/O register address

_start:
    # Load the value to be written to the I/O register into a0
    li a0, 0xF00FE00E       # Load immediate value into register a0
    la t0, IO_BASE          # Load immediate value into register t0

    # Store the value in a0 into the I/O register (memory-mapped)
    sw a0, 0(t0)            # Store word (a0) to the address 0x40000000

    # Enter an infinite loop to stop the program from exiting
loop:
    j loop                   # Infinite loop
