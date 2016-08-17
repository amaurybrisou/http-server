AS:=yasm
CC:=gcc
ASFLAGS:=-g dwarf2 -f elf64 -a x86 
#ASFLAGS:=-f elf64
#CFLAGS:=-g -Wall -s -Os
CFLAGS:=-Wall -s -Os -g

#$(CC) $(CFLAGS) -o httpd $(OBJECTS)

OBJECTSDIR:=$(shell pwd)/bin
SRCDIR:=$(shell pwd)/src
SOURCES=$(wildcard $(SRCDIR)/*.asm)
OBJECTS=$(shell find $(OBJECTSDIR) -name *.o)


httpd: main.o
	ld -m elf_x86_64 -o $(OBJECTSDIR)/httpd $(OBJECTS)
	
main.o: $(SOURCES)
	$(AS) $(ASFLAGS) -o $(OBJECTSDIR)/$@ $(subst .o,.asm,$(SRCDIR)/$@)

clean:
	rm -f $(OBJECTSDIR)/*
	rm -f httpd