#include <8051.h>

#include "preemptive.h"

/*
 * [TODO]
 * declare the static globals here using
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread;
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */

__data __at (0x30) char Pointer[MAXTHREADS];
__data __at (0x3C) ThreadID newThreadID;
__data __at (0x28) ThreadID ProdThreadID;
__data __at (0x34) int ValidBitMap;

__data __at (0x21) ThreadID curThreadID;
__data __at (0x22) char tempSP;
__data __at (0x23) char newSP;

/*
 * [TODO]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly,
 *     while 2) can be written in either assembly or C
 */
#define SAVESTATE               \
    {                           \
        /*push ACC, B register, Data pointer registers (DPL, DPH), PSW to stack*/
        __asm \
            PUSH ACC \
            PUSH B \
            PUSH DPL \
            PUSH DPH \
            PUSH PSW \
        __endasm; \

        /*save the current stack pointer (SP) based on curThreadID*/
        switch (curThreadID) { \
            case '0': \
                __asm \
                    MOV 0x30, SP \
                __endasm; \
                break; \
            case '1': \
                __asm \
                    MOV 0x31, SP \
                __endasm; \
                break; \
            case '2': \
                __asm \
                    MOV 0x32, SP \
                __endasm; \
                break; \
            case '3': \
                __asm \
                    MOV 0x33, SP \
                __endasm; \
                break; \
            default: \
                break; \
        } \
    }

/*
 * [TODO]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
#define RESTORESTATE            \
    {                           \
        /*Load the SP from the dedicated saved location [Pointer]*/
        switch (curThreadID) { \
            case '0': \
                    SP = Pointer[0]; \
                break; \
            case '1': \
                    SP = Pointer[1]; \
                break; \
            case '2': \
                    SP = Pointer[2]; \
                break; \
            case '3': \
                    SP = Pointer[3]; \
                break; \
            default: \
                break; \
        } \
        \
        /*pop the registers PSW, data pointer registers, B reg, and ACC*/
        __asm                   \
            POP PSW \
            POP DPH \
            POP DPL \
            POP B \
            POP ACC \
        __endasm;               \
    }

/*
 * we declare main() as an extern so we can reference its symbol
 * when creating a thread for it.
 */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void)
{
    /*
     * [TODO]
     * initialize data structures for threads (e.g., mask)
     *
     * optional: move the stack pointer to some known location
     * only during bootstrapping. by default, SP is 0x07.
     *
     * [TODO]
     *     create a thread for main; be sure current thread is
     *     set to this thread ID, and restore its context,
     *     so that it starts running main().
     */

    ValidBitMap = 0b0000;
    Pointer[0] = 0x3F;
    Pointer[1] = 0x4F;
    Pointer[2] = 0x5F;
    Pointer[3] = 0x6F;
    TMOD = 0; //timer zero
    IE = 0x82; 
    TR0 = 1;
    ProdThreadID = '1';
    curThreadID = ThreadCreate(main);
    RESTORESTATE;
}

/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp)
{
    /*
     * [TODO]
     * check to see we have not reached the max #threads.
     * if so, return -1, which is not a valid thread ID.
     */
    /*
     * [TODO]
     *     otherwise, find a thread ID that is not in use,
     *     and grab it. (can check the bit mask for threads),
     *
     * [TODO] below
     * a. update the bit mask
         (and increment thread count, if you use a thread count,
          but it is optional)
       b. calculate the starting stack location for new thread
       c. save the current SP in a temporary
          set SP to the starting location for the new thread
       d. push the return address fp (2-byte parameter to
          ThreadCreate) onto stack so it can be the return
          address to resume the thread. Note that in SDCC
          convention, 2-byte ptr is passed in DPTR.  but
          push instruction can only push it as two separate
          registers, DPL and DPH.
       e. we want to initialize the registers to 0, so we
          assign a register to 0 and push it four times
          for ACC, B, DPL, DPH.  Note: push #0 will not work
          because push takes only direct address as its operand,
          but it does not take an immediate (literal) operand.
       f. finally, we need to push PSW (processor status word)
          register, which consist of bits
           CY AC F0 RS1 RS0 OV UD P
          all bits can be initialized to zero, except <RS1:RS0>
          which selects the register bank.
          Thread 0 uses bank 0, Thread 1 uses bank 1, etc.
          Setting the bits to 00B, 01B, 10B, 11B will select
          the register bank so no need to push/pop registers
          R0-R7.  So, set PSW to
          00000000B for thread 0, 00001000B for thread 1,
          00010000B for thread 2, 00011000B for thread 3.
       g. write the current stack pointer to the saved stack
          pointer array for this newly created thread ID
       h. set SP to the saved SP in step c.
       i. finally, return the newly created thread ID.
     */
    
    EA = 0;

    /*Check Thread Ada*/
    if ((ValidBitMap & 0b1111) == 0b1111) {
        return -1;
    }
    /*get available Thread*/
    if ((ValidBitMap & 0b0001) == 0b0000) {
    newThreadID = '0';
    ValidBitMap |= 0b0001;
    newSP =  Pointer[0];
    } 
    else if ((ValidBitMap & 0b0010) == 0b0000) {
    newThreadID = '1';
    ValidBitMap |= 0b0010;
    newSP =  Pointer[1];
    } 
    else if ((ValidBitMap & 0b1000) == 0b0000) {
    newThreadID = '2';
    ValidBitMap |= 0b0100;
    newSP =  Pointer[2];
    } 
    else if ((ValidBitMap & 0b1000) == 0b0000) {
    newThreadID = '3';
    ValidBitMap |= 0b1000;
    newSP =  Pointer[3];
    }
    
    /*save the current SP in temporary*/
    __asm
    MOV 0x22, SP   
    MOV SP, 0x23    
    PUSH DPL
    PUSH DPH
    MOV A, 0x00
    PUSH A
    PUSH A
    PUSH A
    PUSH A
    __endasm;

    /*Push PSW*/
    switch (newThreadID) {
    case '0':
            PSW = 0b00000000;               
        __asm
            PUSH PSW
            MOV 0x30, SP
        __endasm;
        break;
    case '1':
            PSW = 0b00001000;
        __asm
            PUSH PSW
            MOV 0x31, SP
        __endasm;
        break;
    case '2':
        PSW = 0b00010000;
        __asm
            PUSH PSW
            MOV 0x32, SP
        __endasm;
        break;
    case '3':
        PSW = 0b00011000;
        __asm
            PUSH PSW
            MOV 0x33, SP
        __endasm;
        break;
    default:
        break;
    }

    /*Restore SP*/
    SP = tempSP;

    EA = 1;

    return newThreadID;
}

