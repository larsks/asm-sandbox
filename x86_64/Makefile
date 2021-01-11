SOURCES = $(wildcard *.s)
OBJS = $(SOURCES:.s=.o)

%.o: %.s
	nasm -f elf64 -o $@ $<


%.elf: %.o
	ld -s -o $@ $<


all: hello.elf

clean:
	rm -f *.o *.elf
