AS:=yasm
CC:=gcc
ASFLAGS:=-g dwarf2 -f elf64 -a x86
#ASFLAGS:=-f elf64
#CFLAGS:=-g -Wall -s -Os
CFLAGS:=-Wall -s -Os

#$(CC) $(CFLAGS) -o httpd $(OBJECTS)

OBJECTSDIR:=$(shell pwd)/bin
SRCDIR:=$(shell pwd)/src
SOURCES=$(wildcard $(SRCDIR)/*.asm)
OBJECTS=$(shell find $(OBJECTSDIR) -name *.o)


%.o: %.asm
	$(AS) $(ASFLAGS) -o $(subst $(SRCDIR),$(OBJECTSDIR),$@) $<

httpd: $(SOURCES:.asm=.o)
	ld -m elf_x86_64 -o httpd $(OBJECTS)


clean:
	rm -f $(OBJECTSDIR)/*
	rm -f httpd