/*
 * file: testcoop.c
 */
#include <8051.h>
#include "cooperative.h"

/*
 * [TODO]
 * declare your global variables here, for the shared buffer
 * between the producer and consumer.
 * Hint: you may want to manually designate the location for the
 * variable.  you can use
 *        __data __at (0x30) type var;
 * to declare a variable var of the type
 */

__data __at (0x36) char SharedBuffer;
__data __at (0x37) int Buffer_Availability;

/* [TODO for this function]
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */
void Producer(void)
{
    /*
     * [TODO]
     * initialize producer data structure, and then enter
     * an infinite loop (does not return)
     */
    SharedBuffer = 'A';
    while (1)
    {
        /* [TODO]
         * wait for the buffer to be available,
         * and then write the new data into the buffer */
        if(Buffer_Availability){
            ThreadYield();
        }
        else{
            Buffer_Availability += 1;
            ThreadYield();
            if(SharedBuffer == 'Z'){
                SharedBuffer = 'A';
            }
            else{
                SharedBuffer += 1;
            }
        }
    }
}

/* [TODO for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */
void Consumer(void)
{
    /*
     * [TODO]
     * initialize Tx for polling
     */
    TMOD = 0x20;
    TH1 = (char)-6;
    SCON = 0x50;
    TR1 = 1;
    TI = 1;

    while (1)
    {
        /*
         * [TODO]
         * wait for new data from producer
         * write data to serial port Tx,
         * poll for Tx to finish writing (TI),
         * then clear the flag
         */

        while (Buffer_Availability == 0) {
            ThreadYield();
        }
        
        while (!TI){
        }
        SBUF = SharedBuffer;
        TI = 0;
         Buffer_Availability -= 1;
        ThreadYield();
    }
}

/* [TODO for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can act as producer and another as consumer.
 */
void main(void)
{
    /*
     * [TODO]
     * initialize globals
     */

    SharedBuffer = ' ';
    Buffer_Availability = 0;
    
    /*
     * [TODO]
     * set up Producer and Consumer.
     * Because both are infinite loops, there is no loop
     * in this function and no return.
     */
    ThreadCreate(Producer);
    Consumer();
}

void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
