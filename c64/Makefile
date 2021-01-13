LD65 = ld65
CA65 = ca65

SRCS = $(wildcard *.s)
OBJS = $(SRCS:.s=.o)
PRGS = $(SRCS:.s=.prg)
LSTS = $(SRCS:.s=.lst)

%.prg %.lst: %.o
	$(LD65) --lib c64.lib -C c64-asm.cfg -o $@ $<

 %.o: %.s
	$(CA65) -t c64 -o $@ -l $(@:.o=.lst) $<

all: $(PRGS)

clean:
	rm -f $(PRGS) $(OBJS) $(LSTS)
