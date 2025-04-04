/*
 * file: preemptive.h
 *
 * this is the include file for the preemptive multithreading
 * package.  It is to be compiled by SDCC and targets the EdSim51 as
 * the target architecture.
 *
 * CS 3423 Fall 2018
 */

#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4 /* not including the scheduler */
/* the scheduler does not take up a thread of its own */



#define CNAME(s) _ ## s
#define CNAMELABEL(label) label ## $

#define SemaphoreWait(s){ \
    SemaphoreWaitBody(s, __COUNTER__) \
}   


#define SemaphoreSignal(s){ \
    __asm \
        INC CNAME(s) \
    __endasm; \
}  

#define SemaphoreWaitBody(S, label) \
    { __asm \
CNAMELABEL(label):  MOV ACC, CNAME(S) \
                    JZ CNAMELABEL(label) \
                    JB ACC.7, CNAMELABEL(label) \
                    dec  CNAME(S) \
      __endasm; }



typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);

#endif // __COOPERATIVE_H__