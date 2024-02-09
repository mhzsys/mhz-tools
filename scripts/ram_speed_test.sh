#!/bin/bash

# Set the block size for the dd command
block_size=1M

# Set the number of blocks to read/write
num_blocks=1000

# Function to perform the test
perform_test() {
    echo "Performing RAM speed test with bs=$block_size count=$num_blocks ..."
    dd if=/dev/zero of=/dev/null bs=$block_size count=$num_blocks
}

# Main function
main() {
    # Check if the script is run as root
    if [ "$(id -u)" != "0" ]; then
        echo "This script must be run as root" 1>&2
        exit 1
    fi

    # Disable swap temporarily if it's enabled
    swapoff -a

    # Run the test
    perform_test

    # Re-enable swap if it was previously enabled
    swapon -a
}

# Call the main function
main