                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _Buffer_Availability
                                    117 	.globl _SharedBuffer
                                    118 ;--------------------------------------------------------
                                    119 ; special function registers
                                    120 ;--------------------------------------------------------
                                    121 	.area RSEG    (ABS,DATA)
      000000                        122 	.org 0x0000
                           000080   123 _P0	=	0x0080
                           000081   124 _SP	=	0x0081
                           000082   125 _DPL	=	0x0082
                           000083   126 _DPH	=	0x0083
                           000087   127 _PCON	=	0x0087
                           000088   128 _TCON	=	0x0088
                           000089   129 _TMOD	=	0x0089
                           00008A   130 _TL0	=	0x008a
                           00008B   131 _TL1	=	0x008b
                           00008C   132 _TH0	=	0x008c
                           00008D   133 _TH1	=	0x008d
                           000090   134 _P1	=	0x0090
                           000098   135 _SCON	=	0x0098
                           000099   136 _SBUF	=	0x0099
                           0000A0   137 _P2	=	0x00a0
                           0000A8   138 _IE	=	0x00a8
                           0000B0   139 _P3	=	0x00b0
                           0000B8   140 _IP	=	0x00b8
                           0000D0   141 _PSW	=	0x00d0
                           0000E0   142 _ACC	=	0x00e0
                           0000F0   143 _B	=	0x00f0
                                    144 ;--------------------------------------------------------
                                    145 ; special function bits
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0_0	=	0x0080
                           000081   150 _P0_1	=	0x0081
                           000082   151 _P0_2	=	0x0082
                           000083   152 _P0_3	=	0x0083
                           000084   153 _P0_4	=	0x0084
                           000085   154 _P0_5	=	0x0085
                           000086   155 _P0_6	=	0x0086
                           000087   156 _P0_7	=	0x0087
                           000088   157 _IT0	=	0x0088
                           000089   158 _IE0	=	0x0089
                           00008A   159 _IT1	=	0x008a
                           00008B   160 _IE1	=	0x008b
                           00008C   161 _TR0	=	0x008c
                           00008D   162 _TF0	=	0x008d
                           00008E   163 _TR1	=	0x008e
                           00008F   164 _TF1	=	0x008f
                           000090   165 _P1_0	=	0x0090
                           000091   166 _P1_1	=	0x0091
                           000092   167 _P1_2	=	0x0092
                           000093   168 _P1_3	=	0x0093
                           000094   169 _P1_4	=	0x0094
                           000095   170 _P1_5	=	0x0095
                           000096   171 _P1_6	=	0x0096
                           000097   172 _P1_7	=	0x0097
                           000098   173 _RI	=	0x0098
                           000099   174 _TI	=	0x0099
                           00009A   175 _RB8	=	0x009a
                           00009B   176 _TB8	=	0x009b
                           00009C   177 _REN	=	0x009c
                           00009D   178 _SM2	=	0x009d
                           00009E   179 _SM1	=	0x009e
                           00009F   180 _SM0	=	0x009f
                           0000A0   181 _P2_0	=	0x00a0
                           0000A1   182 _P2_1	=	0x00a1
                           0000A2   183 _P2_2	=	0x00a2
                           0000A3   184 _P2_3	=	0x00a3
                           0000A4   185 _P2_4	=	0x00a4
                           0000A5   186 _P2_5	=	0x00a5
                           0000A6   187 _P2_6	=	0x00a6
                           0000A7   188 _P2_7	=	0x00a7
                           0000A8   189 _EX0	=	0x00a8
                           0000A9   190 _ET0	=	0x00a9
                           0000AA   191 _EX1	=	0x00aa
                           0000AB   192 _ET1	=	0x00ab
                           0000AC   193 _ES	=	0x00ac
                           0000AF   194 _EA	=	0x00af
                           0000B0   195 _P3_0	=	0x00b0
                           0000B1   196 _P3_1	=	0x00b1
                           0000B2   197 _P3_2	=	0x00b2
                           0000B3   198 _P3_3	=	0x00b3
                           0000B4   199 _P3_4	=	0x00b4
                           0000B5   200 _P3_5	=	0x00b5
                           0000B6   201 _P3_6	=	0x00b6
                           0000B7   202 _P3_7	=	0x00b7
                           0000B0   203 _RXD	=	0x00b0
                           0000B1   204 _TXD	=	0x00b1
                           0000B2   205 _INT0	=	0x00b2
                           0000B3   206 _INT1	=	0x00b3
                           0000B4   207 _T0	=	0x00b4
                           0000B5   208 _T1	=	0x00b5
                           0000B6   209 _WR	=	0x00b6
                           0000B7   210 _RD	=	0x00b7
                           0000B8   211 _PX0	=	0x00b8
                           0000B9   212 _PT0	=	0x00b9
                           0000BA   213 _PX1	=	0x00ba
                           0000BB   214 _PT1	=	0x00bb
                           0000BC   215 _PS	=	0x00bc
                           0000D0   216 _P	=	0x00d0
                           0000D1   217 _F1	=	0x00d1
                           0000D2   218 _OV	=	0x00d2
                           0000D3   219 _RS0	=	0x00d3
                           0000D4   220 _RS1	=	0x00d4
                           0000D5   221 _F0	=	0x00d5
                           0000D6   222 _AC	=	0x00d6
                           0000D7   223 _CY	=	0x00d7
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable register banks
                                    226 ;--------------------------------------------------------
                                    227 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        228 	.ds 8
                                    229 ;--------------------------------------------------------
                                    230 ; internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area DSEG    (DATA)
                           000036   233 _SharedBuffer	=	0x0036
                           000037   234 _Buffer_Availability	=	0x0037
                                    235 ;--------------------------------------------------------
                                    236 ; overlayable items in internal ram
                                    237 ;--------------------------------------------------------
                                    238 ;--------------------------------------------------------
                                    239 ; Stack segment in internal ram
                                    240 ;--------------------------------------------------------
                                    241 	.area SSEG
      000021                        242 __start__stack:
      000021                        243 	.ds	1
                                    244 
                                    245 ;--------------------------------------------------------
                                    246 ; indirectly addressable internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area ISEG    (DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; absolute internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area IABS    (ABS,DATA)
                                    253 	.area IABS    (ABS,DATA)
                                    254 ;--------------------------------------------------------
                                    255 ; bit data
                                    256 ;--------------------------------------------------------
                                    257 	.area BSEG    (BIT)
      000000                        258 _Producer_sloc0_1_0:
      000000                        259 	.ds 1
      000001                        260 _Consumer_sloc0_1_0:
      000001                        261 	.ds 1
                                    262 ;--------------------------------------------------------
                                    263 ; paged external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area PSEG    (PAG,XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; uninitialized external ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XSEG    (XDATA)
                                    270 ;--------------------------------------------------------
                                    271 ; absolute external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area XABS    (ABS,XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; initialized external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XISEG   (XDATA)
                                    278 	.area HOME    (CODE)
                                    279 	.area GSINIT0 (CODE)
                                    280 	.area GSINIT1 (CODE)
                                    281 	.area GSINIT2 (CODE)
                                    282 	.area GSINIT3 (CODE)
                                    283 	.area GSINIT4 (CODE)
                                    284 	.area GSINIT5 (CODE)
                                    285 	.area GSINIT  (CODE)
                                    286 	.area GSFINAL (CODE)
                                    287 	.area CSEG    (CODE)
                                    288 ;--------------------------------------------------------
                                    289 ; interrupt vector
                                    290 ;--------------------------------------------------------
                                    291 	.area HOME    (CODE)
      000000                        292 __interrupt_vect:
      000000 02 00 A7         [24]  293 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  294 	reti
      000004                        295 	.ds	7
      00000B 02 00 AE         [24]  296 	ljmp	_timer0_ISR
                                    297 ;--------------------------------------------------------
                                    298 ; global & static initialisations
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
                                    301 	.area GSINIT  (CODE)
                                    302 	.area GSFINAL (CODE)
                                    303 	.area GSINIT  (CODE)
                                    304 	.globl __sdcc_gsinit_startup
                                    305 	.globl __sdcc_program_startup
                                    306 	.globl __start__stack
                                    307 	.globl __mcs51_genXINIT
                                    308 	.globl __mcs51_genXRAMCLEAR
                                    309 	.globl __mcs51_genRAMCLEAR
                                    310 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  311 	ljmp	__sdcc_program_startup
                                    312 ;--------------------------------------------------------
                                    313 ; Home
                                    314 ;--------------------------------------------------------
                                    315 	.area HOME    (CODE)
                                    316 	.area HOME    (CODE)
      00000E                        317 __sdcc_program_startup:
      00000E 02 00 96         [24]  318 	ljmp	_main
                                    319 ;	return from main will return to caller
                                    320 ;--------------------------------------------------------
                                    321 ; code
                                    322 ;--------------------------------------------------------
                                    323 	.area CSEG    (CODE)
                                    324 ;------------------------------------------------------------
                                    325 ;Allocation info for local variables in function 'Producer'
                                    326 ;------------------------------------------------------------
                                    327 ;	testpreempt.c:22: void Producer(void)
                                    328 ;	-----------------------------------------
                                    329 ;	 function Producer
                                    330 ;	-----------------------------------------
      000014                        331 _Producer:
                           000007   332 	ar7 = 0x07
                           000006   333 	ar6 = 0x06
                           000005   334 	ar5 = 0x05
                           000004   335 	ar4 = 0x04
                           000003   336 	ar3 = 0x03
                           000002   337 	ar2 = 0x02
                           000001   338 	ar1 = 0x01
                           000000   339 	ar0 = 0x00
                                    340 ;	testpreempt.c:31: }
      000014 D2 00            [12]  341 	setb	_Producer_sloc0_1_0
      000016 10 AF 02         [24]  342 	jbc	ea,00130$
      000019 C2 00            [12]  343 	clr	_Producer_sloc0_1_0
      00001B                        344 00130$:
                                    345 ;	testpreempt.c:30: SharedBuffer = 'A'-1;
      00001B 75 36 40         [24]  346 	mov	_SharedBuffer,#0x40
      00001E A2 00            [12]  347 	mov	c,_Producer_sloc0_1_0
      000020 92 AF            [24]  348 	mov	ea,c
                                    349 ;	testpreempt.c:32: while (1)
      000022                        350 00108$:
                                    351 ;	testpreempt.c:37: if(Buffer_Availability){
      000022 E5 37            [12]  352 	mov	a,_Buffer_Availability
      000024 45 38            [12]  353 	orl	a,(_Buffer_Availability + 1)
      000026 70 FA            [24]  354 	jnz	00108$
                                    355 ;	testpreempt.c:42: }
      000028 D2 00            [12]  356 	setb	_Producer_sloc0_1_0
      00002A 10 AF 02         [24]  357 	jbc	ea,00132$
      00002D C2 00            [12]  358 	clr	_Producer_sloc0_1_0
      00002F                        359 00132$:
                                    360 ;	testpreempt.c:41: Buffer_Availability += 1;
      00002F 74 01            [12]  361 	mov	a,#0x01
      000031 25 37            [12]  362 	add	a, _Buffer_Availability
      000033 F5 37            [12]  363 	mov	_Buffer_Availability,a
      000035 E4               [12]  364 	clr	a
      000036 35 38            [12]  365 	addc	a, (_Buffer_Availability + 1)
      000038 F5 38            [12]  366 	mov	(_Buffer_Availability + 1),a
      00003A A2 00            [12]  367 	mov	c,_Producer_sloc0_1_0
      00003C 92 AF            [24]  368 	mov	ea,c
                                    369 ;	testpreempt.c:43: if(SharedBuffer == 'Z'){
      00003E 74 5A            [12]  370 	mov	a,#0x5a
      000040 B5 36 10         [24]  371 	cjne	a,_SharedBuffer,00102$
                                    372 ;	testpreempt.c:46: }
      000043 D2 00            [12]  373 	setb	_Producer_sloc0_1_0
      000045 10 AF 02         [24]  374 	jbc	ea,00135$
      000048 C2 00            [12]  375 	clr	_Producer_sloc0_1_0
      00004A                        376 00135$:
                                    377 ;	testpreempt.c:45: SharedBuffer = 'A';
      00004A 75 36 41         [24]  378 	mov	_SharedBuffer,#0x41
      00004D A2 00            [12]  379 	mov	c,_Producer_sloc0_1_0
      00004F 92 AF            [24]  380 	mov	ea,c
      000051 80 CF            [24]  381 	sjmp	00108$
      000053                        382 00102$:
                                    383 ;	testpreempt.c:51: }
      000053 D2 00            [12]  384 	setb	_Producer_sloc0_1_0
      000055 10 AF 02         [24]  385 	jbc	ea,00136$
      000058 C2 00            [12]  386 	clr	_Producer_sloc0_1_0
      00005A                        387 00136$:
                                    388 ;	testpreempt.c:50: SharedBuffer += 1;
      00005A E5 36            [12]  389 	mov	a,_SharedBuffer
      00005C 04               [12]  390 	inc	a
      00005D F5 36            [12]  391 	mov	_SharedBuffer,a
      00005F A2 00            [12]  392 	mov	c,_Producer_sloc0_1_0
      000061 92 AF            [24]  393 	mov	ea,c
                                    394 ;	testpreempt.c:55: }
      000063 80 BD            [24]  395 	sjmp	00108$
                                    396 ;------------------------------------------------------------
                                    397 ;Allocation info for local variables in function 'Consumer'
                                    398 ;------------------------------------------------------------
                                    399 ;	testpreempt.c:62: void Consumer(void)
                                    400 ;	-----------------------------------------
                                    401 ;	 function Consumer
                                    402 ;	-----------------------------------------
      000065                        403 _Consumer:
                                    404 ;	testpreempt.c:68: TMOD |= 0x20;
      000065 43 89 20         [24]  405 	orl	_TMOD,#0x20
                                    406 ;	testpreempt.c:69: TH1 = (char)-6;
      000068 75 8D FA         [24]  407 	mov	_TH1,#0xfa
                                    408 ;	testpreempt.c:70: SCON = 0x50;
      00006B 75 98 50         [24]  409 	mov	_SCON,#0x50
                                    410 ;	testpreempt.c:71: TR1 = 1;
                                    411 ;	assignBit
      00006E D2 8E            [12]  412 	setb	_TR1
                                    413 ;	testpreempt.c:72: TI = 1;
                                    414 ;	assignBit
      000070 D2 99            [12]  415 	setb	_TI
                                    416 ;	testpreempt.c:74: while (1)
      000072                        417 00107$:
                                    418 ;	testpreempt.c:83: if(Buffer_Availability){
      000072 E5 37            [12]  419 	mov	a,_Buffer_Availability
      000074 45 38            [12]  420 	orl	a,(_Buffer_Availability + 1)
      000076 60 FA            [24]  421 	jz	00107$
                                    422 ;	testpreempt.c:84: while (!TI){
      000078                        423 00101$:
      000078 30 99 FD         [24]  424 	jnb	_TI,00101$
                                    425 ;	testpreempt.c:86: SBUF = SharedBuffer;
      00007B 85 36 99         [24]  426 	mov	_SBUF,_SharedBuffer
                                    427 ;	testpreempt.c:87: TI = 0;
                                    428 ;	assignBit
      00007E C2 99            [12]  429 	clr	_TI
                                    430 ;	testpreempt.c:90: }
      000080 D2 01            [12]  431 	setb	_Consumer_sloc0_1_0
      000082 10 AF 02         [24]  432 	jbc	ea,00131$
      000085 C2 01            [12]  433 	clr	_Consumer_sloc0_1_0
      000087                        434 00131$:
                                    435 ;	testpreempt.c:89: Buffer_Availability -= 1;
      000087 15 37            [12]  436 	dec	_Buffer_Availability
      000089 74 FF            [12]  437 	mov	a,#0xff
      00008B B5 37 02         [24]  438 	cjne	a,_Buffer_Availability,00132$
      00008E 15 38            [12]  439 	dec	(_Buffer_Availability + 1)
      000090                        440 00132$:
      000090 A2 01            [12]  441 	mov	c,_Consumer_sloc0_1_0
      000092 92 AF            [24]  442 	mov	ea,c
                                    443 ;	testpreempt.c:93: }
      000094 80 DC            [24]  444 	sjmp	00107$
                                    445 ;------------------------------------------------------------
                                    446 ;Allocation info for local variables in function 'main'
                                    447 ;------------------------------------------------------------
                                    448 ;	testpreempt.c:100: void main(void)
                                    449 ;	-----------------------------------------
                                    450 ;	 function main
                                    451 ;	-----------------------------------------
      000096                        452 _main:
                                    453 ;	testpreempt.c:107: SharedBuffer = ' ';
      000096 75 36 20         [24]  454 	mov	_SharedBuffer,#0x20
                                    455 ;	testpreempt.c:108: Buffer_Availability = 0;
      000099 E4               [12]  456 	clr	a
      00009A F5 37            [12]  457 	mov	_Buffer_Availability,a
      00009C F5 38            [12]  458 	mov	(_Buffer_Availability + 1),a
                                    459 ;	testpreempt.c:116: ThreadCreate(Producer);
      00009E 90 00 14         [24]  460 	mov	dptr,#_Producer
      0000A1 12 01 06         [24]  461 	lcall	_ThreadCreate
                                    462 ;	testpreempt.c:117: Consumer();
                                    463 ;	testpreempt.c:118: }
      0000A4 02 00 65         [24]  464 	ljmp	_Consumer
                                    465 ;------------------------------------------------------------
                                    466 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    467 ;------------------------------------------------------------
                                    468 ;	testpreempt.c:120: void _sdcc_gsinit_startup(void)
                                    469 ;	-----------------------------------------
                                    470 ;	 function _sdcc_gsinit_startup
                                    471 ;	-----------------------------------------
      0000A7                        472 __sdcc_gsinit_startup:
                                    473 ;	testpreempt.c:124: __endasm;
      0000A7 02 00 B2         [24]  474 	LJMP	_Bootstrap
                                    475 ;	testpreempt.c:125: }
      0000AA 22               [24]  476 	ret
                                    477 ;------------------------------------------------------------
                                    478 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    479 ;------------------------------------------------------------
                                    480 ;	testpreempt.c:127: void _mcs51_genRAMCLEAR(void) {}
                                    481 ;	-----------------------------------------
                                    482 ;	 function _mcs51_genRAMCLEAR
                                    483 ;	-----------------------------------------
      0000AB                        484 __mcs51_genRAMCLEAR:
      0000AB 22               [24]  485 	ret
                                    486 ;------------------------------------------------------------
                                    487 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    488 ;------------------------------------------------------------
                                    489 ;	testpreempt.c:128: void _mcs51_genXINIT(void) {}
                                    490 ;	-----------------------------------------
                                    491 ;	 function _mcs51_genXINIT
                                    492 ;	-----------------------------------------
      0000AC                        493 __mcs51_genXINIT:
      0000AC 22               [24]  494 	ret
                                    495 ;------------------------------------------------------------
                                    496 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    497 ;------------------------------------------------------------
                                    498 ;	testpreempt.c:129: void _mcs51_genXRAMCLEAR(void) {}
                                    499 ;	-----------------------------------------
                                    500 ;	 function _mcs51_genXRAMCLEAR
                                    501 ;	-----------------------------------------
      0000AD                        502 __mcs51_genXRAMCLEAR:
      0000AD 22               [24]  503 	ret
                                    504 ;------------------------------------------------------------
                                    505 ;Allocation info for local variables in function 'timer0_ISR'
                                    506 ;------------------------------------------------------------
                                    507 ;	testpreempt.c:130: void timer0_ISR(void) __interrupt(1) {
                                    508 ;	-----------------------------------------
                                    509 ;	 function timer0_ISR
                                    510 ;	-----------------------------------------
      0000AE                        511 _timer0_ISR:
                                    512 ;	testpreempt.c:133: __endasm;
      0000AE 02 03 81         [24]  513 	ljmp	_myTimer0Handler
                                    514 ;	testpreempt.c:134: }
      0000B1 32               [24]  515 	reti
                                    516 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    517 ;	eliminated unneeded push/pop not_psw
                                    518 ;	eliminated unneeded push/pop dpl
                                    519 ;	eliminated unneeded push/pop dph
                                    520 ;	eliminated unneeded push/pop b
                                    521 ;	eliminated unneeded push/pop acc
                                    522 	.area CSEG    (CODE)
                                    523 	.area CONST   (CODE)
                                    524 	.area XINIT   (CODE)
                                    525 	.area CABS    (ABS,CODE)
