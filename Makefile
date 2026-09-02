

SOURCE1   = source/snake.a65
SOURCE2   = source/snake2.a65
OUTPUT1    = bin/snake.bin
OUTPUT2    = bin/snake2.bin
LOADABLE  = bin/snakeloadable.bin
DISK1     = disk/snake.dsk
DISK2     = disk/snake2.hdv
64TASS    = 64tass

.PHONY: all disk clean

all: $(OUTPUT1) $(OUTPUT2) $(LOADABLE) $(DISK1) $(DISK2)

$(OUTPUT1): $(SOURCE1)
	$(64TASS) -b $(SOURCE1) -o$(OUTPUT1)

$(OUTPUT2): $(SOURCE2)
	$(64TASS) -b $(SOURCE2) -o$(OUTPUT2)

$(LOADABLE): $(OUTPUT1)
	source/makesnakebinfile.sh $(OUTPUT1) $(LOADABLE)

$(DISK1): $(OUTPUT1)
	source/makesnakedisk.sh

$(DISK2): $(OUTPUT2)
	source/makesnakehdv.sh

clean:
	rm -f bin/* disk/*
