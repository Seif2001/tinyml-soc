import serial

# Configuration parameters
SERIAL_PORT = '/dev/ttyUSB0'  # Replace with your actual serial port
BAUD_RATE = 600000            # Should match the baud rate of the microcontroller

# Open the serial port
ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=1)

try:
    while True:
        # Continuously check if data is available
        if ser.in_waiting > 0:
            # Read two bytes at a time (since your microcontroller is sending two bytes per sample)
            data = ser.read(2)
            
            # You may want to do something with the data, for example, process or store it
            print(data)  # This will print the raw bytes as received from the microcontroller
            # Optionally, decode or process the data (if it's in a known format)
            # For example, if you expect the data to be ASCII encoded, you can decode it:
            # print(data.decode('utf-8', errors='ignore'))

except KeyboardInterrupt:
    print("Exiting...")
finally:
    ser.close()
