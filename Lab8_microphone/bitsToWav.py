import serial
import wave
import struct

# Configuration parameters
SERIAL_PORT = '/dev/ttyUSB1'  # Replace with your actual serial port
BAUD_RATE = 1500000            # Ensure this matches the baud rate used by your device
WAV_FILE = 'output.wav'
SAMPLE_RATE = 15625           # 16 kHz
CHANNELS = 1                  # Mono
SAMPLE_WIDTH = 2              # 16-bit PCM is 2 bytes per sample
DURATION = 5                # Duration of recording in seconds (adjust as needed)

# Open the serial port
ser = serial.Serial(SERIAL_PORT, BAUD_RATE)

# Open the output WAV file
with wave.open(WAV_FILE, 'wb') as wav_file:
    # Set up the WAV file header with the appropriate parameters
    wav_file.setnchannels(CHANNELS)
    wav_file.setsampwidth(SAMPLE_WIDTH)
    wav_file.setframerate(SAMPLE_RATE)

    print(f"Recording {DURATION} seconds of audio from {SERIAL_PORT}...")

    # Calculate the total number of samples to read
    num_samples = SAMPLE_RATE * DURATION

    # Read and write the samples
    for _ in range(num_samples):
        # Read 2 bytes (16-bit sample) from the serial port
        sample = ser.read(SAMPLE_WIDTH)

        if len(sample) == SAMPLE_WIDTH:
            # Unpack the 2 bytes as a 16-bit signed short (little-endian)
            sample_value = struct.unpack('<h', sample)[0]

            # Convert the sample to byte data (packed into little-endian format)
            packed_sample = struct.pack('<h', sample_value)

            # Write the sample to the WAV file
            wav_file.writeframesraw(packed_sample)

    print("Recording complete.")

# Close the serial port
ser.close()
