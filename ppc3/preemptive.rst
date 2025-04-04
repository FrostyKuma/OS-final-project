                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _newSP
                                    111 	.globl _tempSP
                                    112 	.globl _curThreadID
                                    113 	.globl _ValidBitMap
                                    114 	.globl _newThreadID
                                    115 	.globl _Pointer
                                    116 	.globl _ThreadCreate
                                    117 	.globl _ThreadYield
                                    118 	.globl _ThreadExit
                                    119 ;--------------------------------------------------------
                                    120 ; special function registers
                                    121 ;--------------------------------------------------------
                                    122 	.area RSEG    (ABS,DATA)
      000000                        123 	.org 0x0000
                           000080   124 _P0	=	0x0080
                           000081   125 _SP	=	0x0081
                           000082   126 _DPL	=	0x0082
                           000083   127 _DPH	=	0x0083
                           000087   128 _PCON	=	0x0087
                           000088   129 _TCON	=	0x0088
                           000089   130 _TMOD	=	0x0089
                           00008A   131 _TL0	=	0x008a
                           00008B   132 _TL1	=	0x008b
                           00008C   133 _TH0	=	0x008c
                           00008D   134 _TH1	=	0x008d
                           000090   135 _P1	=	0x0090
                           000098   136 _SCON	=	0x0098
                           000099   137 _SBUF	=	0x0099
                           0000A0   138 _P2	=	0x00a0
                           0000A8   139 _IE	=	0x00a8
                           0000B0   140 _P3	=	0x00b0
                           0000B8   141 _IP	=	0x00b8
                           0000D0   142 _PSW	=	0x00d0
                           0000E0   143 _ACC	=	0x00e0
                           0000F0   144 _B	=	0x00f0
                                    145 ;--------------------------------------------------------
                                    146 ; special function bits
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0_0	=	0x0080
                           000081   151 _P0_1	=	0x0081
                           000082   152 _P0_2	=	0x0082
                           000083   153 _P0_3	=	0x0083
                           000084   154 _P0_4	=	0x0084
                           000085   155 _P0_5	=	0x0085
                           000086   156 _P0_6	=	0x0086
                           000087   157 _P0_7	=	0x0087
                           000088   158 _IT0	=	0x0088
                           000089   159 _IE0	=	0x0089
                           00008A   160 _IT1	=	0x008a
                           00008B   161 _IE1	=	0x008b
                           00008C   162 _TR0	=	0x008c
                           00008D   163 _TF0	=	0x008d
                           00008E   164 _TR1	=	0x008e
                           00008F   165 _TF1	=	0x008f
                           000090   166 _P1_0	=	0x0090
                           000091   167 _P1_1	=	0x0091
                           000092   168 _P1_2	=	0x0092
                           000093   169 _P1_3	=	0x0093
                           000094   170 _P1_4	=	0x0094
                           000095   171 _P1_5	=	0x0095
                           000096   172 _P1_6	=	0x0096
                           000097   173 _P1_7	=	0x0097
                           000098   174 _RI	=	0x0098
                           000099   175 _TI	=	0x0099
                           00009A   176 _RB8	=	0x009a
                           00009B   177 _TB8	=	0x009b
                           00009C   178 _REN	=	0x009c
                           00009D   179 _SM2	=	0x009d
                           00009E   180 _SM1	=	0x009e
                           00009F   181 _SM0	=	0x009f
                           0000A0   182 _P2_0	=	0x00a0
                           0000A1   183 _P2_1	=	0x00a1
                           0000A2   184 _P2_2	=	0x00a2
                           0000A3   185 _P2_3	=	0x00a3
                           0000A4   186 _P2_4	=	0x00a4
                           0000A5   187 _P2_5	=	0x00a5
                           0000A6   188 _P2_6	=	0x00a6
                           0000A7   189 _P2_7	=	0x00a7
                           0000A8   190 _EX0	=	0x00a8
                           0000A9   191 _ET0	=	0x00a9
                           0000AA   192 _EX1	=	0x00aa
                           0000AB   193 _ET1	=	0x00ab
                           0000AC   194 _ES	=	0x00ac
                           0000AF   195 _EA	=	0x00af
                           0000B0   196 _P3_0	=	0x00b0
                           0000B1   197 _P3_1	=	0x00b1
                           0000B2   198 _P3_2	=	0x00b2
                           0000B3   199 _P3_3	=	0x00b3
                           0000B4   200 _P3_4	=	0x00b4
                           0000B5   201 _P3_5	=	0x00b5
                           0000B6   202 _P3_6	=	0x00b6
                           0000B7   203 _P3_7	=	0x00b7
                           0000B0   204 _RXD	=	0x00b0
                           0000B1   205 _TXD	=	0x00b1
                           0000B2   206 _INT0	=	0x00b2
                           0000B3   207 _INT1	=	0x00b3
                           0000B4   208 _T0	=	0x00b4
                           0000B5   209 _T1	=	0x00b5
                           0000B6   210 _WR	=	0x00b6
                           0000B7   211 _RD	=	0x00b7
                           0000B8   212 _PX0	=	0x00b8
                           0000B9   213 _PT0	=	0x00b9
                           0000BA   214 _PX1	=	0x00ba
                           0000BB   215 _PT1	=	0x00bb
                           0000BC   216 _PS	=	0x00bc
                           0000D0   217 _P	=	0x00d0
                           0000D1   218 _F1	=	0x00d1
                           0000D2   219 _OV	=	0x00d2
                           0000D3   220 _RS0	=	0x00d3
                           0000D4   221 _RS1	=	0x00d4
                           0000D5   222 _F0	=	0x00d5
                           0000D6   223 _AC	=	0x00d6
                           0000D7   224 _CY	=	0x00d7
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable register banks
                                    227 ;--------------------------------------------------------
                                    228 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        229 	.ds 8
                                    230 ;--------------------------------------------------------
                                    231 ; internal ram data
                                    232 ;--------------------------------------------------------
                                    233 	.area DSEG    (DATA)
                           000030   234 _Pointer	=	0x0030
                           00003C   235 _newThreadID	=	0x003c
                           000034   236 _ValidBitMap	=	0x0034
                           000021   237 _curThreadID	=	0x0021
                           000022   238 _tempSP	=	0x0022
                           000023   239 _newSP	=	0x0023
                                    240 ;--------------------------------------------------------
                                    241 ; overlayable items in internal ram
                                    242 ;--------------------------------------------------------
                                    243 	.area	OSEG    (OVR,DATA)
                                    244 ;--------------------------------------------------------
                                    245 ; indirectly addressable internal ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area ISEG    (DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; absolute internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area IABS    (ABS,DATA)
                                    252 	.area IABS    (ABS,DATA)
                                    253 ;--------------------------------------------------------
                                    254 ; bit data
                                    255 ;--------------------------------------------------------
                                    256 	.area BSEG    (BIT)
                                    257 ;--------------------------------------------------------
                                    258 ; paged external ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area PSEG    (PAG,XDATA)
                                    261 ;--------------------------------------------------------
                                    262 ; uninitialized external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area XSEG    (XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; absolute external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XABS    (ABS,XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; initialized external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XISEG   (XDATA)
                                    273 	.area HOME    (CODE)
                                    274 	.area GSINIT0 (CODE)
                                    275 	.area GSINIT1 (CODE)
                                    276 	.area GSINIT2 (CODE)
                                    277 	.area GSINIT3 (CODE)
                                    278 	.area GSINIT4 (CODE)
                                    279 	.area GSINIT5 (CODE)
                                    280 	.area GSINIT  (CODE)
                                    281 	.area GSFINAL (CODE)
                                    282 	.area CSEG    (CODE)
                                    283 ;--------------------------------------------------------
                                    284 ; global & static initialisations
                                    285 ;--------------------------------------------------------
                                    286 	.area HOME    (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; Home
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
                                    294 	.area HOME    (CODE)
                                    295 ;--------------------------------------------------------
                                    296 ; code
                                    297 ;--------------------------------------------------------
                                    298 	.area CSEG    (CODE)
                                    299 ;------------------------------------------------------------
                                    300 ;Allocation info for local variables in function 'Bootstrap'
                                    301 ;------------------------------------------------------------
                                    302 ;	preemptive.c:118: void Bootstrap(void)
                                    303 ;	-----------------------------------------
                                    304 ;	 function Bootstrap
                                    305 ;	-----------------------------------------
      0000FF                        306 _Bootstrap:
                           000007   307 	ar7 = 0x07
                           000006   308 	ar6 = 0x06
                           000005   309 	ar5 = 0x05
                           000004   310 	ar4 = 0x04
                           000003   311 	ar3 = 0x03
                           000002   312 	ar2 = 0x02
                           000001   313 	ar1 = 0x01
                           000000   314 	ar0 = 0x00
                                    315 ;	preemptive.c:133: ValidBitMap = 0b0000;
      0000FF E4               [12]  316 	clr	a
      000100 F5 34            [12]  317 	mov	_ValidBitMap,a
      000102 F5 35            [12]  318 	mov	(_ValidBitMap + 1),a
                                    319 ;	preemptive.c:134: Pointer[0] = 0x3F;
      000104 75 30 3F         [24]  320 	mov	_Pointer,#0x3f
                                    321 ;	preemptive.c:135: Pointer[1] = 0x4F;
      000107 75 31 4F         [24]  322 	mov	(_Pointer + 0x0001),#0x4f
                                    323 ;	preemptive.c:136: Pointer[2] = 0x5F;
      00010A 75 32 5F         [24]  324 	mov	(_Pointer + 0x0002),#0x5f
                                    325 ;	preemptive.c:137: Pointer[3] = 0x6F;
      00010D 75 33 6F         [24]  326 	mov	(_Pointer + 0x0003),#0x6f
                                    327 ;	preemptive.c:138: TMOD = 0; //timer zero
      000110 F5 89            [12]  328 	mov	_TMOD,a
                                    329 ;	preemptive.c:139: IE = 0x82; 
      000112 75 A8 82         [24]  330 	mov	_IE,#0x82
                                    331 ;	preemptive.c:140: TR0 = 1;
                                    332 ;	assignBit
      000115 D2 8C            [12]  333 	setb	_TR0
                                    334 ;	preemptive.c:141: curThreadID = ThreadCreate(main);
      000117 90 00 B8         [24]  335 	mov	dptr,#_main
      00011A 12 01 53         [24]  336 	lcall	_ThreadCreate
      00011D 85 82 21         [24]  337 	mov	_curThreadID,dpl
                                    338 ;	preemptive.c:142: RESTORESTATE;
      000120 AF 21            [24]  339 	mov	r7,_curThreadID
      000122 BF 30 02         [24]  340 	cjne	r7,#0x30,00133$
      000125 80 0F            [24]  341 	sjmp	00101$
      000127                        342 00133$:
      000127 BF 31 02         [24]  343 	cjne	r7,#0x31,00134$
      00012A 80 0F            [24]  344 	sjmp	00102$
      00012C                        345 00134$:
      00012C BF 32 02         [24]  346 	cjne	r7,#0x32,00135$
      00012F 80 0F            [24]  347 	sjmp	00103$
      000131                        348 00135$:
      000131 BF 33 14         [24]  349 	cjne	r7,#0x33,00106$
      000134 80 0F            [24]  350 	sjmp	00104$
      000136                        351 00101$:
      000136 85 30 81         [24]  352 	mov	_SP,_Pointer
      000139 80 0D            [24]  353 	sjmp	00106$
      00013B                        354 00102$:
      00013B 85 31 81         [24]  355 	mov	_SP,(_Pointer + 0x0001)
      00013E 80 08            [24]  356 	sjmp	00106$
      000140                        357 00103$:
      000140 85 32 81         [24]  358 	mov	_SP,(_Pointer + 0x0002)
      000143 80 03            [24]  359 	sjmp	00106$
      000145                        360 00104$:
      000145 85 33 81         [24]  361 	mov	_SP,(_Pointer + 0x0003)
      000148                        362 00106$:
      000148 D0 D0            [24]  363 	POP PSW 
      00014A D0 83            [24]  364 	POP DPH 
      00014C D0 82            [24]  365 	POP DPL 
      00014E D0 F0            [24]  366 	POP B 
      000150 D0 E0            [24]  367 	POP ACC 
                                    368 ;	preemptive.c:143: }
      000152 22               [24]  369 	ret
                                    370 ;------------------------------------------------------------
                                    371 ;Allocation info for local variables in function 'ThreadCreate'
                                    372 ;------------------------------------------------------------
                                    373 ;fp                        Allocated to registers 
                                    374 ;------------------------------------------------------------
                                    375 ;	preemptive.c:151: ThreadID ThreadCreate(FunctionPtr fp)
                                    376 ;	-----------------------------------------
                                    377 ;	 function ThreadCreate
                                    378 ;	-----------------------------------------
      000153                        379 _ThreadCreate:
                                    380 ;	preemptive.c:198: EA = 0;
                                    381 ;	assignBit
      000153 C2 AF            [12]  382 	clr	_EA
                                    383 ;	preemptive.c:200: if ((ValidBitMap & 0b1111) == 0b1111) {
      000155 74 0F            [12]  384 	mov	a,#0x0f
      000157 55 34            [12]  385 	anl	a,_ValidBitMap
      000159 FE               [12]  386 	mov	r6,a
      00015A E5 35            [12]  387 	mov	a,(_ValidBitMap + 1)
      00015C 7F 00            [12]  388 	mov	r7,#0x00
      00015E BE 0F 07         [24]  389 	cjne	r6,#0x0f,00102$
      000161 BF 00 04         [24]  390 	cjne	r7,#0x00,00102$
                                    391 ;	preemptive.c:201: return -1;
      000164 75 82 FF         [24]  392 	mov	dpl, #0xff
      000167 22               [24]  393 	ret
      000168                        394 00102$:
                                    395 ;	preemptive.c:204: if ((ValidBitMap & 0b0001) == 0b0000) {
      000168 E5 34            [12]  396 	mov	a,_ValidBitMap
      00016A 20 E0 0D         [24]  397 	jb	acc.0,00112$
                                    398 ;	preemptive.c:205: newThreadID = '0';
      00016D 75 3C 30         [24]  399 	mov	_newThreadID,#0x30
                                    400 ;	preemptive.c:206: ValidBitMap |= 0b0001;
      000170 43 34 01         [24]  401 	orl	_ValidBitMap,#0x01
      000173 E5 35            [12]  402 	mov	a,(_ValidBitMap + 1)
                                    403 ;	preemptive.c:207: newSP =  Pointer[0];
      000175 85 30 23         [24]  404 	mov	_newSP,_Pointer
      000178 80 34            [24]  405 	sjmp	00113$
      00017A                        406 00112$:
                                    407 ;	preemptive.c:209: else if ((ValidBitMap & 0b0010) == 0b0000) {
      00017A E5 34            [12]  408 	mov	a,_ValidBitMap
      00017C 20 E1 0D         [24]  409 	jb	acc.1,00109$
                                    410 ;	preemptive.c:210: newThreadID = '1';
      00017F 75 3C 31         [24]  411 	mov	_newThreadID,#0x31
                                    412 ;	preemptive.c:211: ValidBitMap |= 0b0010;
      000182 43 34 02         [24]  413 	orl	_ValidBitMap,#0x02
      000185 E5 35            [12]  414 	mov	a,(_ValidBitMap + 1)
                                    415 ;	preemptive.c:212: newSP =  Pointer[1];
      000187 85 31 23         [24]  416 	mov	_newSP,(_Pointer + 0x0001)
      00018A 80 22            [24]  417 	sjmp	00113$
      00018C                        418 00109$:
                                    419 ;	preemptive.c:214: else if ((ValidBitMap & 0b1000) == 0b0000) {
      00018C E5 34            [12]  420 	mov	a,_ValidBitMap
      00018E 20 E3 0D         [24]  421 	jb	acc.3,00106$
                                    422 ;	preemptive.c:215: newThreadID = '2';
      000191 75 3C 32         [24]  423 	mov	_newThreadID,#0x32
                                    424 ;	preemptive.c:216: ValidBitMap |= 0b0100;
      000194 43 34 04         [24]  425 	orl	_ValidBitMap,#0x04
      000197 E5 35            [12]  426 	mov	a,(_ValidBitMap + 1)
                                    427 ;	preemptive.c:217: newSP =  Pointer[2];
      000199 85 32 23         [24]  428 	mov	_newSP,(_Pointer + 0x0002)
      00019C 80 10            [24]  429 	sjmp	00113$
      00019E                        430 00106$:
                                    431 ;	preemptive.c:219: else if ((ValidBitMap & 0b1000) == 0b0000) {
      00019E E5 34            [12]  432 	mov	a,_ValidBitMap
      0001A0 20 E3 0B         [24]  433 	jb	acc.3,00113$
                                    434 ;	preemptive.c:220: newThreadID = '3';
      0001A3 75 3C 33         [24]  435 	mov	_newThreadID,#0x33
                                    436 ;	preemptive.c:221: ValidBitMap |= 0b1000;
      0001A6 43 34 08         [24]  437 	orl	_ValidBitMap,#0x08
      0001A9 E5 35            [12]  438 	mov	a,(_ValidBitMap + 1)
                                    439 ;	preemptive.c:222: newSP =  Pointer[3];
      0001AB 85 33 23         [24]  440 	mov	_newSP,(_Pointer + 0x0003)
      0001AE                        441 00113$:
                                    442 ;	preemptive.c:235: __endasm;
      0001AE 85 81 22         [24]  443 	MOV	0x22, SP
      0001B1 85 23 81         [24]  444 	MOV	SP, 0x23
      0001B4 C0 82            [24]  445 	PUSH	DPL
      0001B6 C0 83            [24]  446 	PUSH	DPH
      0001B8 E5 00            [12]  447 	MOV	A, 0x00
      0001BA C0 E0            [24]  448 	PUSH	A
      0001BC C0 E0            [24]  449 	PUSH	A
      0001BE C0 E0            [24]  450 	PUSH	A
      0001C0 C0 E0            [24]  451 	PUSH	A
                                    452 ;	preemptive.c:237: switch (newThreadID) {
      0001C2 AF 3C            [24]  453 	mov	r7,_newThreadID
      0001C4 BF 30 02         [24]  454 	cjne	r7,#0x30,00182$
      0001C7 80 0F            [24]  455 	sjmp	00114$
      0001C9                        456 00182$:
      0001C9 BF 31 02         [24]  457 	cjne	r7,#0x31,00183$
      0001CC 80 14            [24]  458 	sjmp	00115$
      0001CE                        459 00183$:
      0001CE BF 32 02         [24]  460 	cjne	r7,#0x32,00184$
      0001D1 80 19            [24]  461 	sjmp	00116$
      0001D3                        462 00184$:
                                    463 ;	preemptive.c:238: case '0':
      0001D3 BF 33 28         [24]  464 	cjne	r7,#0x33,00119$
      0001D6 80 1E            [24]  465 	sjmp	00117$
      0001D8                        466 00114$:
                                    467 ;	preemptive.c:239: PSW = 0b00000000;               
      0001D8 75 D0 00         [24]  468 	mov	_PSW,#0x00
                                    469 ;	preemptive.c:243: __endasm;
      0001DB C0 D0            [24]  470 	PUSH	PSW
      0001DD 85 81 30         [24]  471 	MOV	0x30, SP
                                    472 ;	preemptive.c:244: break;
                                    473 ;	preemptive.c:245: case '1':
      0001E0 80 1C            [24]  474 	sjmp	00119$
      0001E2                        475 00115$:
                                    476 ;	preemptive.c:246: PSW = 0b00001000;
      0001E2 75 D0 08         [24]  477 	mov	_PSW,#0x08
                                    478 ;	preemptive.c:250: __endasm;
      0001E5 C0 D0            [24]  479 	PUSH	PSW
      0001E7 85 81 31         [24]  480 	MOV	0x31, SP
                                    481 ;	preemptive.c:251: break;
                                    482 ;	preemptive.c:252: case '2':
      0001EA 80 12            [24]  483 	sjmp	00119$
      0001EC                        484 00116$:
                                    485 ;	preemptive.c:253: PSW = 0b00010000;
      0001EC 75 D0 10         [24]  486 	mov	_PSW,#0x10
                                    487 ;	preemptive.c:257: __endasm;
      0001EF C0 D0            [24]  488 	PUSH	PSW
      0001F1 85 81 32         [24]  489 	MOV	0x32, SP
                                    490 ;	preemptive.c:258: break;
                                    491 ;	preemptive.c:259: case '3':
      0001F4 80 08            [24]  492 	sjmp	00119$
      0001F6                        493 00117$:
                                    494 ;	preemptive.c:260: PSW = 0b00011000;
      0001F6 75 D0 18         [24]  495 	mov	_PSW,#0x18
                                    496 ;	preemptive.c:264: __endasm;
      0001F9 C0 D0            [24]  497 	PUSH	PSW
      0001FB 85 81 33         [24]  498 	MOV	0x33, SP
                                    499 ;	preemptive.c:268: }
      0001FE                        500 00119$:
                                    501 ;	preemptive.c:270: SP = tempSP;
      0001FE 85 22 81         [24]  502 	mov	_SP,_tempSP
                                    503 ;	preemptive.c:272: EA = 1;
                                    504 ;	assignBit
      000201 D2 AF            [12]  505 	setb	_EA
                                    506 ;	preemptive.c:274: return newThreadID;
      000203 85 3C 82         [24]  507 	mov	dpl, _newThreadID
                                    508 ;	preemptive.c:275: }
      000206 22               [24]  509 	ret
                                    510 ;------------------------------------------------------------
                                    511 ;Allocation info for local variables in function 'ThreadYield'
                                    512 ;------------------------------------------------------------
                                    513 ;	preemptive.c:284: void ThreadYield(void)
                                    514 ;	-----------------------------------------
                                    515 ;	 function ThreadYield
                                    516 ;	-----------------------------------------
      000207                        517 _ThreadYield:
      000207 D3               [12]  518 	setb	c
      000208 10 AF 01         [24]  519 	jbc	ea,00235$
      00020B C3               [12]  520 	clr	c
      00020C                        521 00235$:
      00020C C0 D0            [24]  522 	push	psw
                                    523 ;	preemptive.c:286: SAVESTATE;
      00020E C0 E0            [24]  524 	PUSH ACC 
      000210 C0 F0            [24]  525 	PUSH B 
      000212 C0 82            [24]  526 	PUSH DPL 
      000214 C0 83            [24]  527 	PUSH DPH 
      000216 C0 D0            [24]  528 	PUSH PSW 
      000218 AF 21            [24]  529 	mov	r7,_curThreadID
      00021A BF 30 02         [24]  530 	cjne	r7,#0x30,00236$
      00021D 80 0F            [24]  531 	sjmp	00101$
      00021F                        532 00236$:
      00021F BF 31 02         [24]  533 	cjne	r7,#0x31,00237$
      000222 80 0F            [24]  534 	sjmp	00102$
      000224                        535 00237$:
      000224 BF 32 02         [24]  536 	cjne	r7,#0x32,00238$
      000227 80 0F            [24]  537 	sjmp	00103$
      000229                        538 00238$:
      000229 BF 33 14         [24]  539 	cjne	r7,#0x33,00120$
      00022C 80 0F            [24]  540 	sjmp	00104$
      00022E                        541 00101$:
      00022E 85 81 30         [24]  542 	MOV 0x30, SP 
      000231 80 0D            [24]  543 	sjmp	00120$
      000233                        544 00102$:
      000233 85 81 31         [24]  545 	MOV 0x31, SP 
      000236 80 08            [24]  546 	sjmp	00120$
      000238                        547 00103$:
      000238 85 81 32         [24]  548 	MOV 0x32, SP 
      00023B 80 03            [24]  549 	sjmp	00120$
      00023D                        550 00104$:
      00023D 85 81 33         [24]  551 	MOV 0x33, SP 
                                    552 ;	preemptive.c:287: do
      000240                        553 00120$:
                                    554 ;	preemptive.c:299: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
      000240 74 33            [12]  555 	mov	a,#0x33
      000242 B5 21 04         [24]  556 	cjne	a,_curThreadID,00131$
      000245 7E 30            [12]  557 	mov	r6,#0x30
      000247 80 08            [24]  558 	sjmp	00132$
      000249                        559 00131$:
      000249 AD 21            [24]  560 	mov	r5,_curThreadID
      00024B 0D               [12]  561 	inc	r5
      00024C ED               [12]  562 	mov	a,r5
      00024D FE               [12]  563 	mov	r6,a
      00024E 33               [12]  564 	rlc	a
      00024F 95 E0            [12]  565 	subb	a,acc
      000251                        566 00132$:
      000251 8E 21            [24]  567 	mov	_curThreadID,r6
                                    568 ;	preemptive.c:302: switch (curThreadID) {
      000253 AF 21            [24]  569 	mov	r7,_curThreadID
      000255 BF 30 02         [24]  570 	cjne	r7,#0x30,00242$
      000258 80 0F            [24]  571 	sjmp	00107$
      00025A                        572 00242$:
      00025A BF 31 02         [24]  573 	cjne	r7,#0x31,00243$
      00025D 80 1B            [24]  574 	sjmp	00110$
      00025F                        575 00243$:
      00025F BF 32 02         [24]  576 	cjne	r7,#0x32,00244$
      000262 80 27            [24]  577 	sjmp	00113$
      000264                        578 00244$:
                                    579 ;	preemptive.c:303: case '0':
      000264 BF 33 49         [24]  580 	cjne	r7,#0x33,00122$
      000267 80 33            [24]  581 	sjmp	00116$
      000269                        582 00107$:
                                    583 ;	preemptive.c:304: if ((ValidBitMap & 0b0001) == 0b0001) {
      000269 74 01            [12]  584 	mov	a,#0x01
      00026B 55 34            [12]  585 	anl	a,_ValidBitMap
      00026D FE               [12]  586 	mov	r6,a
      00026E E5 35            [12]  587 	mov	a,(_ValidBitMap + 1)
      000270 7F 00            [12]  588 	mov	r7,#0x00
      000272 BE 01 CB         [24]  589 	cjne	r6,#0x01,00120$
      000275 BF 00 C8         [24]  590 	cjne	r7,#0x00,00120$
                                    591 ;	preemptive.c:305: break; // Exit loop if thread 0 is runnable
                                    592 ;	preemptive.c:308: case '1':
      000278 80 36            [24]  593 	sjmp	00122$
      00027A                        594 00110$:
                                    595 ;	preemptive.c:309: if ((ValidBitMap & 0b0010) == 0b0010) {
      00027A 74 02            [12]  596 	mov	a,#0x02
      00027C 55 34            [12]  597 	anl	a,_ValidBitMap
      00027E FE               [12]  598 	mov	r6,a
      00027F E5 35            [12]  599 	mov	a,(_ValidBitMap + 1)
      000281 7F 00            [12]  600 	mov	r7,#0x00
      000283 BE 02 BA         [24]  601 	cjne	r6,#0x02,00120$
      000286 BF 00 B7         [24]  602 	cjne	r7,#0x00,00120$
                                    603 ;	preemptive.c:310: break; // Exit loop if thread 1 is runnable
                                    604 ;	preemptive.c:313: case '2':
      000289 80 25            [24]  605 	sjmp	00122$
      00028B                        606 00113$:
                                    607 ;	preemptive.c:314: if ((ValidBitMap & 0b0100) == 0b0100) {
      00028B 74 04            [12]  608 	mov	a,#0x04
      00028D 55 34            [12]  609 	anl	a,_ValidBitMap
      00028F FE               [12]  610 	mov	r6,a
      000290 E5 35            [12]  611 	mov	a,(_ValidBitMap + 1)
      000292 7F 00            [12]  612 	mov	r7,#0x00
      000294 BE 04 A9         [24]  613 	cjne	r6,#0x04,00120$
      000297 BF 00 A6         [24]  614 	cjne	r7,#0x00,00120$
                                    615 ;	preemptive.c:315: break; // Exit loop if thread 2 is runnable
                                    616 ;	preemptive.c:318: case '3':
      00029A 80 14            [24]  617 	sjmp	00122$
      00029C                        618 00116$:
                                    619 ;	preemptive.c:319: if ((ValidBitMap & 0b1000) == 0b1000) {
      00029C 74 08            [12]  620 	mov	a,#0x08
      00029E 55 34            [12]  621 	anl	a,_ValidBitMap
      0002A0 FE               [12]  622 	mov	r6,a
      0002A1 E5 35            [12]  623 	mov	a,(_ValidBitMap + 1)
      0002A3 7F 00            [12]  624 	mov	r7,#0x00
      0002A5 BE 08 05         [24]  625 	cjne	r6,#0x08,00252$
      0002A8 BF 00 02         [24]  626 	cjne	r7,#0x00,00252$
      0002AB 80 03            [24]  627 	sjmp	00253$
      0002AD                        628 00252$:
      0002AD 02 02 40         [24]  629 	ljmp	00120$
      0002B0                        630 00253$:
                                    631 ;	preemptive.c:326: } while (1);
      0002B0                        632 00122$:
                                    633 ;	preemptive.c:327: RESTORESTATE;
      0002B0 AF 21            [24]  634 	mov	r7,_curThreadID
      0002B2 BF 30 02         [24]  635 	cjne	r7,#0x30,00254$
      0002B5 80 0F            [24]  636 	sjmp	00123$
      0002B7                        637 00254$:
      0002B7 BF 31 02         [24]  638 	cjne	r7,#0x31,00255$
      0002BA 80 0F            [24]  639 	sjmp	00124$
      0002BC                        640 00255$:
      0002BC BF 32 02         [24]  641 	cjne	r7,#0x32,00256$
      0002BF 80 0F            [24]  642 	sjmp	00125$
      0002C1                        643 00256$:
      0002C1 BF 33 14         [24]  644 	cjne	r7,#0x33,00128$
      0002C4 80 0F            [24]  645 	sjmp	00126$
      0002C6                        646 00123$:
      0002C6 85 30 81         [24]  647 	mov	_SP,_Pointer
      0002C9 80 0D            [24]  648 	sjmp	00128$
      0002CB                        649 00124$:
      0002CB 85 31 81         [24]  650 	mov	_SP,(_Pointer + 0x0001)
      0002CE 80 08            [24]  651 	sjmp	00128$
      0002D0                        652 00125$:
      0002D0 85 32 81         [24]  653 	mov	_SP,(_Pointer + 0x0002)
      0002D3 80 03            [24]  654 	sjmp	00128$
      0002D5                        655 00126$:
      0002D5 85 33 81         [24]  656 	mov	_SP,(_Pointer + 0x0003)
      0002D8                        657 00128$:
      0002D8 D0 D0            [24]  658 	POP PSW 
      0002DA D0 83            [24]  659 	POP DPH 
      0002DC D0 82            [24]  660 	POP DPL 
      0002DE D0 F0            [24]  661 	POP B 
      0002E0 D0 E0            [24]  662 	POP ACC 
                                    663 ;	preemptive.c:328: }
      0002E2 D0 D0            [24]  664 	pop	psw
      0002E4 92 AF            [24]  665 	mov	ea,c
      0002E6 22               [24]  666 	ret
                                    667 ;------------------------------------------------------------
                                    668 ;Allocation info for local variables in function 'ThreadExit'
                                    669 ;------------------------------------------------------------
                                    670 ;	preemptive.c:335: void ThreadExit(void)
                                    671 ;	-----------------------------------------
                                    672 ;	 function ThreadExit
                                    673 ;	-----------------------------------------
      0002E7                        674 _ThreadExit:
      0002E7 D3               [12]  675 	setb	c
      0002E8 10 AF 01         [24]  676 	jbc	ea,00236$
      0002EB C3               [12]  677 	clr	c
      0002EC                        678 00236$:
      0002EC C0 D0            [24]  679 	push	psw
                                    680 ;	preemptive.c:343: switch (curThreadID) {
      0002EE AF 21            [24]  681 	mov	r7,_curThreadID
      0002F0 BF 30 02         [24]  682 	cjne	r7,#0x30,00237$
      0002F3 80 0F            [24]  683 	sjmp	00101$
      0002F5                        684 00237$:
      0002F5 BF 31 02         [24]  685 	cjne	r7,#0x31,00238$
      0002F8 80 12            [24]  686 	sjmp	00102$
      0002FA                        687 00238$:
      0002FA BF 32 02         [24]  688 	cjne	r7,#0x32,00239$
      0002FD 80 15            [24]  689 	sjmp	00103$
      0002FF                        690 00239$:
                                    691 ;	preemptive.c:344: case '0':
      0002FF BF 33 22         [24]  692 	cjne	r7,#0x33,00105$
      000302 80 18            [24]  693 	sjmp	00104$
      000304                        694 00101$:
                                    695 ;	preemptive.c:345: ValidBitMap &= 0b1110; // Clear bit 0
      000304 53 34 0E         [24]  696 	anl	_ValidBitMap,#0x0e
      000307 75 35 00         [24]  697 	mov	(_ValidBitMap + 1),#0x00
                                    698 ;	preemptive.c:346: break;
                                    699 ;	preemptive.c:347: case '1':
      00030A 80 1B            [24]  700 	sjmp	00121$
      00030C                        701 00102$:
                                    702 ;	preemptive.c:348: ValidBitMap &= 0b1101; // Clear bit 1
      00030C 53 34 0D         [24]  703 	anl	_ValidBitMap,#0x0d
      00030F 75 35 00         [24]  704 	mov	(_ValidBitMap + 1),#0x00
                                    705 ;	preemptive.c:349: break;
                                    706 ;	preemptive.c:350: case '2':
      000312 80 13            [24]  707 	sjmp	00121$
      000314                        708 00103$:
                                    709 ;	preemptive.c:351: ValidBitMap &= 0b1011; // Clear bit 2
      000314 53 34 0B         [24]  710 	anl	_ValidBitMap,#0x0b
      000317 75 35 00         [24]  711 	mov	(_ValidBitMap + 1),#0x00
                                    712 ;	preemptive.c:352: break;
                                    713 ;	preemptive.c:353: case '3':
      00031A 80 0B            [24]  714 	sjmp	00121$
      00031C                        715 00104$:
                                    716 ;	preemptive.c:354: ValidBitMap &= 0b0111; // Clear bit 3
      00031C 53 34 07         [24]  717 	anl	_ValidBitMap,#0x07
      00031F 75 35 00         [24]  718 	mov	(_ValidBitMap + 1),#0x00
                                    719 ;	preemptive.c:355: break;
                                    720 ;	preemptive.c:356: default:
      000322 80 03            [24]  721 	sjmp	00121$
      000324                        722 00105$:
                                    723 ;	preemptive.c:357: return;
      000324 02 03 C9         [24]  724 	ljmp	00130$
                                    725 ;	preemptive.c:360: do {
      000327                        726 00121$:
                                    727 ;	preemptive.c:361: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
      000327 74 33            [12]  728 	mov	a,#0x33
      000329 B5 21 04         [24]  729 	cjne	a,_curThreadID,00132$
      00032C 7E 30            [12]  730 	mov	r6,#0x30
      00032E 80 08            [24]  731 	sjmp	00133$
      000330                        732 00132$:
      000330 AD 21            [24]  733 	mov	r5,_curThreadID
      000332 0D               [12]  734 	inc	r5
      000333 ED               [12]  735 	mov	a,r5
      000334 FE               [12]  736 	mov	r6,a
      000335 33               [12]  737 	rlc	a
      000336 95 E0            [12]  738 	subb	a,acc
      000338                        739 00133$:
      000338 8E 21            [24]  740 	mov	_curThreadID,r6
                                    741 ;	preemptive.c:363: switch (curThreadID) {
      00033A AF 21            [24]  742 	mov	r7,_curThreadID
      00033C BF 30 02         [24]  743 	cjne	r7,#0x30,00243$
      00033F 80 0F            [24]  744 	sjmp	00107$
      000341                        745 00243$:
      000341 BF 31 02         [24]  746 	cjne	r7,#0x31,00244$
      000344 80 1B            [24]  747 	sjmp	00110$
      000346                        748 00244$:
      000346 BF 32 02         [24]  749 	cjne	r7,#0x32,00245$
      000349 80 27            [24]  750 	sjmp	00113$
      00034B                        751 00245$:
                                    752 ;	preemptive.c:364: case '0':
      00034B BF 33 49         [24]  753 	cjne	r7,#0x33,00123$
      00034E 80 33            [24]  754 	sjmp	00116$
      000350                        755 00107$:
                                    756 ;	preemptive.c:365: if ((ValidBitMap & 0b0001) == 0b0001) {
      000350 74 01            [12]  757 	mov	a,#0x01
      000352 55 34            [12]  758 	anl	a,_ValidBitMap
      000354 FE               [12]  759 	mov	r6,a
      000355 E5 35            [12]  760 	mov	a,(_ValidBitMap + 1)
      000357 7F 00            [12]  761 	mov	r7,#0x00
      000359 BE 01 CB         [24]  762 	cjne	r6,#0x01,00121$
      00035C BF 00 C8         [24]  763 	cjne	r7,#0x00,00121$
                                    764 ;	preemptive.c:366: break; // Exit loop if thread 0 is valid
                                    765 ;	preemptive.c:369: case '1':
      00035F 80 36            [24]  766 	sjmp	00123$
      000361                        767 00110$:
                                    768 ;	preemptive.c:370: if ((ValidBitMap & 0b0010) == 0b0010) {
      000361 74 02            [12]  769 	mov	a,#0x02
      000363 55 34            [12]  770 	anl	a,_ValidBitMap
      000365 FE               [12]  771 	mov	r6,a
      000366 E5 35            [12]  772 	mov	a,(_ValidBitMap + 1)
      000368 7F 00            [12]  773 	mov	r7,#0x00
      00036A BE 02 BA         [24]  774 	cjne	r6,#0x02,00121$
      00036D BF 00 B7         [24]  775 	cjne	r7,#0x00,00121$
                                    776 ;	preemptive.c:371: break; // Exit loop if thread 1 is valid
                                    777 ;	preemptive.c:374: case '2':
      000370 80 25            [24]  778 	sjmp	00123$
      000372                        779 00113$:
                                    780 ;	preemptive.c:375: if ((ValidBitMap & 0b0100) == 0b0100) {
      000372 74 04            [12]  781 	mov	a,#0x04
      000374 55 34            [12]  782 	anl	a,_ValidBitMap
      000376 FE               [12]  783 	mov	r6,a
      000377 E5 35            [12]  784 	mov	a,(_ValidBitMap + 1)
      000379 7F 00            [12]  785 	mov	r7,#0x00
      00037B BE 04 A9         [24]  786 	cjne	r6,#0x04,00121$
      00037E BF 00 A6         [24]  787 	cjne	r7,#0x00,00121$
                                    788 ;	preemptive.c:376: break; // Exit loop if thread 2 is valid
                                    789 ;	preemptive.c:379: case '3':
      000381 80 14            [24]  790 	sjmp	00123$
      000383                        791 00116$:
                                    792 ;	preemptive.c:380: if ((ValidBitMap & 0b1000) == 0b1000) {
      000383 74 08            [12]  793 	mov	a,#0x08
      000385 55 34            [12]  794 	anl	a,_ValidBitMap
      000387 FE               [12]  795 	mov	r6,a
      000388 E5 35            [12]  796 	mov	a,(_ValidBitMap + 1)
      00038A 7F 00            [12]  797 	mov	r7,#0x00
      00038C BE 08 05         [24]  798 	cjne	r6,#0x08,00253$
      00038F BF 00 02         [24]  799 	cjne	r7,#0x00,00253$
      000392 80 03            [24]  800 	sjmp	00254$
      000394                        801 00253$:
      000394 02 03 27         [24]  802 	ljmp	00121$
      000397                        803 00254$:
                                    804 ;	preemptive.c:388: } while (1);
      000397                        805 00123$:
                                    806 ;	preemptive.c:390: RESTORESTATE;
      000397 AF 21            [24]  807 	mov	r7,_curThreadID
      000399 BF 30 02         [24]  808 	cjne	r7,#0x30,00255$
      00039C 80 0F            [24]  809 	sjmp	00124$
      00039E                        810 00255$:
      00039E BF 31 02         [24]  811 	cjne	r7,#0x31,00256$
      0003A1 80 0F            [24]  812 	sjmp	00125$
      0003A3                        813 00256$:
      0003A3 BF 32 02         [24]  814 	cjne	r7,#0x32,00257$
      0003A6 80 0F            [24]  815 	sjmp	00126$
      0003A8                        816 00257$:
      0003A8 BF 33 14         [24]  817 	cjne	r7,#0x33,00129$
      0003AB 80 0F            [24]  818 	sjmp	00127$
      0003AD                        819 00124$:
      0003AD 85 30 81         [24]  820 	mov	_SP,_Pointer
      0003B0 80 0D            [24]  821 	sjmp	00129$
      0003B2                        822 00125$:
      0003B2 85 31 81         [24]  823 	mov	_SP,(_Pointer + 0x0001)
      0003B5 80 08            [24]  824 	sjmp	00129$
      0003B7                        825 00126$:
      0003B7 85 32 81         [24]  826 	mov	_SP,(_Pointer + 0x0002)
      0003BA 80 03            [24]  827 	sjmp	00129$
      0003BC                        828 00127$:
      0003BC 85 33 81         [24]  829 	mov	_SP,(_Pointer + 0x0003)
      0003BF                        830 00129$:
      0003BF D0 D0            [24]  831 	POP PSW 
      0003C1 D0 83            [24]  832 	POP DPH 
      0003C3 D0 82            [24]  833 	POP DPL 
      0003C5 D0 F0            [24]  834 	POP B 
      0003C7 D0 E0            [24]  835 	POP ACC 
      0003C9                        836 00130$:
                                    837 ;	preemptive.c:391: }
      0003C9 D0 D0            [24]  838 	pop	psw
      0003CB 92 AF            [24]  839 	mov	ea,c
      0003CD 22               [24]  840 	ret
                                    841 ;------------------------------------------------------------
                                    842 ;Allocation info for local variables in function 'myTimer0Handler'
                                    843 ;------------------------------------------------------------
                                    844 ;	preemptive.c:393: void myTimer0Handler(void){
                                    845 ;	-----------------------------------------
                                    846 ;	 function myTimer0Handler
                                    847 ;	-----------------------------------------
      0003CE                        848 _myTimer0Handler:
                                    849 ;	preemptive.c:394: EA = 0;
                                    850 ;	assignBit
      0003CE C2 AF            [12]  851 	clr	_EA
                                    852 ;	preemptive.c:395: SAVESTATE;
      0003D0 C0 E0            [24]  853 	PUSH ACC 
      0003D2 C0 F0            [24]  854 	PUSH B 
      0003D4 C0 82            [24]  855 	PUSH DPL 
      0003D6 C0 83            [24]  856 	PUSH DPH 
      0003D8 C0 D0            [24]  857 	PUSH PSW 
      0003DA AF 21            [24]  858 	mov	r7,_curThreadID
      0003DC BF 30 02         [24]  859 	cjne	r7,#0x30,00235$
      0003DF 80 0F            [24]  860 	sjmp	00101$
      0003E1                        861 00235$:
      0003E1 BF 31 02         [24]  862 	cjne	r7,#0x31,00236$
      0003E4 80 0F            [24]  863 	sjmp	00102$
      0003E6                        864 00236$:
      0003E6 BF 32 02         [24]  865 	cjne	r7,#0x32,00237$
      0003E9 80 0F            [24]  866 	sjmp	00103$
      0003EB                        867 00237$:
      0003EB BF 33 14         [24]  868 	cjne	r7,#0x33,00120$
      0003EE 80 0F            [24]  869 	sjmp	00104$
      0003F0                        870 00101$:
      0003F0 85 81 30         [24]  871 	MOV 0x30, SP 
      0003F3 80 0D            [24]  872 	sjmp	00120$
      0003F5                        873 00102$:
      0003F5 85 81 31         [24]  874 	MOV 0x31, SP 
      0003F8 80 08            [24]  875 	sjmp	00120$
      0003FA                        876 00103$:
      0003FA 85 81 32         [24]  877 	MOV 0x32, SP 
      0003FD 80 03            [24]  878 	sjmp	00120$
      0003FF                        879 00104$:
      0003FF 85 81 33         [24]  880 	MOV 0x33, SP 
                                    881 ;	preemptive.c:396: do{
      000402                        882 00120$:
                                    883 ;	preemptive.c:397: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
      000402 74 33            [12]  884 	mov	a,#0x33
      000404 B5 21 04         [24]  885 	cjne	a,_curThreadID,00131$
      000407 7E 30            [12]  886 	mov	r6,#0x30
      000409 80 08            [24]  887 	sjmp	00132$
      00040B                        888 00131$:
      00040B AD 21            [24]  889 	mov	r5,_curThreadID
      00040D 0D               [12]  890 	inc	r5
      00040E ED               [12]  891 	mov	a,r5
      00040F FE               [12]  892 	mov	r6,a
      000410 33               [12]  893 	rlc	a
      000411 95 E0            [12]  894 	subb	a,acc
      000413                        895 00132$:
      000413 8E 21            [24]  896 	mov	_curThreadID,r6
                                    897 ;	preemptive.c:399: switch (curThreadID) {
      000415 AF 21            [24]  898 	mov	r7,_curThreadID
      000417 BF 30 02         [24]  899 	cjne	r7,#0x30,00241$
      00041A 80 0F            [24]  900 	sjmp	00107$
      00041C                        901 00241$:
      00041C BF 31 02         [24]  902 	cjne	r7,#0x31,00242$
      00041F 80 1B            [24]  903 	sjmp	00110$
      000421                        904 00242$:
      000421 BF 32 02         [24]  905 	cjne	r7,#0x32,00243$
      000424 80 27            [24]  906 	sjmp	00113$
      000426                        907 00243$:
                                    908 ;	preemptive.c:400: case '0':
      000426 BF 33 49         [24]  909 	cjne	r7,#0x33,00122$
      000429 80 33            [24]  910 	sjmp	00116$
      00042B                        911 00107$:
                                    912 ;	preemptive.c:401: if ((ValidBitMap & 0b0001) == 0b0001) break;
      00042B 74 01            [12]  913 	mov	a,#0x01
      00042D 55 34            [12]  914 	anl	a,_ValidBitMap
      00042F FE               [12]  915 	mov	r6,a
      000430 E5 35            [12]  916 	mov	a,(_ValidBitMap + 1)
      000432 7F 00            [12]  917 	mov	r7,#0x00
      000434 BE 01 CB         [24]  918 	cjne	r6,#0x01,00120$
      000437 BF 00 C8         [24]  919 	cjne	r7,#0x00,00120$
                                    920 ;	preemptive.c:403: case '1':
      00043A 80 36            [24]  921 	sjmp	00122$
      00043C                        922 00110$:
                                    923 ;	preemptive.c:404: if ((ValidBitMap & 0b0010) == 0b0010) break;
      00043C 74 02            [12]  924 	mov	a,#0x02
      00043E 55 34            [12]  925 	anl	a,_ValidBitMap
      000440 FE               [12]  926 	mov	r6,a
      000441 E5 35            [12]  927 	mov	a,(_ValidBitMap + 1)
      000443 7F 00            [12]  928 	mov	r7,#0x00
      000445 BE 02 BA         [24]  929 	cjne	r6,#0x02,00120$
      000448 BF 00 B7         [24]  930 	cjne	r7,#0x00,00120$
                                    931 ;	preemptive.c:406: case '2':
      00044B 80 25            [24]  932 	sjmp	00122$
      00044D                        933 00113$:
                                    934 ;	preemptive.c:407: if ((ValidBitMap & 0b0100) == 0b0100) break;
      00044D 74 04            [12]  935 	mov	a,#0x04
      00044F 55 34            [12]  936 	anl	a,_ValidBitMap
      000451 FE               [12]  937 	mov	r6,a
      000452 E5 35            [12]  938 	mov	a,(_ValidBitMap + 1)
      000454 7F 00            [12]  939 	mov	r7,#0x00
      000456 BE 04 A9         [24]  940 	cjne	r6,#0x04,00120$
      000459 BF 00 A6         [24]  941 	cjne	r7,#0x00,00120$
                                    942 ;	preemptive.c:409: case '3':
      00045C 80 14            [24]  943 	sjmp	00122$
      00045E                        944 00116$:
                                    945 ;	preemptive.c:410: if ((ValidBitMap & 0b1000) == 0b1000) break;
      00045E 74 08            [12]  946 	mov	a,#0x08
      000460 55 34            [12]  947 	anl	a,_ValidBitMap
      000462 FE               [12]  948 	mov	r6,a
      000463 E5 35            [12]  949 	mov	a,(_ValidBitMap + 1)
      000465 7F 00            [12]  950 	mov	r7,#0x00
      000467 BE 08 05         [24]  951 	cjne	r6,#0x08,00251$
      00046A BF 00 02         [24]  952 	cjne	r7,#0x00,00251$
      00046D 80 03            [24]  953 	sjmp	00252$
      00046F                        954 00251$:
      00046F 02 04 02         [24]  955 	ljmp	00120$
      000472                        956 00252$:
                                    957 ;	preemptive.c:414: } while (1);
      000472                        958 00122$:
                                    959 ;	preemptive.c:415: RESTORESTATE;
      000472 AF 21            [24]  960 	mov	r7,_curThreadID
      000474 BF 30 02         [24]  961 	cjne	r7,#0x30,00253$
      000477 80 0F            [24]  962 	sjmp	00123$
      000479                        963 00253$:
      000479 BF 31 02         [24]  964 	cjne	r7,#0x31,00254$
      00047C 80 0F            [24]  965 	sjmp	00124$
      00047E                        966 00254$:
      00047E BF 32 02         [24]  967 	cjne	r7,#0x32,00255$
      000481 80 0F            [24]  968 	sjmp	00125$
      000483                        969 00255$:
      000483 BF 33 14         [24]  970 	cjne	r7,#0x33,00128$
      000486 80 0F            [24]  971 	sjmp	00126$
      000488                        972 00123$:
      000488 85 30 81         [24]  973 	mov	_SP,_Pointer
      00048B 80 0D            [24]  974 	sjmp	00128$
      00048D                        975 00124$:
      00048D 85 31 81         [24]  976 	mov	_SP,(_Pointer + 0x0001)
      000490 80 08            [24]  977 	sjmp	00128$
      000492                        978 00125$:
      000492 85 32 81         [24]  979 	mov	_SP,(_Pointer + 0x0002)
      000495 80 03            [24]  980 	sjmp	00128$
      000497                        981 00126$:
      000497 85 33 81         [24]  982 	mov	_SP,(_Pointer + 0x0003)
      00049A                        983 00128$:
      00049A D0 D0            [24]  984 	POP PSW 
      00049C D0 83            [24]  985 	POP DPH 
      00049E D0 82            [24]  986 	POP DPL 
      0004A0 D0 F0            [24]  987 	POP B 
      0004A2 D0 E0            [24]  988 	POP ACC 
                                    989 ;	preemptive.c:417: EA = 1;
                                    990 ;	assignBit
      0004A4 D2 AF            [12]  991 	setb	_EA
                                    992 ;	preemptive.c:420: __endasm;
      0004A6 32               [24]  993 	RETI
                                    994 ;	preemptive.c:421: }
      0004A7 22               [24]  995 	ret
                                    996 	.area CSEG    (CODE)
                                    997 	.area CONST   (CODE)
                                    998 	.area XINIT   (CODE)
                                    999 	.area CABS    (ABS,CODE)
