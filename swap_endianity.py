import sys

# Get the script name
script_name = sys.argv[0]

# Get the command line arguments
arguments = sys.argv[1:]

def swap_endianness(hex_file, output_file):
    with open(hex_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line in infile:
            if line[0] == '@':
                outfile.write(line)
                continue
            hex_values = line.split()
            for hex_value in hex_values:
                swapped = hex_value[6:8] + hex_value[4:6] + hex_value[2:4] + hex_value[0:2]
                outfile.write(swapped + ' ')
            outfile.write('\n')

# Usage
swap_endianness(arguments[0], arguments[1])
