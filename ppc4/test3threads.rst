                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SemaphoreCreate_PARM_2
                                     12 	.globl _timer0_ISR
                                     13 	.globl __mcs51_genXRAMCLEAR
                                     14 	.globl __mcs51_genXINIT
                                     15 	.globl __mcs51_genRAMCLEAR
                                     16 	.globl __sdcc_gsinit_startup
                                     17 	.globl _main
                                     18 	.globl _Consumer
                                     19 	.globl _Producer2
                                     20 	.globl _Producer1
                                     21 	.globl _SemaphoreCreate
                                     22 	.globl _ThreadCreate
                                     23 	.globl _CY
                                     24 	.globl _AC
                                     25 	.globl _F0
                                     26 	.globl _RS1
                                     27 	.globl _RS0
                                     28 	.globl _OV
                                     29 	.globl _F1
                                     30 	.globl _P
                                     31 	.globl _PS
                                     32 	.globl _PT1
                                     33 	.globl _PX1
                                     34 	.globl _PT0
                                     35 	.globl _PX0
                                     36 	.globl _RD
                                     37 	.globl _WR
                                     38 	.globl _T1
                                     39 	.globl _T0
                                     40 	.globl _INT1
                                     41 	.globl _INT0
                                     42 	.globl _TXD
                                     43 	.globl _RXD
                                     44 	.globl _P3_7
                                     45 	.globl _P3_6
                                     46 	.globl _P3_5
                                     47 	.globl _P3_4
                                     48 	.globl _P3_3
                                     49 	.globl _P3_2
                                     50 	.globl _P3_1
                                     51 	.globl _P3_0
                                     52 	.globl _EA
                                     53 	.globl _ES
                                     54 	.globl _ET1
                                     55 	.globl _EX1
                                     56 	.globl _ET0
                                     57 	.globl _EX0
                                     58 	.globl _P2_7
                                     59 	.globl _P2_6
                                     60 	.globl _P2_5
                                     61 	.globl _P2_4
                                     62 	.globl _P2_3
                                     63 	.globl _P2_2
                                     64 	.globl _P2_1
                                     65 	.globl _P2_0
                                     66 	.globl _SM0
                                     67 	.globl _SM1
                                     68 	.globl _SM2
                                     69 	.globl _REN
                                     70 	.globl _TB8
                                     71 	.globl _RB8
                                     72 	.globl _TI
                                     73 	.globl _RI
                                     74 	.globl _P1_7
                                     75 	.globl _P1_6
                                     76 	.globl _P1_5
                                     77 	.globl _P1_4
                                     78 	.globl _P1_3
                                     79 	.globl _P1_2
                                     80 	.globl _P1_1
                                     81 	.globl _P1_0
                                     82 	.globl _TF1
                                     83 	.globl _TR1
                                     84 	.globl _TF0
                                     85 	.globl _TR0
                                     86 	.globl _IE1
                                     87 	.globl _IT1
                                     88 	.globl _IE0
                                     89 	.globl _IT0
                                     90 	.globl _P0_7
                                     91 	.globl _P0_6
                                     92 	.globl _P0_5
                                     93 	.globl _P0_4
                                     94 	.globl _P0_3
                                     95 	.globl _P0_2
                                     96 	.globl _P0_1
                                     97 	.globl _P0_0
                                     98 	.globl _B
                                     99 	.globl _ACC
                                    100 	.globl _PSW
                                    101 	.globl _IP
                                    102 	.globl _P3
                                    103 	.globl _IE
                                    104 	.globl _P2
                                    105 	.globl _SBUF
                                    106 	.globl _SCON
                                    107 	.globl _P1
                                    108 	.globl _TH1
                                    109 	.globl _TH0
                                    110 	.globl _TL1
                                    111 	.globl _TL0
                                    112 	.globl _TMOD
                                    113 	.globl _TCON
                                    114 	.globl _PCON
                                    115 	.globl _DPH
                                    116 	.globl _DPL
                                    117 	.globl _SP
                                    118 	.globl _P0
                                    119 	.globl _SharedBuffer
                                    120 	.globl _tail
                                    121 	.globl _head
                                    122 	.globl _empty
                                    123 	.globl _full
                                    124 	.globl _mutex
                                    125 	.globl _TheInt
                                    126 	.globl _TheChar
                                    127 ;--------------------------------------------------------
                                    128 ; special function registers
                                    129 ;--------------------------------------------------------
                                    130 	.area RSEG    (ABS,DATA)
      000000                        131 	.org 0x0000
                           000080   132 _P0	=	0x0080
                           000081   133 _SP	=	0x0081
                           000082   134 _DPL	=	0x0082
                           000083   135 _DPH	=	0x0083
                           000087   136 _PCON	=	0x0087
                           000088   137 _TCON	=	0x0088
                           000089   138 _TMOD	=	0x0089
                           00008A   139 _TL0	=	0x008a
                           00008B   140 _TL1	=	0x008b
                           00008C   141 _TH0	=	0x008c
                           00008D   142 _TH1	=	0x008d
                           000090   143 _P1	=	0x0090
                           000098   144 _SCON	=	0x0098
                           000099   145 _SBUF	=	0x0099
                           0000A0   146 _P2	=	0x00a0
                           0000A8   147 _IE	=	0x00a8
                           0000B0   148 _P3	=	0x00b0
                           0000B8   149 _IP	=	0x00b8
                           0000D0   150 _PSW	=	0x00d0
                           0000E0   151 _ACC	=	0x00e0
                           0000F0   152 _B	=	0x00f0
                                    153 ;--------------------------------------------------------
                                    154 ; special function bits
                                    155 ;--------------------------------------------------------
                                    156 	.area RSEG    (ABS,DATA)
      000000                        157 	.org 0x0000
                           000080   158 _P0_0	=	0x0080
                           000081   159 _P0_1	=	0x0081
                           000082   160 _P0_2	=	0x0082
                           000083   161 _P0_3	=	0x0083
                           000084   162 _P0_4	=	0x0084
                           000085   163 _P0_5	=	0x0085
                           000086   164 _P0_6	=	0x0086
                           000087   165 _P0_7	=	0x0087
                           000088   166 _IT0	=	0x0088
                           000089   167 _IE0	=	0x0089
                           00008A   168 _IT1	=	0x008a
                           00008B   169 _IE1	=	0x008b
                           00008C   170 _TR0	=	0x008c
                           00008D   171 _TF0	=	0x008d
                           00008E   172 _TR1	=	0x008e
                           00008F   173 _TF1	=	0x008f
                           000090   174 _P1_0	=	0x0090
                           000091   175 _P1_1	=	0x0091
                           000092   176 _P1_2	=	0x0092
                           000093   177 _P1_3	=	0x0093
                           000094   178 _P1_4	=	0x0094
                           000095   179 _P1_5	=	0x0095
                           000096   180 _P1_6	=	0x0096
                           000097   181 _P1_7	=	0x0097
                           000098   182 _RI	=	0x0098
                           000099   183 _TI	=	0x0099
                           00009A   184 _RB8	=	0x009a
                           00009B   185 _TB8	=	0x009b
                           00009C   186 _REN	=	0x009c
                           00009D   187 _SM2	=	0x009d
                           00009E   188 _SM1	=	0x009e
                           00009F   189 _SM0	=	0x009f
                           0000A0   190 _P2_0	=	0x00a0
                           0000A1   191 _P2_1	=	0x00a1
                           0000A2   192 _P2_2	=	0x00a2
                           0000A3   193 _P2_3	=	0x00a3
                           0000A4   194 _P2_4	=	0x00a4
                           0000A5   195 _P2_5	=	0x00a5
                           0000A6   196 _P2_6	=	0x00a6
                           0000A7   197 _P2_7	=	0x00a7
                           0000A8   198 _EX0	=	0x00a8
                           0000A9   199 _ET0	=	0x00a9
                           0000AA   200 _EX1	=	0x00aa
                           0000AB   201 _ET1	=	0x00ab
                           0000AC   202 _ES	=	0x00ac
                           0000AF   203 _EA	=	0x00af
                           0000B0   204 _P3_0	=	0x00b0
                           0000B1   205 _P3_1	=	0x00b1
                           0000B2   206 _P3_2	=	0x00b2
                           0000B3   207 _P3_3	=	0x00b3
                           0000B4   208 _P3_4	=	0x00b4
                           0000B5   209 _P3_5	=	0x00b5
                           0000B6   210 _P3_6	=	0x00b6
                           0000B7   211 _P3_7	=	0x00b7
                           0000B0   212 _RXD	=	0x00b0
                           0000B1   213 _TXD	=	0x00b1
                           0000B2   214 _INT0	=	0x00b2
                           0000B3   215 _INT1	=	0x00b3
                           0000B4   216 _T0	=	0x00b4
                           0000B5   217 _T1	=	0x00b5
                           0000B6   218 _WR	=	0x00b6
                           0000B7   219 _RD	=	0x00b7
                           0000B8   220 _PX0	=	0x00b8
                           0000B9   221 _PT0	=	0x00b9
                           0000BA   222 _PX1	=	0x00ba
                           0000BB   223 _PT1	=	0x00bb
                           0000BC   224 _PS	=	0x00bc
                           0000D0   225 _P	=	0x00d0
                           0000D1   226 _F1	=	0x00d1
                           0000D2   227 _OV	=	0x00d2
                           0000D3   228 _RS0	=	0x00d3
                           0000D4   229 _RS1	=	0x00d4
                           0000D5   230 _F0	=	0x00d5
                           0000D6   231 _AC	=	0x00d6
                           0000D7   232 _CY	=	0x00d7
                                    233 ;--------------------------------------------------------
                                    234 ; overlayable register banks
                                    235 ;--------------------------------------------------------
                                    236 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        237 	.ds 8
                                    238 ;--------------------------------------------------------
                                    239 ; internal ram data
                                    240 ;--------------------------------------------------------
                                    241 	.area DSEG    (DATA)
                           000035   242 _TheChar	=	0x0035
                           000036   243 _TheInt	=	0x0036
                           000025   244 _mutex	=	0x0025
                           000026   245 _full	=	0x0026
                           000027   246 _empty	=	0x0027
                           00003A   247 _head	=	0x003a
                           00003B   248 _tail	=	0x003b
                           00003D   249 _SharedBuffer	=	0x003d
                                    250 ;--------------------------------------------------------
                                    251 ; overlayable items in internal ram
                                    252 ;--------------------------------------------------------
                                    253 	.area	OSEG    (OVR,DATA)
      000008                        254 _SemaphoreCreate_PARM_2:
      000008                        255 	.ds 1
                                    256 ;--------------------------------------------------------
                                    257 ; Stack segment in internal ram
                                    258 ;--------------------------------------------------------
                                    259 	.area SSEG
      000009                        260 __start__stack:
      000009                        261 	.ds	1
                                    262 
                                    263 ;--------------------------------------------------------
                                    264 ; indirectly addressable internal ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area ISEG    (DATA)
                                    267 ;--------------------------------------------------------
                                    268 ; absolute internal ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area IABS    (ABS,DATA)
                                    271 	.area IABS    (ABS,DATA)
                                    272 ;--------------------------------------------------------
                                    273 ; bit data
                                    274 ;--------------------------------------------------------
                                    275 	.area BSEG    (BIT)
                                    276 ;--------------------------------------------------------
                                    277 ; paged external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area PSEG    (PAG,XDATA)
                                    280 ;--------------------------------------------------------
                                    281 ; uninitialized external ram data
                                    282 ;--------------------------------------------------------
                                    283 	.area XSEG    (XDATA)
                                    284 ;--------------------------------------------------------
                                    285 ; absolute external ram data
                                    286 ;--------------------------------------------------------
                                    287 	.area XABS    (ABS,XDATA)
                                    288 ;--------------------------------------------------------
                                    289 ; initialized external ram data
                                    290 ;--------------------------------------------------------
                                    291 	.area XISEG   (XDATA)
                                    292 	.area HOME    (CODE)
                                    293 	.area GSINIT0 (CODE)
                                    294 	.area GSINIT1 (CODE)
                                    295 	.area GSINIT2 (CODE)
                                    296 	.area GSINIT3 (CODE)
                                    297 	.area GSINIT4 (CODE)
                                    298 	.area GSINIT5 (CODE)
                                    299 	.area GSINIT  (CODE)
                                    300 	.area GSFINAL (CODE)
                                    301 	.area CSEG    (CODE)
                                    302 ;--------------------------------------------------------
                                    303 ; interrupt vector
                                    304 ;--------------------------------------------------------
                                    305 	.area HOME    (CODE)
      000000                        306 __interrupt_vect:
      000000 02 01 43         [24]  307 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  308 	reti
      000004                        309 	.ds	7
      00000B 02 01 4A         [24]  310 	ljmp	_timer0_ISR
                                    311 ;--------------------------------------------------------
                                    312 ; global & static initialisations
                                    313 ;--------------------------------------------------------
                                    314 	.area HOME    (CODE)
                                    315 	.area GSINIT  (CODE)
                                    316 	.area GSFINAL (CODE)
                                    317 	.area GSINIT  (CODE)
                                    318 	.globl __sdcc_gsinit_startup
                                    319 	.globl __sdcc_program_startup
                                    320 	.globl __start__stack
                                    321 	.globl __mcs51_genXINIT
                                    322 	.globl __mcs51_genXRAMCLEAR
                                    323 	.globl __mcs51_genRAMCLEAR
                                    324 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  325 	ljmp	__sdcc_program_startup
                                    326 ;--------------------------------------------------------
                                    327 ; Home
                                    328 ;--------------------------------------------------------
                                    329 	.area HOME    (CODE)
                                    330 	.area HOME    (CODE)
      00000E                        331 __sdcc_program_startup:
      00000E 02 01 01         [24]  332 	ljmp	_main
                                    333 ;	return from main will return to caller
                                    334 ;--------------------------------------------------------
                                    335 ; code
                                    336 ;--------------------------------------------------------
                                    337 	.area CSEG    (CODE)
                                    338 ;------------------------------------------------------------
                                    339 ;Allocation info for local variables in function 'SemaphoreCreate'
                                    340 ;------------------------------------------------------------
                                    341 ;n                         Allocated with name '_SemaphoreCreate_PARM_2'
                                    342 ;s                         Allocated to registers r5 r6 r7 
                                    343 ;------------------------------------------------------------
                                    344 ;	test3threads.c:37: void SemaphoreCreate(char *s, char n){ 
                                    345 ;	-----------------------------------------
                                    346 ;	 function SemaphoreCreate
                                    347 ;	-----------------------------------------
      000014                        348 _SemaphoreCreate:
                           000007   349 	ar7 = 0x07
                           000006   350 	ar6 = 0x06
                           000005   351 	ar5 = 0x05
                           000004   352 	ar4 = 0x04
                           000003   353 	ar3 = 0x03
                           000002   354 	ar2 = 0x02
                           000001   355 	ar1 = 0x01
                           000000   356 	ar0 = 0x00
      000014 AD 82            [24]  357 	mov	r5, dpl
      000016 AE 83            [24]  358 	mov	r6, dph
      000018 AF F0            [24]  359 	mov	r7, b
                                    360 ;	test3threads.c:38: EA = 0;
                                    361 ;	assignBit
      00001A C2 AF            [12]  362 	clr	_EA
                                    363 ;	test3threads.c:39: *s = n; 
      00001C 8D 82            [24]  364 	mov	dpl,r5
      00001E 8E 83            [24]  365 	mov	dph,r6
      000020 8F F0            [24]  366 	mov	b,r7
      000022 E5 08            [12]  367 	mov	a,_SemaphoreCreate_PARM_2
      000024 12 05 03         [24]  368 	lcall	__gptrput
                                    369 ;	test3threads.c:40: EA = 1;
                                    370 ;	assignBit
      000027 D2 AF            [12]  371 	setb	_EA
                                    372 ;	test3threads.c:41: }
      000029 22               [24]  373 	ret
                                    374 ;------------------------------------------------------------
                                    375 ;Allocation info for local variables in function 'Producer1'
                                    376 ;------------------------------------------------------------
                                    377 ;	test3threads.c:48: void Producer1(void)
                                    378 ;	-----------------------------------------
                                    379 ;	 function Producer1
                                    380 ;	-----------------------------------------
      00002A                        381 _Producer1:
                                    382 ;	test3threads.c:55: EA = 0;
                                    383 ;	assignBit
      00002A C2 AF            [12]  384 	clr	_EA
                                    385 ;	test3threads.c:56: TheChar = 'A'-1;
      00002C 75 35 40         [24]  386 	mov	_TheChar,#0x40
                                    387 ;	test3threads.c:57: EA = 1;
                                    388 ;	assignBit
      00002F D2 AF            [12]  389 	setb	_EA
                                    390 ;	test3threads.c:59: while (1)
      000031                        391 00107$:
                                    392 ;	test3threads.c:64: SemaphoreWait(empty);
      000031                        393 0$:
      000031 85 27 E0         [24]  394 	MOV ACC, _empty 
      000034 60 FB            [24]  395 	JZ 0$ 
      000036 20 E7 F8         [24]  396 	JB ACC.7, 0$ 
      000039 15 27            [12]  397 	dec _empty 
                                    398 ;	test3threads.c:65: SemaphoreWait(mutex);
      00003B                        399 1$:
      00003B 85 25 E0         [24]  400 	MOV ACC, _mutex 
      00003E 60 FB            [24]  401 	JZ 1$ 
      000040 20 E7 F8         [24]  402 	JB ACC.7, 1$ 
      000043 15 25            [12]  403 	dec _mutex 
                                    404 ;	test3threads.c:66: EA = 0;
                                    405 ;	assignBit
      000045 C2 AF            [12]  406 	clr	_EA
                                    407 ;	test3threads.c:68: if(TheChar == 'Z'){
      000047 74 5A            [12]  408 	mov	a,#0x5a
      000049 B5 35 05         [24]  409 	cjne	a,_TheChar,00102$
                                    410 ;	test3threads.c:69: TheChar = 'A';
      00004C 75 35 41         [24]  411 	mov	_TheChar,#0x41
      00004F 80 05            [24]  412 	sjmp	00103$
      000051                        413 00102$:
                                    414 ;	test3threads.c:72: TheChar += 1;
      000051 E5 35            [12]  415 	mov	a,_TheChar
      000053 04               [12]  416 	inc	a
      000054 F5 35            [12]  417 	mov	_TheChar,a
      000056                        418 00103$:
                                    419 ;	test3threads.c:74: SharedBuffer[tail] = TheChar;
      000056 E5 3B            [12]  420 	mov	a,_tail
      000058 24 3D            [12]  421 	add	a, #_SharedBuffer
      00005A F8               [12]  422 	mov	r0,a
      00005B A6 35            [24]  423 	mov	@r0,_TheChar
                                    424 ;	test3threads.c:75: tail += 1;
      00005D E5 3B            [12]  425 	mov	a,_tail
      00005F FF               [12]  426 	mov	r7,a
      000060 04               [12]  427 	inc	a
      000061 F5 3B            [12]  428 	mov	_tail,a
                                    429 ;	test3threads.c:76: if(tail == 3){
      000063 74 03            [12]  430 	mov	a,#0x03
      000065 B5 3B 03         [24]  431 	cjne	a,_tail,00105$
                                    432 ;	test3threads.c:77: tail = 0;
      000068 75 3B 00         [24]  433 	mov	_tail,#0x00
      00006B                        434 00105$:
                                    435 ;	test3threads.c:80: EA = 1;
                                    436 ;	assignBit
      00006B D2 AF            [12]  437 	setb	_EA
                                    438 ;	test3threads.c:81: SemaphoreSignal(mutex);
      00006D 05 25            [12]  439 	INC _mutex 
                                    440 ;	test3threads.c:82: SemaphoreSignal(full);
      00006F 05 26            [12]  441 	INC _full 
                                    442 ;	test3threads.c:84: }
      000071 80 BE            [24]  443 	sjmp	00107$
                                    444 ;------------------------------------------------------------
                                    445 ;Allocation info for local variables in function 'Producer2'
                                    446 ;------------------------------------------------------------
                                    447 ;	test3threads.c:86: void Producer2(void){
                                    448 ;	-----------------------------------------
                                    449 ;	 function Producer2
                                    450 ;	-----------------------------------------
      000073                        451 _Producer2:
                                    452 ;	test3threads.c:87: EA = 0;
                                    453 ;	assignBit
      000073 C2 AF            [12]  454 	clr	_EA
                                    455 ;	test3threads.c:88: TheInt = '0'-1;
      000075 75 36 2F         [24]  456 	mov	_TheInt,#0x2f
                                    457 ;	test3threads.c:89: EA = 1;
                                    458 ;	assignBit
      000078 D2 AF            [12]  459 	setb	_EA
                                    460 ;	test3threads.c:91: while (1)
      00007A                        461 00107$:
                                    462 ;	test3threads.c:93: SemaphoreWait(empty);
      00007A                        463 2$:
      00007A 85 27 E0         [24]  464 	MOV ACC, _empty 
      00007D 60 FB            [24]  465 	JZ 2$ 
      00007F 20 E7 F8         [24]  466 	JB ACC.7, 2$ 
      000082 15 27            [12]  467 	dec _empty 
                                    468 ;	test3threads.c:94: SemaphoreWait(mutex);
      000084                        469 3$:
      000084 85 25 E0         [24]  470 	MOV ACC, _mutex 
      000087 60 FB            [24]  471 	JZ 3$ 
      000089 20 E7 F8         [24]  472 	JB ACC.7, 3$ 
      00008C 15 25            [12]  473 	dec _mutex 
                                    474 ;	test3threads.c:95: EA = 0;
                                    475 ;	assignBit
      00008E C2 AF            [12]  476 	clr	_EA
                                    477 ;	test3threads.c:97: if(TheInt == '9'){
      000090 74 39            [12]  478 	mov	a,#0x39
      000092 B5 36 05         [24]  479 	cjne	a,_TheInt,00102$
                                    480 ;	test3threads.c:98: TheInt = '0';
      000095 75 36 30         [24]  481 	mov	_TheInt,#0x30
      000098 80 05            [24]  482 	sjmp	00103$
      00009A                        483 00102$:
                                    484 ;	test3threads.c:101: TheInt += 1;
      00009A E5 36            [12]  485 	mov	a,_TheInt
      00009C 04               [12]  486 	inc	a
      00009D F5 36            [12]  487 	mov	_TheInt,a
      00009F                        488 00103$:
                                    489 ;	test3threads.c:103: SharedBuffer[tail] = TheInt;
      00009F E5 3B            [12]  490 	mov	a,_tail
      0000A1 24 3D            [12]  491 	add	a, #_SharedBuffer
      0000A3 F8               [12]  492 	mov	r0,a
      0000A4 A6 36            [24]  493 	mov	@r0,_TheInt
                                    494 ;	test3threads.c:104: tail += 1;
      0000A6 E5 3B            [12]  495 	mov	a,_tail
      0000A8 FF               [12]  496 	mov	r7,a
      0000A9 04               [12]  497 	inc	a
      0000AA F5 3B            [12]  498 	mov	_tail,a
                                    499 ;	test3threads.c:105: if(tail == 3){
      0000AC 74 03            [12]  500 	mov	a,#0x03
      0000AE B5 3B 03         [24]  501 	cjne	a,_tail,00105$
                                    502 ;	test3threads.c:106: tail = 0;
      0000B1 75 3B 00         [24]  503 	mov	_tail,#0x00
      0000B4                        504 00105$:
                                    505 ;	test3threads.c:109: EA = 1;
                                    506 ;	assignBit
      0000B4 D2 AF            [12]  507 	setb	_EA
                                    508 ;	test3threads.c:110: SemaphoreSignal(mutex);
      0000B6 05 25            [12]  509 	INC _mutex 
                                    510 ;	test3threads.c:111: SemaphoreSignal(full);
      0000B8 05 26            [12]  511 	INC _full 
                                    512 ;	test3threads.c:113: }
      0000BA 80 BE            [24]  513 	sjmp	00107$
                                    514 ;------------------------------------------------------------
                                    515 ;Allocation info for local variables in function 'Consumer'
                                    516 ;------------------------------------------------------------
                                    517 ;	test3threads.c:120: void Consumer(void)
                                    518 ;	-----------------------------------------
                                    519 ;	 function Consumer
                                    520 ;	-----------------------------------------
      0000BC                        521 _Consumer:
                                    522 ;	test3threads.c:126: TMOD |= 0x20;
      0000BC 43 89 20         [24]  523 	orl	_TMOD,#0x20
                                    524 ;	test3threads.c:127: TH1 = (char)-6;
      0000BF 75 8D FA         [24]  525 	mov	_TH1,#0xfa
                                    526 ;	test3threads.c:128: SCON = 0x50;
      0000C2 75 98 50         [24]  527 	mov	_SCON,#0x50
                                    528 ;	test3threads.c:129: TR1 = 1;
                                    529 ;	assignBit
      0000C5 D2 8E            [12]  530 	setb	_TR1
                                    531 ;	test3threads.c:130: TI = 1;
                                    532 ;	assignBit
      0000C7 D2 99            [12]  533 	setb	_TI
                                    534 ;	test3threads.c:132: while (1)
      0000C9                        535 00107$:
                                    536 ;	test3threads.c:142: SemaphoreWait(full);
      0000C9                        537 4$:
      0000C9 85 26 E0         [24]  538 	MOV ACC, _full 
      0000CC 60 FB            [24]  539 	JZ 4$ 
      0000CE 20 E7 F8         [24]  540 	JB ACC.7, 4$ 
      0000D1 15 26            [12]  541 	dec _full 
                                    542 ;	test3threads.c:143: SemaphoreWait(mutex);
      0000D3                        543 5$:
      0000D3 85 25 E0         [24]  544 	MOV ACC, _mutex 
      0000D6 60 FB            [24]  545 	JZ 5$ 
      0000D8 20 E7 F8         [24]  546 	JB ACC.7, 5$ 
      0000DB 15 25            [12]  547 	dec _mutex 
                                    548 ;	test3threads.c:144: EA = 0;
                                    549 ;	assignBit
      0000DD C2 AF            [12]  550 	clr	_EA
                                    551 ;	test3threads.c:146: while (!TI){
      0000DF                        552 00101$:
      0000DF 30 99 FD         [24]  553 	jnb	_TI,00101$
                                    554 ;	test3threads.c:148: SBUF = SharedBuffer[head];
      0000E2 E5 3A            [12]  555 	mov	a,_head
      0000E4 24 3D            [12]  556 	add	a, #_SharedBuffer
      0000E6 F9               [12]  557 	mov	r1,a
      0000E7 87 99            [24]  558 	mov	_SBUF,@r1
                                    559 ;	test3threads.c:149: TI = 0;
                                    560 ;	assignBit
      0000E9 C2 99            [12]  561 	clr	_TI
                                    562 ;	test3threads.c:150: head += 1;
      0000EB E5 3A            [12]  563 	mov	a,_head
      0000ED FF               [12]  564 	mov	r7,a
      0000EE 04               [12]  565 	inc	a
      0000EF F5 3A            [12]  566 	mov	_head,a
                                    567 ;	test3threads.c:151: if(head == 3){
      0000F1 74 03            [12]  568 	mov	a,#0x03
      0000F3 B5 3A 03         [24]  569 	cjne	a,_head,00105$
                                    570 ;	test3threads.c:152: head = 0;
      0000F6 75 3A 00         [24]  571 	mov	_head,#0x00
      0000F9                        572 00105$:
                                    573 ;	test3threads.c:155: EA = 1;
                                    574 ;	assignBit
      0000F9 D2 AF            [12]  575 	setb	_EA
                                    576 ;	test3threads.c:156: SemaphoreSignal(mutex);
      0000FB 05 25            [12]  577 	INC _mutex 
                                    578 ;	test3threads.c:157: SemaphoreSignal(empty);
      0000FD 05 27            [12]  579 	INC _empty 
                                    580 ;	test3threads.c:159: }
      0000FF 80 C8            [24]  581 	sjmp	00107$
                                    582 ;------------------------------------------------------------
                                    583 ;Allocation info for local variables in function 'main'
                                    584 ;------------------------------------------------------------
                                    585 ;	test3threads.c:166: void main(void)
                                    586 ;	-----------------------------------------
                                    587 ;	 function main
                                    588 ;	-----------------------------------------
      000101                        589 _main:
                                    590 ;	test3threads.c:173: SemaphoreCreate(&mutex, 1);
      000101 75 08 01         [24]  591 	mov	_SemaphoreCreate_PARM_2,#0x01
      000104 90 00 25         [24]  592 	mov	dptr,#_mutex
      000107 75 F0 40         [24]  593 	mov	b, #0x40
      00010A 12 00 14         [24]  594 	lcall	_SemaphoreCreate
                                    595 ;	test3threads.c:174: SemaphoreCreate(&full, 0);
      00010D 75 08 00         [24]  596 	mov	_SemaphoreCreate_PARM_2,#0x00
      000110 90 00 26         [24]  597 	mov	dptr,#_full
      000113 75 F0 40         [24]  598 	mov	b, #0x40
      000116 12 00 14         [24]  599 	lcall	_SemaphoreCreate
                                    600 ;	test3threads.c:175: SemaphoreCreate(&empty, 3);
      000119 75 08 03         [24]  601 	mov	_SemaphoreCreate_PARM_2,#0x03
      00011C 90 00 27         [24]  602 	mov	dptr,#_empty
      00011F 75 F0 40         [24]  603 	mov	b, #0x40
      000122 12 00 14         [24]  604 	lcall	_SemaphoreCreate
                                    605 ;	test3threads.c:177: head = 0;
      000125 75 3A 00         [24]  606 	mov	_head,#0x00
                                    607 ;	test3threads.c:178: tail = 0;
      000128 75 3B 00         [24]  608 	mov	_tail,#0x00
                                    609 ;	test3threads.c:180: SharedBuffer[0] = ' ';
      00012B 75 3D 20         [24]  610 	mov	_SharedBuffer,#0x20
                                    611 ;	test3threads.c:181: SharedBuffer[1] = ' ';
      00012E 75 3E 20         [24]  612 	mov	(_SharedBuffer + 0x0001),#0x20
                                    613 ;	test3threads.c:182: SharedBuffer[2] = ' ';
      000131 75 3F 20         [24]  614 	mov	(_SharedBuffer + 0x0002),#0x20
                                    615 ;	test3threads.c:190: ThreadCreate(Producer1);
      000134 90 00 2A         [24]  616 	mov	dptr,#_Producer1
      000137 12 01 A5         [24]  617 	lcall	_ThreadCreate
                                    618 ;	test3threads.c:191: ThreadCreate(Producer2);
      00013A 90 00 73         [24]  619 	mov	dptr,#_Producer2
      00013D 12 01 A5         [24]  620 	lcall	_ThreadCreate
                                    621 ;	test3threads.c:192: Consumer();
                                    622 ;	test3threads.c:193: }
      000140 02 00 BC         [24]  623 	ljmp	_Consumer
                                    624 ;------------------------------------------------------------
                                    625 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    626 ;------------------------------------------------------------
                                    627 ;	test3threads.c:195: void _sdcc_gsinit_startup(void)
                                    628 ;	-----------------------------------------
                                    629 ;	 function _sdcc_gsinit_startup
                                    630 ;	-----------------------------------------
      000143                        631 __sdcc_gsinit_startup:
                                    632 ;	test3threads.c:199: __endasm;
      000143 02 01 4E         [24]  633 	ljmp	_Bootstrap
                                    634 ;	test3threads.c:200: }
      000146 22               [24]  635 	ret
                                    636 ;------------------------------------------------------------
                                    637 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    638 ;------------------------------------------------------------
                                    639 ;	test3threads.c:202: void _mcs51_genRAMCLEAR(void) {}
                                    640 ;	-----------------------------------------
                                    641 ;	 function _mcs51_genRAMCLEAR
                                    642 ;	-----------------------------------------
      000147                        643 __mcs51_genRAMCLEAR:
      000147 22               [24]  644 	ret
                                    645 ;------------------------------------------------------------
                                    646 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    647 ;------------------------------------------------------------
                                    648 ;	test3threads.c:203: void _mcs51_genXINIT(void) {}
                                    649 ;	-----------------------------------------
                                    650 ;	 function _mcs51_genXINIT
                                    651 ;	-----------------------------------------
      000148                        652 __mcs51_genXINIT:
      000148 22               [24]  653 	ret
                                    654 ;------------------------------------------------------------
                                    655 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    656 ;------------------------------------------------------------
                                    657 ;	test3threads.c:204: void _mcs51_genXRAMCLEAR(void) {}
                                    658 ;	-----------------------------------------
                                    659 ;	 function _mcs51_genXRAMCLEAR
                                    660 ;	-----------------------------------------
      000149                        661 __mcs51_genXRAMCLEAR:
      000149 22               [24]  662 	ret
                                    663 ;------------------------------------------------------------
                                    664 ;Allocation info for local variables in function 'timer0_ISR'
                                    665 ;------------------------------------------------------------
                                    666 ;	test3threads.c:205: void timer0_ISR(void) __interrupt(1) {
                                    667 ;	-----------------------------------------
                                    668 ;	 function timer0_ISR
                                    669 ;	-----------------------------------------
      00014A                        670 _timer0_ISR:
                                    671 ;	test3threads.c:208: __endasm;
      00014A 02 04 20         [24]  672 	ljmp	_myTimer0Handler
                                    673 ;	test3threads.c:209: }
      00014D 32               [24]  674 	reti
                                    675 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    676 ;	eliminated unneeded push/pop not_psw
                                    677 ;	eliminated unneeded push/pop dpl
                                    678 ;	eliminated unneeded push/pop dph
                                    679 ;	eliminated unneeded push/pop b
                                    680 ;	eliminated unneeded push/pop acc
                                    681 	.area CSEG    (CODE)
                                    682 	.area CONST   (CODE)
                                    683 	.area XINIT   (CODE)
                                    684 	.area CABS    (ABS,CODE)
