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
                                    110 	.globl _ProductionFlag
                                    111 	.globl _newSP
                                    112 	.globl _tempSP
                                    113 	.globl _curThreadID
                                    114 	.globl _ValidBitMap
                                    115 	.globl _ProdThreadID
                                    116 	.globl _newThreadID
                                    117 	.globl _Pointer
                                    118 	.globl _ThreadCreate
                                    119 	.globl _ThreadYield
                                    120 	.globl _ThreadExit
                                    121 ;--------------------------------------------------------
                                    122 ; special function registers
                                    123 ;--------------------------------------------------------
                                    124 	.area RSEG    (ABS,DATA)
      000000                        125 	.org 0x0000
                           000080   126 _P0	=	0x0080
                           000081   127 _SP	=	0x0081
                           000082   128 _DPL	=	0x0082
                           000083   129 _DPH	=	0x0083
                           000087   130 _PCON	=	0x0087
                           000088   131 _TCON	=	0x0088
                           000089   132 _TMOD	=	0x0089
                           00008A   133 _TL0	=	0x008a
                           00008B   134 _TL1	=	0x008b
                           00008C   135 _TH0	=	0x008c
                           00008D   136 _TH1	=	0x008d
                           000090   137 _P1	=	0x0090
                           000098   138 _SCON	=	0x0098
                           000099   139 _SBUF	=	0x0099
                           0000A0   140 _P2	=	0x00a0
                           0000A8   141 _IE	=	0x00a8
                           0000B0   142 _P3	=	0x00b0
                           0000B8   143 _IP	=	0x00b8
                           0000D0   144 _PSW	=	0x00d0
                           0000E0   145 _ACC	=	0x00e0
                           0000F0   146 _B	=	0x00f0
                                    147 ;--------------------------------------------------------
                                    148 ; special function bits
                                    149 ;--------------------------------------------------------
                                    150 	.area RSEG    (ABS,DATA)
      000000                        151 	.org 0x0000
                           000080   152 _P0_0	=	0x0080
                           000081   153 _P0_1	=	0x0081
                           000082   154 _P0_2	=	0x0082
                           000083   155 _P0_3	=	0x0083
                           000084   156 _P0_4	=	0x0084
                           000085   157 _P0_5	=	0x0085
                           000086   158 _P0_6	=	0x0086
                           000087   159 _P0_7	=	0x0087
                           000088   160 _IT0	=	0x0088
                           000089   161 _IE0	=	0x0089
                           00008A   162 _IT1	=	0x008a
                           00008B   163 _IE1	=	0x008b
                           00008C   164 _TR0	=	0x008c
                           00008D   165 _TF0	=	0x008d
                           00008E   166 _TR1	=	0x008e
                           00008F   167 _TF1	=	0x008f
                           000090   168 _P1_0	=	0x0090
                           000091   169 _P1_1	=	0x0091
                           000092   170 _P1_2	=	0x0092
                           000093   171 _P1_3	=	0x0093
                           000094   172 _P1_4	=	0x0094
                           000095   173 _P1_5	=	0x0095
                           000096   174 _P1_6	=	0x0096
                           000097   175 _P1_7	=	0x0097
                           000098   176 _RI	=	0x0098
                           000099   177 _TI	=	0x0099
                           00009A   178 _RB8	=	0x009a
                           00009B   179 _TB8	=	0x009b
                           00009C   180 _REN	=	0x009c
                           00009D   181 _SM2	=	0x009d
                           00009E   182 _SM1	=	0x009e
                           00009F   183 _SM0	=	0x009f
                           0000A0   184 _P2_0	=	0x00a0
                           0000A1   185 _P2_1	=	0x00a1
                           0000A2   186 _P2_2	=	0x00a2
                           0000A3   187 _P2_3	=	0x00a3
                           0000A4   188 _P2_4	=	0x00a4
                           0000A5   189 _P2_5	=	0x00a5
                           0000A6   190 _P2_6	=	0x00a6
                           0000A7   191 _P2_7	=	0x00a7
                           0000A8   192 _EX0	=	0x00a8
                           0000A9   193 _ET0	=	0x00a9
                           0000AA   194 _EX1	=	0x00aa
                           0000AB   195 _ET1	=	0x00ab
                           0000AC   196 _ES	=	0x00ac
                           0000AF   197 _EA	=	0x00af
                           0000B0   198 _P3_0	=	0x00b0
                           0000B1   199 _P3_1	=	0x00b1
                           0000B2   200 _P3_2	=	0x00b2
                           0000B3   201 _P3_3	=	0x00b3
                           0000B4   202 _P3_4	=	0x00b4
                           0000B5   203 _P3_5	=	0x00b5
                           0000B6   204 _P3_6	=	0x00b6
                           0000B7   205 _P3_7	=	0x00b7
                           0000B0   206 _RXD	=	0x00b0
                           0000B1   207 _TXD	=	0x00b1
                           0000B2   208 _INT0	=	0x00b2
                           0000B3   209 _INT1	=	0x00b3
                           0000B4   210 _T0	=	0x00b4
                           0000B5   211 _T1	=	0x00b5
                           0000B6   212 _WR	=	0x00b6
                           0000B7   213 _RD	=	0x00b7
                           0000B8   214 _PX0	=	0x00b8
                           0000B9   215 _PT0	=	0x00b9
                           0000BA   216 _PX1	=	0x00ba
                           0000BB   217 _PT1	=	0x00bb
                           0000BC   218 _PS	=	0x00bc
                           0000D0   219 _P	=	0x00d0
                           0000D1   220 _F1	=	0x00d1
                           0000D2   221 _OV	=	0x00d2
                           0000D3   222 _RS0	=	0x00d3
                           0000D4   223 _RS1	=	0x00d4
                           0000D5   224 _F0	=	0x00d5
                           0000D6   225 _AC	=	0x00d6
                           0000D7   226 _CY	=	0x00d7
                                    227 ;--------------------------------------------------------
                                    228 ; overlayable register banks
                                    229 ;--------------------------------------------------------
                                    230 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        231 	.ds 8
                                    232 ;--------------------------------------------------------
                                    233 ; internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area DSEG    (DATA)
                           000030   236 _Pointer	=	0x0030
                           00003C   237 _newThreadID	=	0x003c
                           000028   238 _ProdThreadID	=	0x0028
                           000034   239 _ValidBitMap	=	0x0034
                           000021   240 _curThreadID	=	0x0021
                           000022   241 _tempSP	=	0x0022
                           000023   242 _newSP	=	0x0023
                           000024   243 _ProductionFlag	=	0x0024
                                    244 ;--------------------------------------------------------
                                    245 ; overlayable items in internal ram
                                    246 ;--------------------------------------------------------
                                    247 	.area	OSEG    (OVR,DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; indirectly addressable internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area ISEG    (DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; absolute internal ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area IABS    (ABS,DATA)
                                    256 	.area IABS    (ABS,DATA)
                                    257 ;--------------------------------------------------------
                                    258 ; bit data
                                    259 ;--------------------------------------------------------
                                    260 	.area BSEG    (BIT)
                                    261 ;--------------------------------------------------------
                                    262 ; paged external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area PSEG    (PAG,XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; uninitialized external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XSEG    (XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; absolute external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XABS    (ABS,XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; initialized external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XISEG   (XDATA)
                                    277 	.area HOME    (CODE)
                                    278 	.area GSINIT0 (CODE)
                                    279 	.area GSINIT1 (CODE)
                                    280 	.area GSINIT2 (CODE)
                                    281 	.area GSINIT3 (CODE)
                                    282 	.area GSINIT4 (CODE)
                                    283 	.area GSINIT5 (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area CSEG    (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; global & static initialisations
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 	.area GSFINAL (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; Home
                                    296 ;--------------------------------------------------------
                                    297 	.area HOME    (CODE)
                                    298 	.area HOME    (CODE)
                                    299 ;--------------------------------------------------------
                                    300 ; code
                                    301 ;--------------------------------------------------------
                                    302 	.area CSEG    (CODE)
                                    303 ;------------------------------------------------------------
                                    304 ;Allocation info for local variables in function 'Bootstrap'
                                    305 ;------------------------------------------------------------
                                    306 ;	preemptive.c:120: void Bootstrap(void)
                                    307 ;	-----------------------------------------
                                    308 ;	 function Bootstrap
                                    309 ;	-----------------------------------------
      00014E                        310 _Bootstrap:
                           000007   311 	ar7 = 0x07
                           000006   312 	ar6 = 0x06
                           000005   313 	ar5 = 0x05
                           000004   314 	ar4 = 0x04
                           000003   315 	ar3 = 0x03
                           000002   316 	ar2 = 0x02
                           000001   317 	ar1 = 0x01
                           000000   318 	ar0 = 0x00
                                    319 ;	preemptive.c:135: ValidBitMap = 0b0000;
      00014E E4               [12]  320 	clr	a
      00014F F5 34            [12]  321 	mov	_ValidBitMap,a
      000151 F5 35            [12]  322 	mov	(_ValidBitMap + 1),a
                                    323 ;	preemptive.c:136: Pointer[0] = 0x3F;
      000153 75 30 3F         [24]  324 	mov	_Pointer,#0x3f
                                    325 ;	preemptive.c:137: Pointer[1] = 0x4F;
      000156 75 31 4F         [24]  326 	mov	(_Pointer + 0x0001),#0x4f
                                    327 ;	preemptive.c:138: Pointer[2] = 0x5F;
      000159 75 32 5F         [24]  328 	mov	(_Pointer + 0x0002),#0x5f
                                    329 ;	preemptive.c:139: Pointer[3] = 0x6F;
      00015C 75 33 6F         [24]  330 	mov	(_Pointer + 0x0003),#0x6f
                                    331 ;	preemptive.c:140: TMOD = 0; //timer zero
      00015F F5 89            [12]  332 	mov	_TMOD,a
                                    333 ;	preemptive.c:141: IE = 0x82; 
      000161 75 A8 82         [24]  334 	mov	_IE,#0x82
                                    335 ;	preemptive.c:142: TR0 = 1;
                                    336 ;	assignBit
      000164 D2 8C            [12]  337 	setb	_TR0
                                    338 ;	preemptive.c:143: ProdThreadID = '1';
      000166 75 28 31         [24]  339 	mov	_ProdThreadID,#0x31
                                    340 ;	preemptive.c:144: curThreadID = ThreadCreate(main);
      000169 90 01 01         [24]  341 	mov	dptr,#_main
      00016C 12 01 A5         [24]  342 	lcall	_ThreadCreate
      00016F 85 82 21         [24]  343 	mov	_curThreadID,dpl
                                    344 ;	preemptive.c:145: RESTORESTATE;
      000172 AF 21            [24]  345 	mov	r7,_curThreadID
      000174 BF 30 02         [24]  346 	cjne	r7,#0x30,00133$
      000177 80 0F            [24]  347 	sjmp	00101$
      000179                        348 00133$:
      000179 BF 31 02         [24]  349 	cjne	r7,#0x31,00134$
      00017C 80 0F            [24]  350 	sjmp	00102$
      00017E                        351 00134$:
      00017E BF 32 02         [24]  352 	cjne	r7,#0x32,00135$
      000181 80 0F            [24]  353 	sjmp	00103$
      000183                        354 00135$:
      000183 BF 33 14         [24]  355 	cjne	r7,#0x33,00106$
      000186 80 0F            [24]  356 	sjmp	00104$
      000188                        357 00101$:
      000188 85 30 81         [24]  358 	mov	_SP,_Pointer
      00018B 80 0D            [24]  359 	sjmp	00106$
      00018D                        360 00102$:
      00018D 85 31 81         [24]  361 	mov	_SP,(_Pointer + 0x0001)
      000190 80 08            [24]  362 	sjmp	00106$
      000192                        363 00103$:
      000192 85 32 81         [24]  364 	mov	_SP,(_Pointer + 0x0002)
      000195 80 03            [24]  365 	sjmp	00106$
      000197                        366 00104$:
      000197 85 33 81         [24]  367 	mov	_SP,(_Pointer + 0x0003)
      00019A                        368 00106$:
      00019A D0 D0            [24]  369 	POP PSW 
      00019C D0 83            [24]  370 	POP DPH 
      00019E D0 82            [24]  371 	POP DPL 
      0001A0 D0 F0            [24]  372 	POP B 
      0001A2 D0 E0            [24]  373 	POP ACC 
                                    374 ;	preemptive.c:146: }
      0001A4 22               [24]  375 	ret
                                    376 ;------------------------------------------------------------
                                    377 ;Allocation info for local variables in function 'ThreadCreate'
                                    378 ;------------------------------------------------------------
                                    379 ;fp                        Allocated to registers 
                                    380 ;------------------------------------------------------------
                                    381 ;	preemptive.c:154: ThreadID ThreadCreate(FunctionPtr fp)
                                    382 ;	-----------------------------------------
                                    383 ;	 function ThreadCreate
                                    384 ;	-----------------------------------------
      0001A5                        385 _ThreadCreate:
                                    386 ;	preemptive.c:201: EA = 0;
                                    387 ;	assignBit
      0001A5 C2 AF            [12]  388 	clr	_EA
                                    389 ;	preemptive.c:203: if ((ValidBitMap & 0b1111) == 0b1111) {
      0001A7 74 0F            [12]  390 	mov	a,#0x0f
      0001A9 55 34            [12]  391 	anl	a,_ValidBitMap
      0001AB FE               [12]  392 	mov	r6,a
      0001AC E5 35            [12]  393 	mov	a,(_ValidBitMap + 1)
      0001AE 7F 00            [12]  394 	mov	r7,#0x00
      0001B0 BE 0F 07         [24]  395 	cjne	r6,#0x0f,00102$
      0001B3 BF 00 04         [24]  396 	cjne	r7,#0x00,00102$
                                    397 ;	preemptive.c:204: return -1;
      0001B6 75 82 FF         [24]  398 	mov	dpl, #0xff
      0001B9 22               [24]  399 	ret
      0001BA                        400 00102$:
                                    401 ;	preemptive.c:207: if ((ValidBitMap & 0b0001) == 0b0000) {
      0001BA E5 34            [12]  402 	mov	a,_ValidBitMap
      0001BC 20 E0 0D         [24]  403 	jb	acc.0,00112$
                                    404 ;	preemptive.c:208: newThreadID = '0';
      0001BF 75 3C 30         [24]  405 	mov	_newThreadID,#0x30
                                    406 ;	preemptive.c:209: ValidBitMap |= 0b0001;
      0001C2 43 34 01         [24]  407 	orl	_ValidBitMap,#0x01
      0001C5 E5 35            [12]  408 	mov	a,(_ValidBitMap + 1)
                                    409 ;	preemptive.c:210: newSP =  Pointer[0];
      0001C7 85 30 23         [24]  410 	mov	_newSP,_Pointer
      0001CA 80 34            [24]  411 	sjmp	00113$
      0001CC                        412 00112$:
                                    413 ;	preemptive.c:212: else if ((ValidBitMap & 0b0010) == 0b0000) {
      0001CC E5 34            [12]  414 	mov	a,_ValidBitMap
      0001CE 20 E1 0D         [24]  415 	jb	acc.1,00109$
                                    416 ;	preemptive.c:213: newThreadID = '1';
      0001D1 75 3C 31         [24]  417 	mov	_newThreadID,#0x31
                                    418 ;	preemptive.c:214: ValidBitMap |= 0b0010;
      0001D4 43 34 02         [24]  419 	orl	_ValidBitMap,#0x02
      0001D7 E5 35            [12]  420 	mov	a,(_ValidBitMap + 1)
                                    421 ;	preemptive.c:215: newSP =  Pointer[1];
      0001D9 85 31 23         [24]  422 	mov	_newSP,(_Pointer + 0x0001)
      0001DC 80 22            [24]  423 	sjmp	00113$
      0001DE                        424 00109$:
                                    425 ;	preemptive.c:217: else if ((ValidBitMap & 0b1000) == 0b0000) {
      0001DE E5 34            [12]  426 	mov	a,_ValidBitMap
      0001E0 20 E3 0D         [24]  427 	jb	acc.3,00106$
                                    428 ;	preemptive.c:218: newThreadID = '2';
      0001E3 75 3C 32         [24]  429 	mov	_newThreadID,#0x32
                                    430 ;	preemptive.c:219: ValidBitMap |= 0b0100;
      0001E6 43 34 04         [24]  431 	orl	_ValidBitMap,#0x04
      0001E9 E5 35            [12]  432 	mov	a,(_ValidBitMap + 1)
                                    433 ;	preemptive.c:220: newSP =  Pointer[2];
      0001EB 85 32 23         [24]  434 	mov	_newSP,(_Pointer + 0x0002)
      0001EE 80 10            [24]  435 	sjmp	00113$
      0001F0                        436 00106$:
                                    437 ;	preemptive.c:222: else if ((ValidBitMap & 0b1000) == 0b0000) {
      0001F0 E5 34            [12]  438 	mov	a,_ValidBitMap
      0001F2 20 E3 0B         [24]  439 	jb	acc.3,00113$
                                    440 ;	preemptive.c:223: newThreadID = '3';
      0001F5 75 3C 33         [24]  441 	mov	_newThreadID,#0x33
                                    442 ;	preemptive.c:224: ValidBitMap |= 0b1000;
      0001F8 43 34 08         [24]  443 	orl	_ValidBitMap,#0x08
      0001FB E5 35            [12]  444 	mov	a,(_ValidBitMap + 1)
                                    445 ;	preemptive.c:225: newSP =  Pointer[3];
      0001FD 85 33 23         [24]  446 	mov	_newSP,(_Pointer + 0x0003)
      000200                        447 00113$:
                                    448 ;	preemptive.c:238: __endasm;
      000200 85 81 22         [24]  449 	MOV	0x22, SP
      000203 85 23 81         [24]  450 	MOV	SP, 0x23
      000206 C0 82            [24]  451 	PUSH	DPL
      000208 C0 83            [24]  452 	PUSH	DPH
      00020A E5 00            [12]  453 	MOV	A, 0x00
      00020C C0 E0            [24]  454 	PUSH	A
      00020E C0 E0            [24]  455 	PUSH	A
      000210 C0 E0            [24]  456 	PUSH	A
      000212 C0 E0            [24]  457 	PUSH	A
                                    458 ;	preemptive.c:240: switch (newThreadID) {
      000214 AF 3C            [24]  459 	mov	r7,_newThreadID
      000216 BF 30 02         [24]  460 	cjne	r7,#0x30,00182$
      000219 80 0F            [24]  461 	sjmp	00114$
      00021B                        462 00182$:
      00021B BF 31 02         [24]  463 	cjne	r7,#0x31,00183$
      00021E 80 14            [24]  464 	sjmp	00115$
      000220                        465 00183$:
      000220 BF 32 02         [24]  466 	cjne	r7,#0x32,00184$
      000223 80 19            [24]  467 	sjmp	00116$
      000225                        468 00184$:
                                    469 ;	preemptive.c:241: case '0':
      000225 BF 33 28         [24]  470 	cjne	r7,#0x33,00119$
      000228 80 1E            [24]  471 	sjmp	00117$
      00022A                        472 00114$:
                                    473 ;	preemptive.c:242: PSW = 0b00000000;               
      00022A 75 D0 00         [24]  474 	mov	_PSW,#0x00
                                    475 ;	preemptive.c:246: __endasm;
      00022D C0 D0            [24]  476 	PUSH	PSW
      00022F 85 81 30         [24]  477 	MOV	0x30, SP
                                    478 ;	preemptive.c:247: break;
                                    479 ;	preemptive.c:248: case '1':
      000232 80 1C            [24]  480 	sjmp	00119$
      000234                        481 00115$:
                                    482 ;	preemptive.c:249: PSW = 0b00001000;
      000234 75 D0 08         [24]  483 	mov	_PSW,#0x08
                                    484 ;	preemptive.c:253: __endasm;
      000237 C0 D0            [24]  485 	PUSH	PSW
      000239 85 81 31         [24]  486 	MOV	0x31, SP
                                    487 ;	preemptive.c:254: break;
                                    488 ;	preemptive.c:255: case '2':
      00023C 80 12            [24]  489 	sjmp	00119$
      00023E                        490 00116$:
                                    491 ;	preemptive.c:256: PSW = 0b00010000;
      00023E 75 D0 10         [24]  492 	mov	_PSW,#0x10
                                    493 ;	preemptive.c:260: __endasm;
      000241 C0 D0            [24]  494 	PUSH	PSW
      000243 85 81 32         [24]  495 	MOV	0x32, SP
                                    496 ;	preemptive.c:261: break;
                                    497 ;	preemptive.c:262: case '3':
      000246 80 08            [24]  498 	sjmp	00119$
      000248                        499 00117$:
                                    500 ;	preemptive.c:263: PSW = 0b00011000;
      000248 75 D0 18         [24]  501 	mov	_PSW,#0x18
                                    502 ;	preemptive.c:267: __endasm;
      00024B C0 D0            [24]  503 	PUSH	PSW
      00024D 85 81 33         [24]  504 	MOV	0x33, SP
                                    505 ;	preemptive.c:271: }
      000250                        506 00119$:
                                    507 ;	preemptive.c:273: SP = tempSP;
      000250 85 22 81         [24]  508 	mov	_SP,_tempSP
                                    509 ;	preemptive.c:275: EA = 1;
                                    510 ;	assignBit
      000253 D2 AF            [12]  511 	setb	_EA
                                    512 ;	preemptive.c:277: return newThreadID;
      000255 85 3C 82         [24]  513 	mov	dpl, _newThreadID
                                    514 ;	preemptive.c:278: }
      000258 22               [24]  515 	ret
                                    516 ;------------------------------------------------------------
                                    517 ;Allocation info for local variables in function 'ThreadYield'
                                    518 ;------------------------------------------------------------
                                    519 ;	preemptive.c:287: void ThreadYield(void)
                                    520 ;	-----------------------------------------
                                    521 ;	 function ThreadYield
                                    522 ;	-----------------------------------------
      000259                        523 _ThreadYield:
      000259 D3               [12]  524 	setb	c
      00025A 10 AF 01         [24]  525 	jbc	ea,00235$
      00025D C3               [12]  526 	clr	c
      00025E                        527 00235$:
      00025E C0 D0            [24]  528 	push	psw
                                    529 ;	preemptive.c:289: SAVESTATE;
      000260 C0 E0            [24]  530 	PUSH ACC 
      000262 C0 F0            [24]  531 	PUSH B 
      000264 C0 82            [24]  532 	PUSH DPL 
      000266 C0 83            [24]  533 	PUSH DPH 
      000268 C0 D0            [24]  534 	PUSH PSW 
      00026A AF 21            [24]  535 	mov	r7,_curThreadID
      00026C BF 30 02         [24]  536 	cjne	r7,#0x30,00236$
      00026F 80 0F            [24]  537 	sjmp	00101$
      000271                        538 00236$:
      000271 BF 31 02         [24]  539 	cjne	r7,#0x31,00237$
      000274 80 0F            [24]  540 	sjmp	00102$
      000276                        541 00237$:
      000276 BF 32 02         [24]  542 	cjne	r7,#0x32,00238$
      000279 80 0F            [24]  543 	sjmp	00103$
      00027B                        544 00238$:
      00027B BF 33 14         [24]  545 	cjne	r7,#0x33,00120$
      00027E 80 0F            [24]  546 	sjmp	00104$
      000280                        547 00101$:
      000280 85 81 30         [24]  548 	MOV 0x30, SP 
      000283 80 0D            [24]  549 	sjmp	00120$
      000285                        550 00102$:
      000285 85 81 31         [24]  551 	MOV 0x31, SP 
      000288 80 08            [24]  552 	sjmp	00120$
      00028A                        553 00103$:
      00028A 85 81 32         [24]  554 	MOV 0x32, SP 
      00028D 80 03            [24]  555 	sjmp	00120$
      00028F                        556 00104$:
      00028F 85 81 33         [24]  557 	MOV 0x33, SP 
                                    558 ;	preemptive.c:290: do
      000292                        559 00120$:
                                    560 ;	preemptive.c:302: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
      000292 74 33            [12]  561 	mov	a,#0x33
      000294 B5 21 04         [24]  562 	cjne	a,_curThreadID,00131$
      000297 7E 30            [12]  563 	mov	r6,#0x30
      000299 80 08            [24]  564 	sjmp	00132$
      00029B                        565 00131$:
      00029B AD 21            [24]  566 	mov	r5,_curThreadID
      00029D 0D               [12]  567 	inc	r5
      00029E ED               [12]  568 	mov	a,r5
      00029F FE               [12]  569 	mov	r6,a
      0002A0 33               [12]  570 	rlc	a
      0002A1 95 E0            [12]  571 	subb	a,acc
      0002A3                        572 00132$:
      0002A3 8E 21            [24]  573 	mov	_curThreadID,r6
                                    574 ;	preemptive.c:305: switch (curThreadID) {
      0002A5 AF 21            [24]  575 	mov	r7,_curThreadID
      0002A7 BF 30 02         [24]  576 	cjne	r7,#0x30,00242$
      0002AA 80 0F            [24]  577 	sjmp	00107$
      0002AC                        578 00242$:
      0002AC BF 31 02         [24]  579 	cjne	r7,#0x31,00243$
      0002AF 80 1B            [24]  580 	sjmp	00110$
      0002B1                        581 00243$:
      0002B1 BF 32 02         [24]  582 	cjne	r7,#0x32,00244$
      0002B4 80 27            [24]  583 	sjmp	00113$
      0002B6                        584 00244$:
                                    585 ;	preemptive.c:306: case '0':
      0002B6 BF 33 49         [24]  586 	cjne	r7,#0x33,00122$
      0002B9 80 33            [24]  587 	sjmp	00116$
      0002BB                        588 00107$:
                                    589 ;	preemptive.c:307: if ((ValidBitMap & 0b0001) == 0b0001) {
      0002BB 74 01            [12]  590 	mov	a,#0x01
      0002BD 55 34            [12]  591 	anl	a,_ValidBitMap
      0002BF FE               [12]  592 	mov	r6,a
      0002C0 E5 35            [12]  593 	mov	a,(_ValidBitMap + 1)
      0002C2 7F 00            [12]  594 	mov	r7,#0x00
      0002C4 BE 01 CB         [24]  595 	cjne	r6,#0x01,00120$
      0002C7 BF 00 C8         [24]  596 	cjne	r7,#0x00,00120$
                                    597 ;	preemptive.c:308: break; // Exit loop if thread 0 is runnable
                                    598 ;	preemptive.c:311: case '1':
      0002CA 80 36            [24]  599 	sjmp	00122$
      0002CC                        600 00110$:
                                    601 ;	preemptive.c:312: if ((ValidBitMap & 0b0010) == 0b0010) {
      0002CC 74 02            [12]  602 	mov	a,#0x02
      0002CE 55 34            [12]  603 	anl	a,_ValidBitMap
      0002D0 FE               [12]  604 	mov	r6,a
      0002D1 E5 35            [12]  605 	mov	a,(_ValidBitMap + 1)
      0002D3 7F 00            [12]  606 	mov	r7,#0x00
      0002D5 BE 02 BA         [24]  607 	cjne	r6,#0x02,00120$
      0002D8 BF 00 B7         [24]  608 	cjne	r7,#0x00,00120$
                                    609 ;	preemptive.c:313: break; // Exit loop if thread 1 is runnable
                                    610 ;	preemptive.c:316: case '2':
      0002DB 80 25            [24]  611 	sjmp	00122$
      0002DD                        612 00113$:
                                    613 ;	preemptive.c:317: if ((ValidBitMap & 0b0100) == 0b0100) {
      0002DD 74 04            [12]  614 	mov	a,#0x04
      0002DF 55 34            [12]  615 	anl	a,_ValidBitMap
      0002E1 FE               [12]  616 	mov	r6,a
      0002E2 E5 35            [12]  617 	mov	a,(_ValidBitMap + 1)
      0002E4 7F 00            [12]  618 	mov	r7,#0x00
      0002E6 BE 04 A9         [24]  619 	cjne	r6,#0x04,00120$
      0002E9 BF 00 A6         [24]  620 	cjne	r7,#0x00,00120$
                                    621 ;	preemptive.c:318: break; // Exit loop if thread 2 is runnable
                                    622 ;	preemptive.c:321: case '3':
      0002EC 80 14            [24]  623 	sjmp	00122$
      0002EE                        624 00116$:
                                    625 ;	preemptive.c:322: if ((ValidBitMap & 0b1000) == 0b1000) {
      0002EE 74 08            [12]  626 	mov	a,#0x08
      0002F0 55 34            [12]  627 	anl	a,_ValidBitMap
      0002F2 FE               [12]  628 	mov	r6,a
      0002F3 E5 35            [12]  629 	mov	a,(_ValidBitMap + 1)
      0002F5 7F 00            [12]  630 	mov	r7,#0x00
      0002F7 BE 08 05         [24]  631 	cjne	r6,#0x08,00252$
      0002FA BF 00 02         [24]  632 	cjne	r7,#0x00,00252$
      0002FD 80 03            [24]  633 	sjmp	00253$
      0002FF                        634 00252$:
      0002FF 02 02 92         [24]  635 	ljmp	00120$
      000302                        636 00253$:
                                    637 ;	preemptive.c:329: } while (1);
      000302                        638 00122$:
                                    639 ;	preemptive.c:330: RESTORESTATE;
      000302 AF 21            [24]  640 	mov	r7,_curThreadID
      000304 BF 30 02         [24]  641 	cjne	r7,#0x30,00254$
      000307 80 0F            [24]  642 	sjmp	00123$
      000309                        643 00254$:
      000309 BF 31 02         [24]  644 	cjne	r7,#0x31,00255$
      00030C 80 0F            [24]  645 	sjmp	00124$
      00030E                        646 00255$:
      00030E BF 32 02         [24]  647 	cjne	r7,#0x32,00256$
      000311 80 0F            [24]  648 	sjmp	00125$
      000313                        649 00256$:
      000313 BF 33 14         [24]  650 	cjne	r7,#0x33,00128$
      000316 80 0F            [24]  651 	sjmp	00126$
      000318                        652 00123$:
      000318 85 30 81         [24]  653 	mov	_SP,_Pointer
      00031B 80 0D            [24]  654 	sjmp	00128$
      00031D                        655 00124$:
      00031D 85 31 81         [24]  656 	mov	_SP,(_Pointer + 0x0001)
      000320 80 08            [24]  657 	sjmp	00128$
      000322                        658 00125$:
      000322 85 32 81         [24]  659 	mov	_SP,(_Pointer + 0x0002)
      000325 80 03            [24]  660 	sjmp	00128$
      000327                        661 00126$:
      000327 85 33 81         [24]  662 	mov	_SP,(_Pointer + 0x0003)
      00032A                        663 00128$:
      00032A D0 D0            [24]  664 	POP PSW 
      00032C D0 83            [24]  665 	POP DPH 
      00032E D0 82            [24]  666 	POP DPL 
      000330 D0 F0            [24]  667 	POP B 
      000332 D0 E0            [24]  668 	POP ACC 
                                    669 ;	preemptive.c:331: }
      000334 D0 D0            [24]  670 	pop	psw
      000336 92 AF            [24]  671 	mov	ea,c
      000338 22               [24]  672 	ret
                                    673 ;------------------------------------------------------------
                                    674 ;Allocation info for local variables in function 'ThreadExit'
                                    675 ;------------------------------------------------------------
                                    676 ;	preemptive.c:338: void ThreadExit(void)
                                    677 ;	-----------------------------------------
                                    678 ;	 function ThreadExit
                                    679 ;	-----------------------------------------
      000339                        680 _ThreadExit:
      000339 D3               [12]  681 	setb	c
      00033A 10 AF 01         [24]  682 	jbc	ea,00236$
      00033D C3               [12]  683 	clr	c
      00033E                        684 00236$:
      00033E C0 D0            [24]  685 	push	psw
                                    686 ;	preemptive.c:346: switch (curThreadID) {
      000340 AF 21            [24]  687 	mov	r7,_curThreadID
      000342 BF 30 02         [24]  688 	cjne	r7,#0x30,00237$
      000345 80 0F            [24]  689 	sjmp	00101$
      000347                        690 00237$:
      000347 BF 31 02         [24]  691 	cjne	r7,#0x31,00238$
      00034A 80 12            [24]  692 	sjmp	00102$
      00034C                        693 00238$:
      00034C BF 32 02         [24]  694 	cjne	r7,#0x32,00239$
      00034F 80 15            [24]  695 	sjmp	00103$
      000351                        696 00239$:
                                    697 ;	preemptive.c:347: case '0':
      000351 BF 33 22         [24]  698 	cjne	r7,#0x33,00105$
      000354 80 18            [24]  699 	sjmp	00104$
      000356                        700 00101$:
                                    701 ;	preemptive.c:348: ValidBitMap &= 0b1110; // Clear bit 0
      000356 53 34 0E         [24]  702 	anl	_ValidBitMap,#0x0e
      000359 75 35 00         [24]  703 	mov	(_ValidBitMap + 1),#0x00
                                    704 ;	preemptive.c:349: break;
                                    705 ;	preemptive.c:350: case '1':
      00035C 80 1B            [24]  706 	sjmp	00121$
      00035E                        707 00102$:
                                    708 ;	preemptive.c:351: ValidBitMap &= 0b1101; // Clear bit 1
      00035E 53 34 0D         [24]  709 	anl	_ValidBitMap,#0x0d
      000361 75 35 00         [24]  710 	mov	(_ValidBitMap + 1),#0x00
                                    711 ;	preemptive.c:352: break;
                                    712 ;	preemptive.c:353: case '2':
      000364 80 13            [24]  713 	sjmp	00121$
      000366                        714 00103$:
                                    715 ;	preemptive.c:354: ValidBitMap &= 0b1011; // Clear bit 2
      000366 53 34 0B         [24]  716 	anl	_ValidBitMap,#0x0b
      000369 75 35 00         [24]  717 	mov	(_ValidBitMap + 1),#0x00
                                    718 ;	preemptive.c:355: break;
                                    719 ;	preemptive.c:356: case '3':
      00036C 80 0B            [24]  720 	sjmp	00121$
      00036E                        721 00104$:
                                    722 ;	preemptive.c:357: ValidBitMap &= 0b0111; // Clear bit 3
      00036E 53 34 07         [24]  723 	anl	_ValidBitMap,#0x07
      000371 75 35 00         [24]  724 	mov	(_ValidBitMap + 1),#0x00
                                    725 ;	preemptive.c:358: break;
                                    726 ;	preemptive.c:359: default:
      000374 80 03            [24]  727 	sjmp	00121$
      000376                        728 00105$:
                                    729 ;	preemptive.c:360: return;
      000376 02 04 1B         [24]  730 	ljmp	00130$
                                    731 ;	preemptive.c:363: do {
      000379                        732 00121$:
                                    733 ;	preemptive.c:364: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
      000379 74 33            [12]  734 	mov	a,#0x33
      00037B B5 21 04         [24]  735 	cjne	a,_curThreadID,00132$
      00037E 7E 30            [12]  736 	mov	r6,#0x30
      000380 80 08            [24]  737 	sjmp	00133$
      000382                        738 00132$:
      000382 AD 21            [24]  739 	mov	r5,_curThreadID
      000384 0D               [12]  740 	inc	r5
      000385 ED               [12]  741 	mov	a,r5
      000386 FE               [12]  742 	mov	r6,a
      000387 33               [12]  743 	rlc	a
      000388 95 E0            [12]  744 	subb	a,acc
      00038A                        745 00133$:
      00038A 8E 21            [24]  746 	mov	_curThreadID,r6
                                    747 ;	preemptive.c:366: switch (curThreadID) {
      00038C AF 21            [24]  748 	mov	r7,_curThreadID
      00038E BF 30 02         [24]  749 	cjne	r7,#0x30,00243$
      000391 80 0F            [24]  750 	sjmp	00107$
      000393                        751 00243$:
      000393 BF 31 02         [24]  752 	cjne	r7,#0x31,00244$
      000396 80 1B            [24]  753 	sjmp	00110$
      000398                        754 00244$:
      000398 BF 32 02         [24]  755 	cjne	r7,#0x32,00245$
      00039B 80 27            [24]  756 	sjmp	00113$
      00039D                        757 00245$:
                                    758 ;	preemptive.c:367: case '0':
      00039D BF 33 49         [24]  759 	cjne	r7,#0x33,00123$
      0003A0 80 33            [24]  760 	sjmp	00116$
      0003A2                        761 00107$:
                                    762 ;	preemptive.c:368: if ((ValidBitMap & 0b0001) == 0b0001) {
      0003A2 74 01            [12]  763 	mov	a,#0x01
      0003A4 55 34            [12]  764 	anl	a,_ValidBitMap
      0003A6 FE               [12]  765 	mov	r6,a
      0003A7 E5 35            [12]  766 	mov	a,(_ValidBitMap + 1)
      0003A9 7F 00            [12]  767 	mov	r7,#0x00
      0003AB BE 01 CB         [24]  768 	cjne	r6,#0x01,00121$
      0003AE BF 00 C8         [24]  769 	cjne	r7,#0x00,00121$
                                    770 ;	preemptive.c:369: break; // Exit loop if thread 0 is valid
                                    771 ;	preemptive.c:372: case '1':
      0003B1 80 36            [24]  772 	sjmp	00123$
      0003B3                        773 00110$:
                                    774 ;	preemptive.c:373: if ((ValidBitMap & 0b0010) == 0b0010) {
      0003B3 74 02            [12]  775 	mov	a,#0x02
      0003B5 55 34            [12]  776 	anl	a,_ValidBitMap
      0003B7 FE               [12]  777 	mov	r6,a
      0003B8 E5 35            [12]  778 	mov	a,(_ValidBitMap + 1)
      0003BA 7F 00            [12]  779 	mov	r7,#0x00
      0003BC BE 02 BA         [24]  780 	cjne	r6,#0x02,00121$
      0003BF BF 00 B7         [24]  781 	cjne	r7,#0x00,00121$
                                    782 ;	preemptive.c:374: break; // Exit loop if thread 1 is valid
                                    783 ;	preemptive.c:377: case '2':
      0003C2 80 25            [24]  784 	sjmp	00123$
      0003C4                        785 00113$:
                                    786 ;	preemptive.c:378: if ((ValidBitMap & 0b0100) == 0b0100) {
      0003C4 74 04            [12]  787 	mov	a,#0x04
      0003C6 55 34            [12]  788 	anl	a,_ValidBitMap
      0003C8 FE               [12]  789 	mov	r6,a
      0003C9 E5 35            [12]  790 	mov	a,(_ValidBitMap + 1)
      0003CB 7F 00            [12]  791 	mov	r7,#0x00
      0003CD BE 04 A9         [24]  792 	cjne	r6,#0x04,00121$
      0003D0 BF 00 A6         [24]  793 	cjne	r7,#0x00,00121$
                                    794 ;	preemptive.c:379: break; // Exit loop if thread 2 is valid
                                    795 ;	preemptive.c:382: case '3':
      0003D3 80 14            [24]  796 	sjmp	00123$
      0003D5                        797 00116$:
                                    798 ;	preemptive.c:383: if ((ValidBitMap & 0b1000) == 0b1000) {
      0003D5 74 08            [12]  799 	mov	a,#0x08
      0003D7 55 34            [12]  800 	anl	a,_ValidBitMap
      0003D9 FE               [12]  801 	mov	r6,a
      0003DA E5 35            [12]  802 	mov	a,(_ValidBitMap + 1)
      0003DC 7F 00            [12]  803 	mov	r7,#0x00
      0003DE BE 08 05         [24]  804 	cjne	r6,#0x08,00253$
      0003E1 BF 00 02         [24]  805 	cjne	r7,#0x00,00253$
      0003E4 80 03            [24]  806 	sjmp	00254$
      0003E6                        807 00253$:
      0003E6 02 03 79         [24]  808 	ljmp	00121$
      0003E9                        809 00254$:
                                    810 ;	preemptive.c:391: } while (1);
      0003E9                        811 00123$:
                                    812 ;	preemptive.c:393: RESTORESTATE;
      0003E9 AF 21            [24]  813 	mov	r7,_curThreadID
      0003EB BF 30 02         [24]  814 	cjne	r7,#0x30,00255$
      0003EE 80 0F            [24]  815 	sjmp	00124$
      0003F0                        816 00255$:
      0003F0 BF 31 02         [24]  817 	cjne	r7,#0x31,00256$
      0003F3 80 0F            [24]  818 	sjmp	00125$
      0003F5                        819 00256$:
      0003F5 BF 32 02         [24]  820 	cjne	r7,#0x32,00257$
      0003F8 80 0F            [24]  821 	sjmp	00126$
      0003FA                        822 00257$:
      0003FA BF 33 14         [24]  823 	cjne	r7,#0x33,00129$
      0003FD 80 0F            [24]  824 	sjmp	00127$
      0003FF                        825 00124$:
      0003FF 85 30 81         [24]  826 	mov	_SP,_Pointer
      000402 80 0D            [24]  827 	sjmp	00129$
      000404                        828 00125$:
      000404 85 31 81         [24]  829 	mov	_SP,(_Pointer + 0x0001)
      000407 80 08            [24]  830 	sjmp	00129$
      000409                        831 00126$:
      000409 85 32 81         [24]  832 	mov	_SP,(_Pointer + 0x0002)
      00040C 80 03            [24]  833 	sjmp	00129$
      00040E                        834 00127$:
      00040E 85 33 81         [24]  835 	mov	_SP,(_Pointer + 0x0003)
      000411                        836 00129$:
      000411 D0 D0            [24]  837 	POP PSW 
      000413 D0 83            [24]  838 	POP DPH 
      000415 D0 82            [24]  839 	POP DPL 
      000417 D0 F0            [24]  840 	POP B 
      000419 D0 E0            [24]  841 	POP ACC 
      00041B                        842 00130$:
                                    843 ;	preemptive.c:394: }
      00041B D0 D0            [24]  844 	pop	psw
      00041D 92 AF            [24]  845 	mov	ea,c
      00041F 22               [24]  846 	ret
                                    847 ;------------------------------------------------------------
                                    848 ;Allocation info for local variables in function 'myTimer0Handler'
                                    849 ;------------------------------------------------------------
                                    850 ;	preemptive.c:396: void myTimer0Handler(void){
                                    851 ;	-----------------------------------------
                                    852 ;	 function myTimer0Handler
                                    853 ;	-----------------------------------------
      000420                        854 _myTimer0Handler:
                                    855 ;	preemptive.c:397: EA = 0;
                                    856 ;	assignBit
      000420 C2 AF            [12]  857 	clr	_EA
                                    858 ;	preemptive.c:398: SAVESTATE;
      000422 C0 E0            [24]  859 	PUSH ACC 
      000424 C0 F0            [24]  860 	PUSH B 
      000426 C0 82            [24]  861 	PUSH DPL 
      000428 C0 83            [24]  862 	PUSH DPH 
      00042A C0 D0            [24]  863 	PUSH PSW 
      00042C AF 21            [24]  864 	mov	r7,_curThreadID
      00042E BF 30 02         [24]  865 	cjne	r7,#0x30,00244$
      000431 80 0F            [24]  866 	sjmp	00101$
      000433                        867 00244$:
      000433 BF 31 02         [24]  868 	cjne	r7,#0x31,00245$
      000436 80 0F            [24]  869 	sjmp	00102$
      000438                        870 00245$:
      000438 BF 32 02         [24]  871 	cjne	r7,#0x32,00246$
      00043B 80 0F            [24]  872 	sjmp	00103$
      00043D                        873 00246$:
      00043D BF 33 14         [24]  874 	cjne	r7,#0x33,00125$
      000440 80 0F            [24]  875 	sjmp	00104$
      000442                        876 00101$:
      000442 85 81 30         [24]  877 	MOV 0x30, SP 
      000445 80 0D            [24]  878 	sjmp	00125$
      000447                        879 00102$:
      000447 85 81 31         [24]  880 	MOV 0x31, SP 
      00044A 80 08            [24]  881 	sjmp	00125$
      00044C                        882 00103$:
      00044C 85 81 32         [24]  883 	MOV 0x32, SP 
      00044F 80 03            [24]  884 	sjmp	00125$
      000451                        885 00104$:
      000451 85 81 33         [24]  886 	MOV 0x33, SP 
                                    887 ;	preemptive.c:399: do{
      000454                        888 00125$:
                                    889 ;	preemptive.c:401: if (curThreadID != '0') {
      000454 74 30            [12]  890 	mov	a,#0x30
      000456 B5 21 02         [24]  891 	cjne	a,_curThreadID,00248$
      000459 80 05            [24]  892 	sjmp	00110$
      00045B                        893 00248$:
                                    894 ;	preemptive.c:403: curThreadID = '0';
      00045B 75 21 30         [24]  895 	mov	_curThreadID,#0x30
      00045E 80 10            [24]  896 	sjmp	00111$
      000460                        897 00110$:
                                    898 ;	preemptive.c:408: curThreadID = ProdThreadID;
      000460 85 28 21         [24]  899 	mov	_curThreadID,_ProdThreadID
                                    900 ;	preemptive.c:409: ProdThreadID += 1;
      000463 E5 28            [12]  901 	mov	a,_ProdThreadID
      000465 04               [12]  902 	inc	a
      000466 F5 28            [12]  903 	mov	_ProdThreadID,a
                                    904 ;	preemptive.c:410: if (ProdThreadID == '3') {
      000468 74 33            [12]  905 	mov	a,#0x33
      00046A B5 28 03         [24]  906 	cjne	a,_ProdThreadID,00111$
                                    907 ;	preemptive.c:411: ProdThreadID = '1';
      00046D 75 28 31         [24]  908 	mov	_ProdThreadID,#0x31
      000470                        909 00111$:
                                    910 ;	preemptive.c:415: switch (curThreadID) {
      000470 AF 21            [24]  911 	mov	r7,_curThreadID
      000472 BF 30 02         [24]  912 	cjne	r7,#0x30,00251$
      000475 80 0F            [24]  913 	sjmp	00112$
      000477                        914 00251$:
      000477 BF 31 02         [24]  915 	cjne	r7,#0x31,00252$
      00047A 80 1B            [24]  916 	sjmp	00115$
      00047C                        917 00252$:
      00047C BF 32 02         [24]  918 	cjne	r7,#0x32,00253$
      00047F 80 27            [24]  919 	sjmp	00118$
      000481                        920 00253$:
                                    921 ;	preemptive.c:416: case '0':
      000481 BF 33 49         [24]  922 	cjne	r7,#0x33,00127$
      000484 80 33            [24]  923 	sjmp	00121$
      000486                        924 00112$:
                                    925 ;	preemptive.c:417: if ((ValidBitMap & 0b0001) == 0b0001) break;
      000486 74 01            [12]  926 	mov	a,#0x01
      000488 55 34            [12]  927 	anl	a,_ValidBitMap
      00048A FE               [12]  928 	mov	r6,a
      00048B E5 35            [12]  929 	mov	a,(_ValidBitMap + 1)
      00048D 7F 00            [12]  930 	mov	r7,#0x00
      00048F BE 01 C2         [24]  931 	cjne	r6,#0x01,00125$
      000492 BF 00 BF         [24]  932 	cjne	r7,#0x00,00125$
                                    933 ;	preemptive.c:419: case '1':
      000495 80 36            [24]  934 	sjmp	00127$
      000497                        935 00115$:
                                    936 ;	preemptive.c:420: if ((ValidBitMap & 0b0010) == 0b0010) break;
      000497 74 02            [12]  937 	mov	a,#0x02
      000499 55 34            [12]  938 	anl	a,_ValidBitMap
      00049B FE               [12]  939 	mov	r6,a
      00049C E5 35            [12]  940 	mov	a,(_ValidBitMap + 1)
      00049E 7F 00            [12]  941 	mov	r7,#0x00
      0004A0 BE 02 B1         [24]  942 	cjne	r6,#0x02,00125$
      0004A3 BF 00 AE         [24]  943 	cjne	r7,#0x00,00125$
                                    944 ;	preemptive.c:422: case '2':
      0004A6 80 25            [24]  945 	sjmp	00127$
      0004A8                        946 00118$:
                                    947 ;	preemptive.c:423: if ((ValidBitMap & 0b0100) == 0b0100) break;
      0004A8 74 04            [12]  948 	mov	a,#0x04
      0004AA 55 34            [12]  949 	anl	a,_ValidBitMap
      0004AC FE               [12]  950 	mov	r6,a
      0004AD E5 35            [12]  951 	mov	a,(_ValidBitMap + 1)
      0004AF 7F 00            [12]  952 	mov	r7,#0x00
      0004B1 BE 04 A0         [24]  953 	cjne	r6,#0x04,00125$
      0004B4 BF 00 9D         [24]  954 	cjne	r7,#0x00,00125$
                                    955 ;	preemptive.c:425: case '3':
      0004B7 80 14            [24]  956 	sjmp	00127$
      0004B9                        957 00121$:
                                    958 ;	preemptive.c:426: if ((ValidBitMap & 0b1000) == 0b1000) break;
      0004B9 74 08            [12]  959 	mov	a,#0x08
      0004BB 55 34            [12]  960 	anl	a,_ValidBitMap
      0004BD FE               [12]  961 	mov	r6,a
      0004BE E5 35            [12]  962 	mov	a,(_ValidBitMap + 1)
      0004C0 7F 00            [12]  963 	mov	r7,#0x00
      0004C2 BE 08 05         [24]  964 	cjne	r6,#0x08,00261$
      0004C5 BF 00 02         [24]  965 	cjne	r7,#0x00,00261$
      0004C8 80 03            [24]  966 	sjmp	00262$
      0004CA                        967 00261$:
      0004CA 02 04 54         [24]  968 	ljmp	00125$
      0004CD                        969 00262$:
                                    970 ;	preemptive.c:430: } while (1);
      0004CD                        971 00127$:
                                    972 ;	preemptive.c:431: RESTORESTATE;
      0004CD AF 21            [24]  973 	mov	r7,_curThreadID
      0004CF BF 30 02         [24]  974 	cjne	r7,#0x30,00263$
      0004D2 80 0F            [24]  975 	sjmp	00128$
      0004D4                        976 00263$:
      0004D4 BF 31 02         [24]  977 	cjne	r7,#0x31,00264$
      0004D7 80 0F            [24]  978 	sjmp	00129$
      0004D9                        979 00264$:
      0004D9 BF 32 02         [24]  980 	cjne	r7,#0x32,00265$
      0004DC 80 0F            [24]  981 	sjmp	00130$
      0004DE                        982 00265$:
      0004DE BF 33 14         [24]  983 	cjne	r7,#0x33,00133$
      0004E1 80 0F            [24]  984 	sjmp	00131$
      0004E3                        985 00128$:
      0004E3 85 30 81         [24]  986 	mov	_SP,_Pointer
      0004E6 80 0D            [24]  987 	sjmp	00133$
      0004E8                        988 00129$:
      0004E8 85 31 81         [24]  989 	mov	_SP,(_Pointer + 0x0001)
      0004EB 80 08            [24]  990 	sjmp	00133$
      0004ED                        991 00130$:
      0004ED 85 32 81         [24]  992 	mov	_SP,(_Pointer + 0x0002)
      0004F0 80 03            [24]  993 	sjmp	00133$
      0004F2                        994 00131$:
      0004F2 85 33 81         [24]  995 	mov	_SP,(_Pointer + 0x0003)
      0004F5                        996 00133$:
      0004F5 D0 D0            [24]  997 	POP PSW 
      0004F7 D0 83            [24]  998 	POP DPH 
      0004F9 D0 82            [24]  999 	POP DPL 
      0004FB D0 F0            [24] 1000 	POP B 
      0004FD D0 E0            [24] 1001 	POP ACC 
                                   1002 ;	preemptive.c:433: EA = 1;
                                   1003 ;	assignBit
      0004FF D2 AF            [12] 1004 	setb	_EA
                                   1005 ;	preemptive.c:436: __endasm;
      000501 32               [24] 1006 	RETI
                                   1007 ;	preemptive.c:437: }
      000502 22               [24] 1008 	ret
                                   1009 	.area CSEG    (CODE)
                                   1010 	.area CONST   (CODE)
                                   1011 	.area XINIT   (CODE)
                                   1012 	.area CABS    (ABS,CODE)
