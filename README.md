# SNAKE BOOT0

SNAKE BOOT0 is a Snake-inspired game written in 6502 Assembly for the Apple II
line of computers and optimized to fit a single disk sector so that it can be
played as a sector 0 bootable game.

Snake was originaly developed on a Linux Mint PC running the AS65 cross assembly program.

### Snake Version 1.1 
255-byte challenge version now Jumps to Basic cold start routine at end of game to avoid crash

### new Snake Version 2 for 1-block-512-byte challenge with more functionality

for versions 1.1 and 2 the 64tass assembler(1.60.3243), Visual Studio Code and some Powershell scripts on Windows are used

on Linux install 64tass via:
sudo apt update
sudo apt install -y 64tass 

## Repository contents

- `Makefile` — For use with GNU/Linux `make`
- `LICENSE` — MIT License conditions for SNAKE BOOT0, excluding the AS65/64tass package,
  which is distributed under its own terms
- `README.md` — This file
- `source/snake.a65` — 6502 assembly code using 64tass syntax
- `source/snake2.a65` — 6502 assembly code using 64tass syntax
- `source/makesnakedisk.sh` — Shell script to create a `.dsk` file with the game
  in sector 0
- `source/makesnakehdv.sh` — Shell script to create a `.hdv` file with the game
  in block 0
- `source/makesnakedisk.ps1` — Powershell script to create `.dsk` and `.hdv` file with the game
  in sector/block 0
- `source/makesnakebinfile.sh` — Shell script to create a DOS 3.3 loadable binary
- `source/makesnakebinfile.ps1` — Powershell script to create a DOS 3.3 loadable binary with one 512 block
- `bin/snake.bin` — Binary to load into sector 0 of a disk
- `bin/snake2.bin` — Binary to load into block 0 of a disk
- `bin/snakeloadable.bin` — Binary to copy into a standard DOS disk
- `disk/snake.dsk` — Disk with bootable sector-0 game program (no DOS)
- `disk/snake2.hdv` — Disk with bootable block-0 game program (no DOS)

## The 255-byte challenge

Bootable zero-sector games became famous on the PC architecture, where they can
be up to 510 bytes long.

On the Apple II, boot sector zero is 256 bytes, but the first byte is reserved.
So, the maximum size of binary code is **255 bytes**.

The first byte on sector 0 indicates to the Disk Interface ROM the number of
sectors to read from track 0 following the reading of sector 0. Sector 0 is
placed at address `$0800` so the game needs to be executed from `$0801`.

`makesnakedisk.sh` initializes this byte to `0`. Change it if you want to
support a longer code size (you will also need to extend the shell script).

## DOS 3.3 version

`makesnakebinfile.sh` creates a loadable version of the game in case you want
to copy it to a standard DOS 3.3 disk.

It adds the starting address and the code length to the binary. It is not
required for the boot zero disk version and is entirely optional.

## Building

To build the game on Linux, you will need to update the 64TASS setting in the Makefile
and then type:

    make

This overwrites:

- `bin/snake.bin`
- `bin/snake2.bin`
- `bin/snakeloadable.bin`
- `disk/snake.dsk`
- `disk/snake2.hdv`

on Windows and Visual Studion code check .vscode/tasks.json and then build

## Gameplay

Use **A**, **Z**, and the arrow keys to control the snake for Version 1

Use keys I = Up M = Down J = Left L = Right to control the snake for Version 2

Eat fruits for points.
