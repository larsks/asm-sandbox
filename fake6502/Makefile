SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)

CFLAGS = -g

all: run6502

run6502: $(OBJS)
	$(CC) -o $@ $(OBJS)

clean:
	rm -f $(OBJS)
