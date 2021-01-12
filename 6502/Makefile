%.prg: %.s
	64tass -a -o $@ $<

%.lst: %.prg
	rasm2 -a 6502 -i2 -D -B -r -f $< -O $@

all: hello.prg

clean:
	rm -f *.prg
