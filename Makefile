AS65_DIR ?= ~/Apps/AS65

SOURCE   = source/snake.a65
OUTPUT   = bin/snake.bin
LOADABLE = bin/snakeloadable.bin
DISK     = disk/snake.dsk
AS65     = $(AS65_DIR)/as65

.PHONY: all disk clean

all: $(OUTPUT) $(LOADABLE) $(DISK)

$(OUTPUT): $(SOURCE)
	$(AS65) -l $(SOURCE) -o$(OUTPUT)

$(LOADABLE): $(OUTPUT)
	source/makesnakebinfile.sh $(OUTPUT) $(LOADABLE)

$(DISK): $(OUTPUT)
	source/makesnakedisk.sh

clean:
	rm -f bin/* disk/*