/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void)
__critical{
    SAVESTATE;
    do
    {
        /*
         * [TODO]
         * do round-robin policy for now.
         * find the next thread that can run and
         * set the current thread ID to it,
         * so that it can be restored (by the last line of
         * this function).
         * there should be at least one thread, so this loop
         * will always terminate.
         */
        curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;

        // Check if the thread is valid using a switch statement
        switch (curThreadID) {
            case '0':
                if ((ValidBitMap & 0b0001) == 0b0001) {
                    break; // Exit loop if thread 0 is runnable
                }
                continue; // Move to the next thread
            case '1':
                if ((ValidBitMap & 0b0010) == 0b0010) {
                    break; // Exit loop if thread 1 is runnable
                }
                continue;
            case '2':
                if ((ValidBitMap & 0b0100) == 0b0100) {
                    break; // Exit loop if thread 2 is runnable
                }
                continue;
            case '3':
                if ((ValidBitMap & 0b1000) == 0b1000) {
                    break; // Exit loop if thread 3 is runnable
                }
                continue;
        }
        break;

    } while (1);
    RESTORESTATE;
}

/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void)
__critical{
    /*
     * clear the bit for the current thread from the
     * bit mask, decrement thread count (if any),
     * and set current thread to another valid ID.
     * Q: What happens if there are no more valid threads?
     */
    switch (curThreadID) {
        case '0':
            ValidBitMap &= 0b1110; // Clear bit 0
            break;
        case '1':
            ValidBitMap &= 0b1101; // Clear bit 1
            break;
        case '2':
            ValidBitMap &= 0b1011; // Clear bit 2
            break;
        case '3':
            ValidBitMap &= 0b0111; // Clear bit 3
            break;
        default:
            return;
    }

    do {
        curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;

        switch (curThreadID) {
            case '0':
                if ((ValidBitMap & 0b0001) == 0b0001) {
                    break; // Exit loop if thread 0 is valid
                }
                continue;
            case '1':
                if ((ValidBitMap & 0b0010) == 0b0010) {
                    break; // Exit loop if thread 1 is valid
                }
                continue;
            case '2':
                if ((ValidBitMap & 0b0100) == 0b0100) {
                    break; // Exit loop if thread 2 is valid
                }
                continue;
            case '3':
                if ((ValidBitMap & 0b1000) == 0b1000) {
                    break; // Exit loop if thread 3 is valid
                }
                continue;
            default:
                break;
        }
        break;
    } while (1);

    RESTORESTATE;
}

void myTimer0Handler(void){
    EA = 0;
    SAVESTATE;
    do{

        if (curThreadID != '0') {
            //Transition From producer1 or producer2 to consumer
            curThreadID = '0';
        } 
        else {
            // From consumer to producers
            // Need to decide to avoid starvation
            curThreadID = ProdThreadID;
            ProdThreadID += 1;
            if (ProdThreadID == '3') {
                ProdThreadID = '1';
            }
        }

        switch (curThreadID) {
            case '0':
                if ((ValidBitMap & 0b0001) == 0b0001) break;
                continue;
            case '1':
                if ((ValidBitMap & 0b0010) == 0b0010) break;
                continue;
            case '2':
                if ((ValidBitMap & 0b0100) == 0b0100) break;
                continue;
            case '3':
                if ((ValidBitMap & 0b1000) == 0b1000) break;
                continue;
        }
        break;
      } while (1);
      RESTORESTATE;
      
      EA = 1;
      __asm
         RETI
      __endasm;
}