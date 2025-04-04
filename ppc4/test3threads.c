#include <8051.h>
#include "preemptive.h"

/*
 * [TODO]
 * declare your global variables here, for the shared buffer
 * between the producer and consumer.
 * Hint: you may want to manually designate the location for the
 * variable.  you can use
 *        __data __at (0x30) type var;
 * to declare a variable var of the type
 */

__data __at (0x35) char TheChar;
__data __at (0x36) char TheInt;
__data __at (0x25) char mutex;
__data __at (0x26) char full;
__data __at (0x27) char empty;
__data __at (0x3A) char head;
__data __at (0x3B) char tail; 
__data __at (0x3D) char SharedBuffer[3];

/*
__data __at (0x30) char Pointer[MAXTHREADS];
__data __at (0x3C) ThreadID newThreadID;
__data __at (0x34) int ValidBitMap;

__data __at (0x21) ThreadID curThreadID;
__data __at (0x22) char tempSP;
__data __at (0x23) char newSP;
*/

#define CNAME(s) _ ## s
#define LABELNAME(label) label ## $


void SemaphoreCreate(char *s, char n){ 
    EA = 0;
    *s = n; 
    EA = 1;
}

/* [TODO for this function]
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */
void Producer1(void)
{
    /*
     * [TODO]
     * initialize producer data structure, and then enter
     * an infinite loop (does not return)
     */
    EA = 0; //accessed atomically
    TheChar = 'A'-1;
    EA = 1;

    while (1)
    {
        /* [TODO]
         * wait for the buffer to be available,
         * and then write the new data into the buffer */
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        EA = 0;

        if(TheChar == 'Z'){
                TheChar = 'A';
        }
        else{
                TheChar += 1;
        }
        SharedBuffer[tail] = TheChar;
        tail += 1;
        if(tail == 3){
            tail = 0;
        }

        EA = 1;
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
    }
}

void Producer2(void){
    EA = 0;
    TheInt = '0'-1;
    EA = 1;

    while (1)
    {
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        EA = 0;

        if(TheInt == '9'){
                TheInt = '0';
        }
        else{
                TheInt += 1;
        }
        SharedBuffer[tail] = TheInt;
        tail += 1;
        if(tail == 3){
            tail = 0;
        }

        EA = 1;
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
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
    TMOD |= 0x20;
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

        SemaphoreWait(full);
        SemaphoreWait(mutex);
        EA = 0;

        while (!TI){
        }
        SBUF = SharedBuffer[head];
        TI = 0;
        head += 1;
        if(head == 3){
            head = 0;
        }

        EA = 1;
        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);
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

    SemaphoreCreate(&mutex, 1);
    SemaphoreCreate(&full, 0);
    SemaphoreCreate(&empty, 3);

    head = 0;
    tail = 0;

    SharedBuffer[0] = ' ';
    SharedBuffer[1] = ' ';
    SharedBuffer[2] = ' ';
    
    /*
     * [TODO]
     * set up Producer and Consumer.
     * Because both are infinite loops, there is no loop
     * in this function and no return.
     */
    ThreadCreate(Producer1);
    ThreadCreate(Producer2);
    Consumer();
}

void _sdcc_gsinit_startup(void)
{
    __asm
        ljmp _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1) {
        __asm
                ljmp _myTimer0Handler
        __endasm;
}
