#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "flags.h"

uint8_t* s_memory6502; //[65536];

extern void reset6502();
extern void execute6502();
extern struct PDBackendPlugin s_debuggerPlugin;
extern uint32_t clockticks6502;
extern uint32_t clockgoal6502;
extern uint16_t pc, status;
void exec6502(uint32_t tickcount);
void step6502();

int ateof = 0;

#define ADDR_PUTC 0xf001
#define ADDR_GETC 0xf004
#define ADDR_EOF  0xf002

uint8_t mm_getc() {
    unsigned int ch = getchar();

    if (ch == EOF) {
        ateof = 1;
        ch = 0;
    } else {
        ateof = 0;
    }

    return ch;
}

void mm_putc(uint8_t value) {
    putchar(value);
}

uint8_t read6502(uint16_t address)
{
    switch (address) {
        case ADDR_EOF:
            return ateof;

        case ADDR_GETC:
            return mm_getc();

        default:
            return s_memory6502[address];
    }
}

void write6502(uint16_t address, uint8_t value)
{
    switch (address) {
        case ADDR_PUTC:
            mm_putc(value);

        default:
            s_memory6502[address] = value;
    }
}

int main(int argc, const char* argv[])
{
    FILE* f;
    int size;

    s_memory6502 = malloc(65536);
    memset(s_memory6502, 0, 65536);

    reset6502();

    if (argc < 2)
    {
        printf("Usage: Fake6502 image.bin (max 64k in size)\n");
        return 0;
    }

    if ((f = fopen(argv[1], "rb")) == 0)
    {
        printf("Unable to open %s\n", argv[1]);
        return -1;
    }

    // offset with 6 due to stupid compiler

    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fseek(f, 0, SEEK_SET);

    fread(s_memory6502, 1, size, f);
    fclose(f);

    pc = 0x100;

    for (;;)    
    {
        exec6502(1);

        if (status & FLAG_INTERRUPT) break;
    }

    return 0;
}

