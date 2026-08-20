SNAKE BOOT0

SNAKE BOOT0 is a Snake-inspired game written in 6502 Assembly for the Apple II
line of computers and optimized to fit a single disk sector so that it
can be played as a sector 0 bootable game. 

Snake was developed on a Linux Mint PC running the AS65 cross assembly program. 
The assembler package is included in the tools directory.

Repository contents:

Makefile                - For use with GNU/Linux make program
LICENSE                 - MIT License conditions for the SNAKE BOOT0 program, 
                          excluding the AS65 package, which is distributed 
                          under its own terms
README.md               - This file

source/snake.a65        - 6502 assembly code using AS65 syntax
source/makesnakedisk.sh - shell script to create a dsk file with the game on 
                          sector 0
source/makesnakebinfile.sh - shell script to create a DOS 3.3 loadable binary file
                             only needed if you want to copy this into a DOS disk

bin/snake.bin           - binary to load into sector 0 of a disk
bin/snakeloadable.bin   - binary to copy into a standard DOS disk

disk/snake.dsk          - disk with bootable sector-0 game program (no DOS)

tools/as65_142.zip      - AS65 assembler package by Frank A. Kingswood. 

Bootable zero sector games became famous on the PC architecture, where they 
can be up to 510 bytes long. On the Apple II, boot sector zero is 256 bytes 
but the first byte is reserved. So, the maximum size of binary code is 255 bytes.

The first byte on sector 0 indicates to the Disk Interface ROM the number of 
sectors to read from track 0 following the reading of sector 0. Sector 0 
is placed at address $0800 so the game needs to be executed from $0801. 

makesnakedisk.sh initializes this byte to 0. Change it if you want to support
a longer code size (you will also need to extend the shell script)

makesnakebinfile.sh creates a loadable version of the game in case you want 
to copy it to a standard DOS 3.3 disk. It adds the starting address and the 
code length to the binary. It is not required for the boot zero disk version 
and is entirely optional. 

To build the game on Linux, type make from the project directory. 

This overwrites: 
    bin/snake.bin
    bin/snakeloadable.bin
    disk/snake.dsk

Gameplay: Use A, Z and arrows to control snake. Eat fruits for points

