%.bin: %.o
	ld65 -t none -o $@ $<

%.prg: %.s
	cl65 -t c64 -C c64-asm.cfg -l $(<:.s=.lst) -o $@ $<

# %.o: %.s
# 	ca65 -t c64 -o $@ -l $(@:.o=.lst) $<


all: hello.prg

clean:
	rm -f *.prg *.o
