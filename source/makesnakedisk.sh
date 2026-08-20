#!/bin/sh

# Create a 143,360-byte empty disk image
dd if=/dev/zero of=disk/snake.dsk bs=256 count=560

# Put $00 + your 255-byte program into sector 0
dd if=/dev/zero dd of=disk/snake.dsk bs=1 count=1 conv=notrunc
dd if=bin/snake.bin of=disk/snake.dsk bs=1 seek=1 conv=notrunc


