#!/bin/sh

if [ ! -f bin/snake2.bin ]; then
    echo "Error: Input file bin/snake2.bin does not exist!" >&2
    exit 1
fi

# Create a 512 byte 1 block empty .hdv image
dd if=/dev/zero of=disk/snake2.hdv bs=512 count=1

# Put $01 + your 511-byte program into block 0
printf '\x01' | dd of=disk/snake2.hdv bs=1 count=1 conv=notrunc
# Append max 511 bytes at the end
dd if=bin/snake2.bin of=disk/snake2.hdv skip=1 bs=1 seek=1 count=511 conv=notrunc


