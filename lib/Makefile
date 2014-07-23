AS:=yasm
CC:=gcc
OUTPUTDIR:=$(shell pwd)/bin
SRCDIR:=$(shell pwd)/src
ASFLAGS:=-g dwarf2 -f elf64 -a x86
CFLAGS:=-g
SOURCES=$(shell ls $(SRCDIR)/*.asm | grep -v main.asm)

httpd: main.o
	$(CC) $(CFLAGS) -o httpd $(OUTPUTDIR)/$<

main.o:$(SOURCES)
	$(AS) $(ASFLAGS) -o $(OUTPUTDIR)/$@ $(SRCDIR)/main.asm

clean:
	rm -f $(OUTPUTDIR)/*
	rm -f httpd