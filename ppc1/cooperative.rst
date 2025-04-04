                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler 
                                      3 ; Version 4.4.0 #14620 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _newSP
                                    110 	.globl _tempSP
                                    111 	.globl _curThreadID
                                    112 	.globl _ValidBitMap
                                    113 	.globl _newThreadID
                                    114 	.globl _Pointer
                                    115 	.globl _ThreadCreate
                                    116 	.globl _ThreadYield
                                    117 	.globl _ThreadExit
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
                           000030   233 _Pointer	=	0x0030
                           00003C   234 _newThreadID	=	0x003c
                           000034   235 _ValidBitMap	=	0x0034
                           000021   236 _curThreadID	=	0x0021
                           000022   237 _tempSP	=	0x0022
                           000023   238 _newSP	=	0x0023
                                    239 ;--------------------------------------------------------
                                    240 ; overlayable items in internal ram
                                    241 ;--------------------------------------------------------
                                    242 	.area	OSEG    (OVR,DATA)
                                    243 ;--------------------------------------------------------
                                    244 ; indirectly addressable internal ram data
                                    245 ;--------------------------------------------------------
                                    246 	.area ISEG    (DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; absolute internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area IABS    (ABS,DATA)
                                    251 	.area IABS    (ABS,DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; bit data
                                    254 ;--------------------------------------------------------
                                    255 	.area BSEG    (BIT)
                                    256 ;--------------------------------------------------------
                                    257 ; paged external ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area PSEG    (PAG,XDATA)
                                    260 ;--------------------------------------------------------
                                    261 ; uninitialized external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area XSEG    (XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; absolute external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XABS    (ABS,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; initialized external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XISEG   (XDATA)
                                    272 	.area HOME    (CODE)
                                    273 	.area GSINIT0 (CODE)
                                    274 	.area GSINIT1 (CODE)
                                    275 	.area GSINIT2 (CODE)
                                    276 	.area GSINIT3 (CODE)
                                    277 	.area GSINIT4 (CODE)
                                    278 	.area GSINIT5 (CODE)
                                    279 	.area GSINIT  (CODE)
                                    280 	.area GSFINAL (CODE)
                                    281 	.area CSEG    (CODE)
                                    282 ;--------------------------------------------------------
                                    283 ; global & static initialisations
                                    284 ;--------------------------------------------------------
                                    285 	.area HOME    (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 	.area GSFINAL (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 ;--------------------------------------------------------
                                    290 ; Home
                                    291 ;--------------------------------------------------------
                                    292 	.area HOME    (CODE)
                                    293 	.area HOME    (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; code
                                    296 ;--------------------------------------------------------
                                    297 	.area CSEG    (CODE)
                                    298 ;------------------------------------------------------------
                                    299 ;Allocation info for local variables in function 'Bootstrap'
                                    300 ;------------------------------------------------------------
                                    301 ;	cooperative.c:118: void Bootstrap(void)
                                    302 ;	-----------------------------------------
                                    303 ;	 function Bootstrap
                                    304 ;	-----------------------------------------
      00007C                        305 _Bootstrap:
                           000007   306 	ar7 = 0x07
                           000006   307 	ar6 = 0x06
                           000005   308 	ar5 = 0x05
                           000004   309 	ar4 = 0x04
                           000003   310 	ar3 = 0x03
                           000002   311 	ar2 = 0x02
                           000001   312 	ar1 = 0x01
                           000000   313 	ar0 = 0x00
                                    314 ;	cooperative.c:133: ValidBitMap = 0b0000;
      00007C E4               [12]  315 	clr	a
      00007D F5 34            [12]  316 	mov	_ValidBitMap,a
      00007F F5 35            [12]  317 	mov	(_ValidBitMap + 1),a
                                    318 ;	cooperative.c:134: Pointer[0] = 0x3F;
      000081 75 30 3F         [24]  319 	mov	_Pointer,#0x3f
                                    320 ;	cooperative.c:135: Pointer[1] = 0x4F;
      000084 75 31 4F         [24]  321 	mov	(_Pointer + 0x0001),#0x4f
                                    322 ;	cooperative.c:136: Pointer[2] = 0x5F;
      000087 75 32 5F         [24]  323 	mov	(_Pointer + 0x0002),#0x5f
                                    324 ;	cooperative.c:137: Pointer[3] = 0x6F;
      00008A 75 33 6F         [24]  325 	mov	(_Pointer + 0x0003),#0x6f
                                    326 ;	cooperative.c:138: curThreadID = ThreadCreate(main);
      00008D 90 00 64         [24]  327 	mov	dptr,#_main
      000090 12 00 C9         [24]  328 	lcall	_ThreadCreate
      000093 85 82 21         [24]  329 	mov	_curThreadID,dpl
                                    330 ;	cooperative.c:139: RESTORESTATE;
      000096 AF 21            [24]  331 	mov	r7,_curThreadID
      000098 BF 30 02         [24]  332 	cjne	r7,#0x30,00133$
      00009B 80 0F            [24]  333 	sjmp	00101$
      00009D                        334 00133$:
      00009D BF 31 02         [24]  335 	cjne	r7,#0x31,00134$
      0000A0 80 0F            [24]  336 	sjmp	00102$
      0000A2                        337 00134$:
      0000A2 BF 32 02         [24]  338 	cjne	r7,#0x32,00135$
      0000A5 80 0F            [24]  339 	sjmp	00103$
      0000A7                        340 00135$:
      0000A7 BF 33 14         [24]  341 	cjne	r7,#0x33,00106$
      0000AA 80 0F            [24]  342 	sjmp	00104$
      0000AC                        343 00101$:
      0000AC 85 30 81         [24]  344 	mov	_SP,_Pointer
      0000AF 80 0D            [24]  345 	sjmp	00106$
      0000B1                        346 00102$:
      0000B1 85 31 81         [24]  347 	mov	_SP,(_Pointer + 0x0001)
      0000B4 80 08            [24]  348 	sjmp	00106$
      0000B6                        349 00103$:
      0000B6 85 32 81         [24]  350 	mov	_SP,(_Pointer + 0x0002)
      0000B9 80 03            [24]  351 	sjmp	00106$
      0000BB                        352 00104$:
      0000BB 85 33 81         [24]  353 	mov	_SP,(_Pointer + 0x0003)
      0000BE                        354 00106$:
      0000BE D0 D0            [24]  355 	POP PSW 
      0000C0 D0 83            [24]  356 	POP DPH 
      0000C2 D0 82            [24]  357 	POP DPL 
      0000C4 D0 F0            [24]  358 	POP B 
      0000C6 D0 E0            [24]  359 	POP ACC 
                                    360 ;	cooperative.c:140: }
      0000C8 22               [24]  361 	ret
                                    362 ;------------------------------------------------------------
                                    363 ;Allocation info for local variables in function 'ThreadCreate'
                                    364 ;------------------------------------------------------------
                                    365 ;fp                        Allocated to registers 
                                    366 ;------------------------------------------------------------
                                    367 ;	cooperative.c:148: ThreadID ThreadCreate(FunctionPtr fp)
                                    368 ;	-----------------------------------------
                                    369 ;	 function ThreadCreate
                                    370 ;	-----------------------------------------
      0000C9                        371 _ThreadCreate:
                                    372 ;	cooperative.c:194: if ((ValidBitMap & 0b1111) == 0b1111) {
      0000C9 74 0F            [12]  373 	mov	a,#0x0f
      0000CB 55 34            [12]  374 	anl	a,_ValidBitMap
      0000CD FE               [12]  375 	mov	r6,a
      0000CE E5 35            [12]  376 	mov	a,(_ValidBitMap + 1)
      0000D0 7F 00            [12]  377 	mov	r7,#0x00
      0000D2 BE 0F 07         [24]  378 	cjne	r6,#0x0f,00102$
      0000D5 BF 00 04         [24]  379 	cjne	r7,#0x00,00102$
                                    380 ;	cooperative.c:195: return -1;
      0000D8 75 82 FF         [24]  381 	mov	dpl, #0xff
      0000DB 22               [24]  382 	ret
      0000DC                        383 00102$:
                                    384 ;	cooperative.c:198: if ((ValidBitMap & 0b0001) == 0b0000) {
      0000DC E5 34            [12]  385 	mov	a,_ValidBitMap
      0000DE 20 E0 0D         [24]  386 	jb	acc.0,00112$
                                    387 ;	cooperative.c:199: newThreadID = '0';
      0000E1 75 3C 30         [24]  388 	mov	_newThreadID,#0x30
                                    389 ;	cooperative.c:200: ValidBitMap |= 0b0001;
      0000E4 43 34 01         [24]  390 	orl	_ValidBitMap,#0x01
      0000E7 E5 35            [12]  391 	mov	a,(_ValidBitMap + 1)
                                    392 ;	cooperative.c:201: newSP =  Pointer[0];
      0000E9 85 30 23         [24]  393 	mov	_newSP,_Pointer
      0000EC 80 34            [24]  394 	sjmp	00113$
      0000EE                        395 00112$:
                                    396 ;	cooperative.c:203: else if ((ValidBitMap & 0b0010) == 0b0000) {
      0000EE E5 34            [12]  397 	mov	a,_ValidBitMap
      0000F0 20 E1 0D         [24]  398 	jb	acc.1,00109$
                                    399 ;	cooperative.c:204: newThreadID = '1';
      0000F3 75 3C 31         [24]  400 	mov	_newThreadID,#0x31
                                    401 ;	cooperative.c:205: ValidBitMap |= 0b0010;
      0000F6 43 34 02         [24]  402 	orl	_ValidBitMap,#0x02
      0000F9 E5 35            [12]  403 	mov	a,(_ValidBitMap + 1)
                                    404 ;	cooperative.c:206: newSP =  Pointer[1];
      0000FB 85 31 23         [24]  405 	mov	_newSP,(_Pointer + 0x0001)
      0000FE 80 22            [24]  406 	sjmp	00113$
      000100                        407 00109$:
                                    408 ;	cooperative.c:208: else if ((ValidBitMap & 0b1000) == 0b0000) {
      000100 E5 34            [12]  409 	mov	a,_ValidBitMap
      000102 20 E3 0D         [24]  410 	jb	acc.3,00106$
                                    411 ;	cooperative.c:209: newThreadID = '2';
      000105 75 3C 32         [24]  412 	mov	_newThreadID,#0x32
                                    413 ;	cooperative.c:210: ValidBitMap |= 0b0100;
      000108 43 34 04         [24]  414 	orl	_ValidBitMap,#0x04
      00010B E5 35            [12]  415 	mov	a,(_ValidBitMap + 1)
                                    416 ;	cooperative.c:211: newSP =  Pointer[2];
      00010D 85 32 23         [24]  417 	mov	_newSP,(_Pointer + 0x0002)
      000110 80 10            [24]  418 	sjmp	00113$
      000112                        419 00106$:
                                    420 ;	cooperative.c:213: else if ((ValidBitMap & 0b1000) == 0b0000) {
      000112 E5 34            [12]  421 	mov	a,_ValidBitMap
      000114 20 E3 0B         [24]  422 	jb	acc.3,00113$
                                    423 ;	cooperative.c:214: newThreadID = '3';
      000117 75 3C 33         [24]  424 	mov	_newThreadID,#0x33
                                    425 ;	cooperative.c:215: ValidBitMap |= 0b1000;
      00011A 43 34 08         [24]  426 	orl	_ValidBitMap,#0x08
      00011D E5 35            [12]  427 	mov	a,(_ValidBitMap + 1)
                                    428 ;	cooperative.c:216: newSP =  Pointer[3];
      00011F 85 33 23         [24]  429 	mov	_newSP,(_Pointer + 0x0003)
      000122                        430 00113$:
                                    431 ;	cooperative.c:229: __endasm;
      000122 85 81 22         [24]  432 	MOV	0x22, SP
      000125 85 23 81         [24]  433 	MOV	SP, 0x23
      000128 C0 82            [24]  434 	PUSH	DPL
      00012A C0 83            [24]  435 	PUSH	DPH
      00012C E5 00            [12]  436 	MOV	A, 0x00
      00012E C0 E0            [24]  437 	PUSH	A
      000130 C0 E0            [24]  438 	PUSH	A
      000132 C0 E0            [24]  439 	PUSH	A
      000134 C0 E0            [24]  440 	PUSH	A
                                    441 ;	cooperative.c:231: switch (newThreadID) {
      000136 AF 3C            [24]  442 	mov	r7,_newThreadID
      000138 BF 30 02         [24]  443 	cjne	r7,#0x30,00182$
      00013B 80 0F            [24]  444 	sjmp	00114$
      00013D                        445 00182$:
      00013D BF 31 02         [24]  446 	cjne	r7,#0x31,00183$
      000140 80 14            [24]  447 	sjmp	00115$
      000142                        448 00183$:
      000142 BF 32 02         [24]  449 	cjne	r7,#0x32,00184$
      000145 80 19            [24]  450 	sjmp	00116$
      000147                        451 00184$:
                                    452 ;	cooperative.c:232: case '0':
      000147 BF 33 28         [24]  453 	cjne	r7,#0x33,00119$
      00014A 80 1E            [24]  454 	sjmp	00117$
      00014C                        455 00114$:
                                    456 ;	cooperative.c:233: PSW = 0b00000000;               
      00014C 75 D0 00         [24]  457 	mov	_PSW,#0x00
                                    458 ;	cooperative.c:237: __endasm;
      00014F C0 D0            [24]  459 	PUSH	PSW
      000151 85 81 30         [24]  460 	MOV	0x30, SP
                                    461 ;	cooperative.c:238: break;
                                    462 ;	cooperative.c:239: case '1':
      000154 80 1C            [24]  463 	sjmp	00119$
      000156                        464 00115$:
                                    465 ;	cooperative.c:240: PSW = 0b00001000;
      000156 75 D0 08         [24]  466 	mov	_PSW,#0x08
                                    467 ;	cooperative.c:244: __endasm;
      000159 C0 D0            [24]  468 	PUSH	PSW
      00015B 85 81 31         [24]  469 	MOV	0x31, SP
                                    470 ;	cooperative.c:245: break;
                                    471 ;	cooperative.c:246: case '2':
      00015E 80 12            [24]  472 	sjmp	00119$
      000160                        473 00116$:
                                    474 ;	cooperative.c:247: PSW = 0b00010000;
      000160 75 D0 10         [24]  475 	mov	_PSW,#0x10
                                    476 ;	cooperative.c:251: __endasm;
      000163 C0 D0            [24]  477 	PUSH	PSW
      000165 85 81 32         [24]  478 	MOV	0x32, SP
                                    479 ;	cooperative.c:252: break;
                                    480 ;	cooperative.c:253: case '3':
      000168 80 08            [24]  481 	sjmp	00119$
      00016A                        482 00117$:
                                    483 ;	cooperative.c:254: PSW = 0b00011000;
      00016A 75 D0 18         [24]  484 	mov	_PSW,#0x18
                                    485 ;	cooperative.c:258: __endasm;
      00016D C0 D0            [24]  486 	PUSH	PSW
      00016F 85 81 33         [24]  487 	MOV	0x33, SP
                                    488 ;	cooperative.c:262: }
      000172                        489 00119$:
                                    490 ;	cooperative.c:264: SP = tempSP;
      000172 85 22 81         [24]  491 	mov	_SP,_tempSP
                                    492 ;	cooperative.c:266: return newThreadID;
      000175 85 3C 82         [24]  493 	mov	dpl, _newThreadID
                                    494 ;	cooperative.c:267: }
      000178 22               [24]  495 	ret
                                    496 ;------------------------------------------------------------
                                    497 ;Allocation info for local variables in function 'ThreadYield'
                                    498 ;------------------------------------------------------------
                                    499 ;	cooperative.c:276: void ThreadYield(void)
                                    500 ;	-----------------------------------------
                                    501 ;	 function ThreadYield
                                    502 ;	-----------------------------------------
      000179                        503 _ThreadYield:
                                    504 ;	cooperative.c:278: SAVESTATE;
      000179 C0 E0            [24]  505 	PUSH ACC 
      00017B C0 F0            [24]  506 	PUSH B 
      00017D C0 82            [24]  507 	PUSH DPL 
      00017F C0 83            [24]  508 	PUSH DPH 
      000181 C0 D0            [24]  509 	PUSH PSW 
      000183 AF 21            [24]  510 	mov	r7,_curThreadID
      000185 BF 30 02         [24]  511 	cjne	r7,#0x30,00235$
      000188 80 0F            [24]  512 	sjmp	00101$
      00018A                        513 00235$:
      00018A BF 31 02         [24]  514 	cjne	r7,#0x31,00236$
      00018D 80 0F            [24]  515 	sjmp	00102$
      00018F                        516 00236$:
      00018F BF 32 02         [24]  517 	cjne	r7,#0x32,00237$
      000192 80 0F            [24]  518 	sjmp	00103$
      000194                        519 00237$:
      000194 BF 33 14         [24]  520 	cjne	r7,#0x33,00120$
      000197 80 0F            [24]  521 	sjmp	00104$
      000199                        522 00101$:
      000199 85 81 30         [24]  523 	MOV 0x30, SP 
      00019C 80 0D            [24]  524 	sjmp	00120$
      00019E                        525 00102$:
      00019E 85 81 31         [24]  526 	MOV 0x31, SP 
      0001A1 80 08            [24]  527 	sjmp	00120$
      0001A3                        528 00103$:
      0001A3 85 81 32         [24]  529 	MOV 0x32, SP 
      0001A6 80 03            [24]  530 	sjmp	00120$
      0001A8                        531 00104$:
      0001A8 85 81 33         [24]  532 	MOV 0x33, SP 
                                    533 ;	cooperative.c:279: do
      0001AB                        534 00120$:
                                    535 ;	cooperative.c:291: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
      0001AB 74 33            [12]  536 	mov	a,#0x33
      0001AD B5 21 04         [24]  537 	cjne	a,_curThreadID,00131$
      0001B0 7E 30            [12]  538 	mov	r6,#0x30
      0001B2 80 08            [24]  539 	sjmp	00132$
      0001B4                        540 00131$:
      0001B4 AD 21            [24]  541 	mov	r5,_curThreadID
      0001B6 0D               [12]  542 	inc	r5
      0001B7 ED               [12]  543 	mov	a,r5
      0001B8 FE               [12]  544 	mov	r6,a
      0001B9 33               [12]  545 	rlc	a
      0001BA 95 E0            [12]  546 	subb	a,acc
      0001BC                        547 00132$:
      0001BC 8E 21            [24]  548 	mov	_curThreadID,r6
                                    549 ;	cooperative.c:294: switch (curThreadID) {
      0001BE AF 21            [24]  550 	mov	r7,_curThreadID
      0001C0 BF 30 02         [24]  551 	cjne	r7,#0x30,00241$
      0001C3 80 0F            [24]  552 	sjmp	00107$
      0001C5                        553 00241$:
      0001C5 BF 31 02         [24]  554 	cjne	r7,#0x31,00242$
      0001C8 80 1B            [24]  555 	sjmp	00110$
      0001CA                        556 00242$:
      0001CA BF 32 02         [24]  557 	cjne	r7,#0x32,00243$
      0001CD 80 27            [24]  558 	sjmp	00113$
      0001CF                        559 00243$:
                                    560 ;	cooperative.c:295: case '0':
      0001CF BF 33 49         [24]  561 	cjne	r7,#0x33,00122$
      0001D2 80 33            [24]  562 	sjmp	00116$
      0001D4                        563 00107$:
                                    564 ;	cooperative.c:296: if ((ValidBitMap & 0b0001) == 0b0001) {
      0001D4 74 01            [12]  565 	mov	a,#0x01
      0001D6 55 34            [12]  566 	anl	a,_ValidBitMap
      0001D8 FE               [12]  567 	mov	r6,a
      0001D9 E5 35            [12]  568 	mov	a,(_ValidBitMap + 1)
      0001DB 7F 00            [12]  569 	mov	r7,#0x00
      0001DD BE 01 CB         [24]  570 	cjne	r6,#0x01,00120$
      0001E0 BF 00 C8         [24]  571 	cjne	r7,#0x00,00120$
                                    572 ;	cooperative.c:297: break; // Exit loop if thread 0 is runnable
                                    573 ;	cooperative.c:300: case '1':
      0001E3 80 36            [24]  574 	sjmp	00122$
      0001E5                        575 00110$:
                                    576 ;	cooperative.c:301: if ((ValidBitMap & 0b0010) == 0b0010) {
      0001E5 74 02            [12]  577 	mov	a,#0x02
      0001E7 55 34            [12]  578 	anl	a,_ValidBitMap
      0001E9 FE               [12]  579 	mov	r6,a
      0001EA E5 35            [12]  580 	mov	a,(_ValidBitMap + 1)
      0001EC 7F 00            [12]  581 	mov	r7,#0x00
      0001EE BE 02 BA         [24]  582 	cjne	r6,#0x02,00120$
      0001F1 BF 00 B7         [24]  583 	cjne	r7,#0x00,00120$
                                    584 ;	cooperative.c:302: break; // Exit loop if thread 1 is runnable
                                    585 ;	cooperative.c:305: case '2':
      0001F4 80 25            [24]  586 	sjmp	00122$
      0001F6                        587 00113$:
                                    588 ;	cooperative.c:306: if ((ValidBitMap & 0b0100) == 0b0100) {
      0001F6 74 04            [12]  589 	mov	a,#0x04
      0001F8 55 34            [12]  590 	anl	a,_ValidBitMap
      0001FA FE               [12]  591 	mov	r6,a
      0001FB E5 35            [12]  592 	mov	a,(_ValidBitMap + 1)
      0001FD 7F 00            [12]  593 	mov	r7,#0x00
      0001FF BE 04 A9         [24]  594 	cjne	r6,#0x04,00120$
      000202 BF 00 A6         [24]  595 	cjne	r7,#0x00,00120$
                                    596 ;	cooperative.c:307: break; // Exit loop if thread 2 is runnable
                                    597 ;	cooperative.c:310: case '3':
      000205 80 14            [24]  598 	sjmp	00122$
      000207                        599 00116$:
                                    600 ;	cooperative.c:311: if ((ValidBitMap & 0b1000) == 0b1000) {
      000207 74 08            [12]  601 	mov	a,#0x08
      000209 55 34            [12]  602 	anl	a,_ValidBitMap
      00020B FE               [12]  603 	mov	r6,a
      00020C E5 35            [12]  604 	mov	a,(_ValidBitMap + 1)
      00020E 7F 00            [12]  605 	mov	r7,#0x00
      000210 BE 08 05         [24]  606 	cjne	r6,#0x08,00251$
      000213 BF 00 02         [24]  607 	cjne	r7,#0x00,00251$
      000216 80 03            [24]  608 	sjmp	00252$
      000218                        609 00251$:
      000218 02 01 AB         [24]  610 	ljmp	00120$
      00021B                        611 00252$:
                                    612 ;	cooperative.c:318: } while (1);
      00021B                        613 00122$:
                                    614 ;	cooperative.c:319: RESTORESTATE;
      00021B AF 21            [24]  615 	mov	r7,_curThreadID
      00021D BF 30 02         [24]  616 	cjne	r7,#0x30,00253$
      000220 80 0F            [24]  617 	sjmp	00123$
      000222                        618 00253$:
      000222 BF 31 02         [24]  619 	cjne	r7,#0x31,00254$
      000225 80 0F            [24]  620 	sjmp	00124$
      000227                        621 00254$:
      000227 BF 32 02         [24]  622 	cjne	r7,#0x32,00255$
      00022A 80 0F            [24]  623 	sjmp	00125$
      00022C                        624 00255$:
      00022C BF 33 14         [24]  625 	cjne	r7,#0x33,00128$
      00022F 80 0F            [24]  626 	sjmp	00126$
      000231                        627 00123$:
      000231 85 30 81         [24]  628 	mov	_SP,_Pointer
      000234 80 0D            [24]  629 	sjmp	00128$
      000236                        630 00124$:
      000236 85 31 81         [24]  631 	mov	_SP,(_Pointer + 0x0001)
      000239 80 08            [24]  632 	sjmp	00128$
      00023B                        633 00125$:
      00023B 85 32 81         [24]  634 	mov	_SP,(_Pointer + 0x0002)
      00023E 80 03            [24]  635 	sjmp	00128$
      000240                        636 00126$:
      000240 85 33 81         [24]  637 	mov	_SP,(_Pointer + 0x0003)
      000243                        638 00128$:
      000243 D0 D0            [24]  639 	POP PSW 
      000245 D0 83            [24]  640 	POP DPH 
      000247 D0 82            [24]  641 	POP DPL 
      000249 D0 F0            [24]  642 	POP B 
      00024B D0 E0            [24]  643 	POP ACC 
                                    644 ;	cooperative.c:320: }
      00024D 22               [24]  645 	ret
                                    646 ;------------------------------------------------------------
                                    647 ;Allocation info for local variables in function 'ThreadExit'
                                    648 ;------------------------------------------------------------
                                    649 ;	cooperative.c:327: void ThreadExit(void)
                                    650 ;	-----------------------------------------
                                    651 ;	 function ThreadExit
                                    652 ;	-----------------------------------------
      00024E                        653 _ThreadExit:
                                    654 ;	cooperative.c:335: switch (curThreadID) {
      00024E AF 21            [24]  655 	mov	r7,_curThreadID
      000250 BF 30 02         [24]  656 	cjne	r7,#0x30,00236$
      000253 80 0F            [24]  657 	sjmp	00101$
      000255                        658 00236$:
      000255 BF 31 02         [24]  659 	cjne	r7,#0x31,00237$
      000258 80 12            [24]  660 	sjmp	00102$
      00025A                        661 00237$:
      00025A BF 32 02         [24]  662 	cjne	r7,#0x32,00238$
      00025D 80 15            [24]  663 	sjmp	00103$
      00025F                        664 00238$:
                                    665 ;	cooperative.c:336: case '0':
      00025F BF 33 22         [24]  666 	cjne	r7,#0x33,00105$
      000262 80 18            [24]  667 	sjmp	00104$
      000264                        668 00101$:
                                    669 ;	cooperative.c:337: ValidBitMap &= 0b1110; // Clear bit 0
      000264 53 34 0E         [24]  670 	anl	_ValidBitMap,#0x0e
      000267 75 35 00         [24]  671 	mov	(_ValidBitMap + 1),#0x00
                                    672 ;	cooperative.c:338: break;
                                    673 ;	cooperative.c:339: case '1':
      00026A 80 19            [24]  674 	sjmp	00121$
      00026C                        675 00102$:
                                    676 ;	cooperative.c:340: ValidBitMap &= 0b1101; // Clear bit 1
      00026C 53 34 0D         [24]  677 	anl	_ValidBitMap,#0x0d
      00026F 75 35 00         [24]  678 	mov	(_ValidBitMap + 1),#0x00
                                    679 ;	cooperative.c:341: break;
                                    680 ;	cooperative.c:342: case '2':
      000272 80 11            [24]  681 	sjmp	00121$
      000274                        682 00103$:
                                    683 ;	cooperative.c:343: ValidBitMap &= 0b1011; // Clear bit 2
      000274 53 34 0B         [24]  684 	anl	_ValidBitMap,#0x0b
      000277 75 35 00         [24]  685 	mov	(_ValidBitMap + 1),#0x00
                                    686 ;	cooperative.c:344: break;
                                    687 ;	cooperative.c:345: case '3':
      00027A 80 09            [24]  688 	sjmp	00121$
      00027C                        689 00104$:
                                    690 ;	cooperative.c:346: ValidBitMap &= 0b0111; // Clear bit 3
      00027C 53 34 07         [24]  691 	anl	_ValidBitMap,#0x07
      00027F 75 35 00         [24]  692 	mov	(_ValidBitMap + 1),#0x00
                                    693 ;	cooperative.c:347: break;
                                    694 ;	cooperative.c:348: default:
      000282 80 01            [24]  695 	sjmp	00121$
      000284                        696 00105$:
                                    697 ;	cooperative.c:349: return;
      000284 22               [24]  698 	ret
                                    699 ;	cooperative.c:352: do {
      000285                        700 00121$:
                                    701 ;	cooperative.c:353: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
      000285 74 33            [12]  702 	mov	a,#0x33
      000287 B5 21 04         [24]  703 	cjne	a,_curThreadID,00132$
      00028A 7E 30            [12]  704 	mov	r6,#0x30
      00028C 80 08            [24]  705 	sjmp	00133$
      00028E                        706 00132$:
      00028E AD 21            [24]  707 	mov	r5,_curThreadID
      000290 0D               [12]  708 	inc	r5
      000291 ED               [12]  709 	mov	a,r5
      000292 FE               [12]  710 	mov	r6,a
      000293 33               [12]  711 	rlc	a
      000294 95 E0            [12]  712 	subb	a,acc
      000296                        713 00133$:
      000296 8E 21            [24]  714 	mov	_curThreadID,r6
                                    715 ;	cooperative.c:355: switch (curThreadID) {
      000298 AF 21            [24]  716 	mov	r7,_curThreadID
      00029A BF 30 02         [24]  717 	cjne	r7,#0x30,00242$
      00029D 80 0F            [24]  718 	sjmp	00107$
      00029F                        719 00242$:
      00029F BF 31 02         [24]  720 	cjne	r7,#0x31,00243$
      0002A2 80 1B            [24]  721 	sjmp	00110$
      0002A4                        722 00243$:
      0002A4 BF 32 02         [24]  723 	cjne	r7,#0x32,00244$
      0002A7 80 27            [24]  724 	sjmp	00113$
      0002A9                        725 00244$:
                                    726 ;	cooperative.c:356: case '0':
      0002A9 BF 33 49         [24]  727 	cjne	r7,#0x33,00123$
      0002AC 80 33            [24]  728 	sjmp	00116$
      0002AE                        729 00107$:
                                    730 ;	cooperative.c:357: if ((ValidBitMap & 0b0001) == 0b0001) {
      0002AE 74 01            [12]  731 	mov	a,#0x01
      0002B0 55 34            [12]  732 	anl	a,_ValidBitMap
      0002B2 FE               [12]  733 	mov	r6,a
      0002B3 E5 35            [12]  734 	mov	a,(_ValidBitMap + 1)
      0002B5 7F 00            [12]  735 	mov	r7,#0x00
      0002B7 BE 01 CB         [24]  736 	cjne	r6,#0x01,00121$
      0002BA BF 00 C8         [24]  737 	cjne	r7,#0x00,00121$
                                    738 ;	cooperative.c:358: break; // Exit loop if thread 0 is valid
                                    739 ;	cooperative.c:361: case '1':
      0002BD 80 36            [24]  740 	sjmp	00123$
      0002BF                        741 00110$:
                                    742 ;	cooperative.c:362: if ((ValidBitMap & 0b0010) == 0b0010) {
      0002BF 74 02            [12]  743 	mov	a,#0x02
      0002C1 55 34            [12]  744 	anl	a,_ValidBitMap
      0002C3 FE               [12]  745 	mov	r6,a
      0002C4 E5 35            [12]  746 	mov	a,(_ValidBitMap + 1)
      0002C6 7F 00            [12]  747 	mov	r7,#0x00
      0002C8 BE 02 BA         [24]  748 	cjne	r6,#0x02,00121$
      0002CB BF 00 B7         [24]  749 	cjne	r7,#0x00,00121$
                                    750 ;	cooperative.c:363: break; // Exit loop if thread 1 is valid
                                    751 ;	cooperative.c:366: case '2':
      0002CE 80 25            [24]  752 	sjmp	00123$
      0002D0                        753 00113$:
                                    754 ;	cooperative.c:367: if ((ValidBitMap & 0b0100) == 0b0100) {
      0002D0 74 04            [12]  755 	mov	a,#0x04
      0002D2 55 34            [12]  756 	anl	a,_ValidBitMap
      0002D4 FE               [12]  757 	mov	r6,a
      0002D5 E5 35            [12]  758 	mov	a,(_ValidBitMap + 1)
      0002D7 7F 00            [12]  759 	mov	r7,#0x00
      0002D9 BE 04 A9         [24]  760 	cjne	r6,#0x04,00121$
      0002DC BF 00 A6         [24]  761 	cjne	r7,#0x00,00121$
                                    762 ;	cooperative.c:368: break; // Exit loop if thread 2 is valid
                                    763 ;	cooperative.c:371: case '3':
      0002DF 80 14            [24]  764 	sjmp	00123$
      0002E1                        765 00116$:
                                    766 ;	cooperative.c:372: if ((ValidBitMap & 0b1000) == 0b1000) {
      0002E1 74 08            [12]  767 	mov	a,#0x08
      0002E3 55 34            [12]  768 	anl	a,_ValidBitMap
      0002E5 FE               [12]  769 	mov	r6,a
      0002E6 E5 35            [12]  770 	mov	a,(_ValidBitMap + 1)
      0002E8 7F 00            [12]  771 	mov	r7,#0x00
      0002EA BE 08 05         [24]  772 	cjne	r6,#0x08,00252$
      0002ED BF 00 02         [24]  773 	cjne	r7,#0x00,00252$
      0002F0 80 03            [24]  774 	sjmp	00253$
      0002F2                        775 00252$:
      0002F2 02 02 85         [24]  776 	ljmp	00121$
      0002F5                        777 00253$:
                                    778 ;	cooperative.c:380: } while (1);
      0002F5                        779 00123$:
                                    780 ;	cooperative.c:382: RESTORESTATE;
      0002F5 AF 21            [24]  781 	mov	r7,_curThreadID
      0002F7 BF 30 02         [24]  782 	cjne	r7,#0x30,00254$
      0002FA 80 0F            [24]  783 	sjmp	00124$
      0002FC                        784 00254$:
      0002FC BF 31 02         [24]  785 	cjne	r7,#0x31,00255$
      0002FF 80 0F            [24]  786 	sjmp	00125$
      000301                        787 00255$:
      000301 BF 32 02         [24]  788 	cjne	r7,#0x32,00256$
      000304 80 0F            [24]  789 	sjmp	00126$
      000306                        790 00256$:
      000306 BF 33 14         [24]  791 	cjne	r7,#0x33,00129$
      000309 80 0F            [24]  792 	sjmp	00127$
      00030B                        793 00124$:
      00030B 85 30 81         [24]  794 	mov	_SP,_Pointer
      00030E 80 0D            [24]  795 	sjmp	00129$
      000310                        796 00125$:
      000310 85 31 81         [24]  797 	mov	_SP,(_Pointer + 0x0001)
      000313 80 08            [24]  798 	sjmp	00129$
      000315                        799 00126$:
      000315 85 32 81         [24]  800 	mov	_SP,(_Pointer + 0x0002)
      000318 80 03            [24]  801 	sjmp	00129$
      00031A                        802 00127$:
      00031A 85 33 81         [24]  803 	mov	_SP,(_Pointer + 0x0003)
      00031D                        804 00129$:
      00031D D0 D0            [24]  805 	POP PSW 
      00031F D0 83            [24]  806 	POP DPH 
      000321 D0 82            [24]  807 	POP DPL 
      000323 D0 F0            [24]  808 	POP B 
      000325 D0 E0            [24]  809 	POP ACC 
                                    810 ;	cooperative.c:383: }
      000327 22               [24]  811 	ret
                                    812 	.area CSEG    (CODE)
                                    813 	.area CONST   (CODE)
                                    814 	.area XINIT   (CODE)
                                    815 	.area CABS    (ABS,CODE)
