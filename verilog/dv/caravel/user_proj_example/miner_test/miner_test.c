#include "../../defs.h"
#include "../../stub.c"

static volatile unsigned *regs = (unsigned*)0x30000000U;

static const unsigned soln_b = 0;
static const unsigned stat_b = 2;
static const unsigned hdr_b = 4;
static const unsigned diff_b = 12;
static const unsigned start_b = 20;
static const unsigned ctl_b = 22;

// header: 644a7f32 cc155134 2997512a df12ab67 b94e7a63 2a26a07e d4615959 dd8d5b09
// nonce:  1883832e 85da0f7a
// hash:   a4b44b86 80040878 f767b763 c46bbca6 19c1e1af 1c5c37da 42e11e05 8cb09ca0

static inline void write_reg(unsigned r, unsigned v) {
    regs[r] = v;
}

static inline unsigned read_reg(unsigned r) {
    return regs[r];
}


void main()
{
    unsigned long long start, s, solution;
    unsigned status;

	// Set UART clock to 64 kbaud (enable before I/O configuration)
	reg_uart_clkdiv = 625;
	reg_uart_enable = 1;

        /* Apply configuration */
        reg_mprj_xfer = 1;
        while (reg_mprj_xfer == 1);

    for (int i = 0; i < 32; i++) {
        write_reg(ctl_b, 0);
        // header 
        write_reg(hdr_b + 0, (0x644a7f32));
        write_reg(hdr_b + 1, (0xcc155134));
        write_reg(hdr_b + 2, (0x2997512a));
        write_reg(hdr_b + 3, (0xdf12ab67));
        write_reg(hdr_b + 4, (0xb94e7a63));
        write_reg(hdr_b + 5, (0x2a26a07e));
        write_reg(hdr_b + 6, (0xd4615959));
        write_reg(hdr_b + 7, (0xdd8d5b09));
        // start nonce
        start = 0x1883832e85da0f7aULL;
        s = start - i;
        write_reg(start_b + 1, (unsigned)s);
        write_reg(start_b + 0, s >> 32);
        // diff
        write_reg(diff_b + 0, (0xa4b44b86));
        write_reg(diff_b + 1, (0x80040878));
        write_reg(diff_b + 2, (0xf767b763));
        write_reg(diff_b + 3, (0xc46bbca6));
        write_reg(diff_b + 4, (0x19c1e1af));
        write_reg(diff_b + 5, (0x1c5c37da));
        write_reg(diff_b + 6, (0x42e11e05));
        write_reg(diff_b + 7, (0x8cb09ca0));

        // control
        write_reg(ctl_b, 0x01800003);
           
        for (int j = 0; j < 5000000; j = j + 1) {
            status = read_reg(stat_b);
            if ((status & 7) == 7)
                break;
        }
        status = read_reg(ctl_b);
        solution = read_reg(soln_b + 0) +
            ((unsigned long long)read_reg(soln_b + 1) << 32);
        write_reg(ctl_b, 0);
        if ((solution != start) || ((status & 7) != 7)) {
	    print("\nFailed\n");	// Makes simulation very long!
	    reg_mprj_datal = 0xAB510000;
            return;
        }
    }
    print("\nPassed\n");	// Makes simulation very long!
    reg_mprj_datal = 0xAB510000;
}

