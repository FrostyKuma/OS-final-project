;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _newSP
	.globl _tempSP
	.globl _curThreadID
	.globl _ValidBitMap
	.globl _newThreadID
	.globl _Pointer
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_Pointer	=	0x0030
_newThreadID	=	0x003c
_ValidBitMap	=	0x0034
_curThreadID	=	0x0021
_tempSP	=	0x0022
_newSP	=	0x0023
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:118: void Bootstrap(void)
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:133: ValidBitMap = 0b0000;
	clr	a
	mov	_ValidBitMap,a
	mov	(_ValidBitMap + 1),a
;	preemptive.c:134: Pointer[0] = 0x3F;
	mov	_Pointer,#0x3f
;	preemptive.c:135: Pointer[1] = 0x4F;
	mov	(_Pointer + 0x0001),#0x4f
;	preemptive.c:136: Pointer[2] = 0x5F;
	mov	(_Pointer + 0x0002),#0x5f
;	preemptive.c:137: Pointer[3] = 0x6F;
	mov	(_Pointer + 0x0003),#0x6f
;	preemptive.c:138: TMOD = 0; //timer zero
	mov	_TMOD,a
;	preemptive.c:139: IE = 0x82; 
	mov	_IE,#0x82
;	preemptive.c:140: TR0 = 1;
;	assignBit
	setb	_TR0
;	preemptive.c:141: curThreadID = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_curThreadID,dpl
;	preemptive.c:142: RESTORESTATE;
	mov	r7,_curThreadID
	cjne	r7,#0x30,00133$
	sjmp	00101$
00133$:
	cjne	r7,#0x31,00134$
	sjmp	00102$
00134$:
	cjne	r7,#0x32,00135$
	sjmp	00103$
00135$:
	cjne	r7,#0x33,00106$
	sjmp	00104$
00101$:
	mov	_SP,_Pointer
	sjmp	00106$
00102$:
	mov	_SP,(_Pointer + 0x0001)
	sjmp	00106$
00103$:
	mov	_SP,(_Pointer + 0x0002)
	sjmp	00106$
00104$:
	mov	_SP,(_Pointer + 0x0003)
00106$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:143: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:151: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:198: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:200: if ((ValidBitMap & 0b1111) == 0b1111) {
	mov	a,#0x0f
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x0f,00102$
	cjne	r7,#0x00,00102$
;	preemptive.c:201: return -1;
	mov	dpl, #0xff
	ret
00102$:
;	preemptive.c:204: if ((ValidBitMap & 0b0001) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.0,00112$
;	preemptive.c:205: newThreadID = '0';
	mov	_newThreadID,#0x30
;	preemptive.c:206: ValidBitMap |= 0b0001;
	orl	_ValidBitMap,#0x01
	mov	a,(_ValidBitMap + 1)
;	preemptive.c:207: newSP =  Pointer[0];
	mov	_newSP,_Pointer
	sjmp	00113$
00112$:
;	preemptive.c:209: else if ((ValidBitMap & 0b0010) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.1,00109$
;	preemptive.c:210: newThreadID = '1';
	mov	_newThreadID,#0x31
;	preemptive.c:211: ValidBitMap |= 0b0010;
	orl	_ValidBitMap,#0x02
	mov	a,(_ValidBitMap + 1)
;	preemptive.c:212: newSP =  Pointer[1];
	mov	_newSP,(_Pointer + 0x0001)
	sjmp	00113$
00109$:
;	preemptive.c:214: else if ((ValidBitMap & 0b1000) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.3,00106$
;	preemptive.c:215: newThreadID = '2';
	mov	_newThreadID,#0x32
;	preemptive.c:216: ValidBitMap |= 0b0100;
	orl	_ValidBitMap,#0x04
	mov	a,(_ValidBitMap + 1)
;	preemptive.c:217: newSP =  Pointer[2];
	mov	_newSP,(_Pointer + 0x0002)
	sjmp	00113$
00106$:
;	preemptive.c:219: else if ((ValidBitMap & 0b1000) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.3,00113$
;	preemptive.c:220: newThreadID = '3';
	mov	_newThreadID,#0x33
;	preemptive.c:221: ValidBitMap |= 0b1000;
	orl	_ValidBitMap,#0x08
	mov	a,(_ValidBitMap + 1)
;	preemptive.c:222: newSP =  Pointer[3];
	mov	_newSP,(_Pointer + 0x0003)
00113$:
;	preemptive.c:235: __endasm;
	MOV	0x22, SP
	MOV	SP, 0x23
	PUSH	DPL
	PUSH	DPH
	MOV	A, 0x00
	PUSH	A
	PUSH	A
	PUSH	A
	PUSH	A
;	preemptive.c:237: switch (newThreadID) {
	mov	r7,_newThreadID
	cjne	r7,#0x30,00182$
	sjmp	00114$
00182$:
	cjne	r7,#0x31,00183$
	sjmp	00115$
00183$:
	cjne	r7,#0x32,00184$
	sjmp	00116$
00184$:
;	preemptive.c:238: case '0':
	cjne	r7,#0x33,00119$
	sjmp	00117$
00114$:
;	preemptive.c:239: PSW = 0b00000000;               
	mov	_PSW,#0x00
;	preemptive.c:243: __endasm;
	PUSH	PSW
	MOV	0x30, SP
;	preemptive.c:244: break;
;	preemptive.c:245: case '1':
	sjmp	00119$
00115$:
;	preemptive.c:246: PSW = 0b00001000;
	mov	_PSW,#0x08
;	preemptive.c:250: __endasm;
	PUSH	PSW
	MOV	0x31, SP
;	preemptive.c:251: break;
;	preemptive.c:252: case '2':
	sjmp	00119$
00116$:
;	preemptive.c:253: PSW = 0b00010000;
	mov	_PSW,#0x10
;	preemptive.c:257: __endasm;
	PUSH	PSW
	MOV	0x32, SP
;	preemptive.c:258: break;
;	preemptive.c:259: case '3':
	sjmp	00119$
00117$:
;	preemptive.c:260: PSW = 0b00011000;
	mov	_PSW,#0x18
;	preemptive.c:264: __endasm;
	PUSH	PSW
	MOV	0x33, SP
;	preemptive.c:268: }
00119$:
;	preemptive.c:270: SP = tempSP;
	mov	_SP,_tempSP
;	preemptive.c:272: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:274: return newThreadID;
	mov	dpl, _newThreadID
;	preemptive.c:275: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:284: void ThreadYield(void)
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
	setb	c
	jbc	ea,00235$
	clr	c
00235$:
	push	psw
;	preemptive.c:286: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	r7,_curThreadID
	cjne	r7,#0x30,00236$
	sjmp	00101$
00236$:
	cjne	r7,#0x31,00237$
	sjmp	00102$
00237$:
	cjne	r7,#0x32,00238$
	sjmp	00103$
00238$:
	cjne	r7,#0x33,00120$
	sjmp	00104$
00101$:
	MOV 0x30, SP 
	sjmp	00120$
00102$:
	MOV 0x31, SP 
	sjmp	00120$
00103$:
	MOV 0x32, SP 
	sjmp	00120$
00104$:
	MOV 0x33, SP 
;	preemptive.c:287: do
00120$:
;	preemptive.c:299: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
	mov	a,#0x33
	cjne	a,_curThreadID,00131$
	mov	r6,#0x30
	sjmp	00132$
00131$:
	mov	r5,_curThreadID
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
00132$:
	mov	_curThreadID,r6
;	preemptive.c:302: switch (curThreadID) {
	mov	r7,_curThreadID
	cjne	r7,#0x30,00242$
	sjmp	00107$
00242$:
	cjne	r7,#0x31,00243$
	sjmp	00110$
00243$:
	cjne	r7,#0x32,00244$
	sjmp	00113$
00244$:
;	preemptive.c:303: case '0':
	cjne	r7,#0x33,00122$
	sjmp	00116$
00107$:
;	preemptive.c:304: if ((ValidBitMap & 0b0001) == 0b0001) {
	mov	a,#0x01
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00120$
	cjne	r7,#0x00,00120$
;	preemptive.c:305: break; // Exit loop if thread 0 is runnable
;	preemptive.c:308: case '1':
	sjmp	00122$
00110$:
;	preemptive.c:309: if ((ValidBitMap & 0b0010) == 0b0010) {
	mov	a,#0x02
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00120$
	cjne	r7,#0x00,00120$
;	preemptive.c:310: break; // Exit loop if thread 1 is runnable
;	preemptive.c:313: case '2':
	sjmp	00122$
00113$:
;	preemptive.c:314: if ((ValidBitMap & 0b0100) == 0b0100) {
	mov	a,#0x04
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00120$
	cjne	r7,#0x00,00120$
;	preemptive.c:315: break; // Exit loop if thread 2 is runnable
;	preemptive.c:318: case '3':
	sjmp	00122$
00116$:
;	preemptive.c:319: if ((ValidBitMap & 0b1000) == 0b1000) {
	mov	a,#0x08
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00252$
	cjne	r7,#0x00,00252$
	sjmp	00253$
00252$:
	ljmp	00120$
00253$:
;	preemptive.c:326: } while (1);
00122$:
;	preemptive.c:327: RESTORESTATE;
	mov	r7,_curThreadID
	cjne	r7,#0x30,00254$
	sjmp	00123$
00254$:
	cjne	r7,#0x31,00255$
	sjmp	00124$
00255$:
	cjne	r7,#0x32,00256$
	sjmp	00125$
00256$:
	cjne	r7,#0x33,00128$
	sjmp	00126$
00123$:
	mov	_SP,_Pointer
	sjmp	00128$
00124$:
	mov	_SP,(_Pointer + 0x0001)
	sjmp	00128$
00125$:
	mov	_SP,(_Pointer + 0x0002)
	sjmp	00128$
00126$:
	mov	_SP,(_Pointer + 0x0003)
00128$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:328: }
	pop	psw
	mov	ea,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:335: void ThreadExit(void)
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
	setb	c
	jbc	ea,00236$
	clr	c
00236$:
	push	psw
;	preemptive.c:343: switch (curThreadID) {
	mov	r7,_curThreadID
	cjne	r7,#0x30,00237$
	sjmp	00101$
00237$:
	cjne	r7,#0x31,00238$
	sjmp	00102$
00238$:
	cjne	r7,#0x32,00239$
	sjmp	00103$
00239$:
;	preemptive.c:344: case '0':
	cjne	r7,#0x33,00105$
	sjmp	00104$
00101$:
;	preemptive.c:345: ValidBitMap &= 0b1110; // Clear bit 0
	anl	_ValidBitMap,#0x0e
	mov	(_ValidBitMap + 1),#0x00
;	preemptive.c:346: break;
;	preemptive.c:347: case '1':
	sjmp	00121$
00102$:
;	preemptive.c:348: ValidBitMap &= 0b1101; // Clear bit 1
	anl	_ValidBitMap,#0x0d
	mov	(_ValidBitMap + 1),#0x00
;	preemptive.c:349: break;
;	preemptive.c:350: case '2':
	sjmp	00121$
00103$:
;	preemptive.c:351: ValidBitMap &= 0b1011; // Clear bit 2
	anl	_ValidBitMap,#0x0b
	mov	(_ValidBitMap + 1),#0x00
;	preemptive.c:352: break;
;	preemptive.c:353: case '3':
	sjmp	00121$
00104$:
;	preemptive.c:354: ValidBitMap &= 0b0111; // Clear bit 3
	anl	_ValidBitMap,#0x07
	mov	(_ValidBitMap + 1),#0x00
;	preemptive.c:355: break;
;	preemptive.c:356: default:
	sjmp	00121$
00105$:
;	preemptive.c:357: return;
	ljmp	00130$
;	preemptive.c:360: do {
00121$:
;	preemptive.c:361: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
	mov	a,#0x33
	cjne	a,_curThreadID,00132$
	mov	r6,#0x30
	sjmp	00133$
00132$:
	mov	r5,_curThreadID
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
00133$:
	mov	_curThreadID,r6
;	preemptive.c:363: switch (curThreadID) {
	mov	r7,_curThreadID
	cjne	r7,#0x30,00243$
	sjmp	00107$
00243$:
	cjne	r7,#0x31,00244$
	sjmp	00110$
00244$:
	cjne	r7,#0x32,00245$
	sjmp	00113$
00245$:
;	preemptive.c:364: case '0':
	cjne	r7,#0x33,00123$
	sjmp	00116$
00107$:
;	preemptive.c:365: if ((ValidBitMap & 0b0001) == 0b0001) {
	mov	a,#0x01
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00121$
	cjne	r7,#0x00,00121$
;	preemptive.c:366: break; // Exit loop if thread 0 is valid
;	preemptive.c:369: case '1':
	sjmp	00123$
00110$:
;	preemptive.c:370: if ((ValidBitMap & 0b0010) == 0b0010) {
	mov	a,#0x02
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00121$
	cjne	r7,#0x00,00121$
;	preemptive.c:371: break; // Exit loop if thread 1 is valid
;	preemptive.c:374: case '2':
	sjmp	00123$
00113$:
;	preemptive.c:375: if ((ValidBitMap & 0b0100) == 0b0100) {
	mov	a,#0x04
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00121$
	cjne	r7,#0x00,00121$
;	preemptive.c:376: break; // Exit loop if thread 2 is valid
;	preemptive.c:379: case '3':
	sjmp	00123$
00116$:
;	preemptive.c:380: if ((ValidBitMap & 0b1000) == 0b1000) {
	mov	a,#0x08
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00253$
	cjne	r7,#0x00,00253$
	sjmp	00254$
00253$:
	ljmp	00121$
00254$:
;	preemptive.c:388: } while (1);
00123$:
;	preemptive.c:390: RESTORESTATE;
	mov	r7,_curThreadID
	cjne	r7,#0x30,00255$
	sjmp	00124$
00255$:
	cjne	r7,#0x31,00256$
	sjmp	00125$
00256$:
	cjne	r7,#0x32,00257$
	sjmp	00126$
00257$:
	cjne	r7,#0x33,00129$
	sjmp	00127$
00124$:
	mov	_SP,_Pointer
	sjmp	00129$
00125$:
	mov	_SP,(_Pointer + 0x0001)
	sjmp	00129$
00126$:
	mov	_SP,(_Pointer + 0x0002)
	sjmp	00129$
00127$:
	mov	_SP,(_Pointer + 0x0003)
00129$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
00130$:
;	preemptive.c:391: }
	pop	psw
	mov	ea,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:393: void myTimer0Handler(void){
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:394: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:395: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	r7,_curThreadID
	cjne	r7,#0x30,00235$
	sjmp	00101$
00235$:
	cjne	r7,#0x31,00236$
	sjmp	00102$
00236$:
	cjne	r7,#0x32,00237$
	sjmp	00103$
00237$:
	cjne	r7,#0x33,00120$
	sjmp	00104$
00101$:
	MOV 0x30, SP 
	sjmp	00120$
00102$:
	MOV 0x31, SP 
	sjmp	00120$
00103$:
	MOV 0x32, SP 
	sjmp	00120$
00104$:
	MOV 0x33, SP 
;	preemptive.c:396: do{
00120$:
;	preemptive.c:397: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
	mov	a,#0x33
	cjne	a,_curThreadID,00131$
	mov	r6,#0x30
	sjmp	00132$
00131$:
	mov	r5,_curThreadID
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
00132$:
	mov	_curThreadID,r6
;	preemptive.c:399: switch (curThreadID) {
	mov	r7,_curThreadID
	cjne	r7,#0x30,00241$
	sjmp	00107$
00241$:
	cjne	r7,#0x31,00242$
	sjmp	00110$
00242$:
	cjne	r7,#0x32,00243$
	sjmp	00113$
00243$:
;	preemptive.c:400: case '0':
	cjne	r7,#0x33,00122$
	sjmp	00116$
00107$:
;	preemptive.c:401: if ((ValidBitMap & 0b0001) == 0b0001) break;
	mov	a,#0x01
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00120$
	cjne	r7,#0x00,00120$
;	preemptive.c:403: case '1':
	sjmp	00122$
00110$:
;	preemptive.c:404: if ((ValidBitMap & 0b0010) == 0b0010) break;
	mov	a,#0x02
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00120$
	cjne	r7,#0x00,00120$
;	preemptive.c:406: case '2':
	sjmp	00122$
00113$:
;	preemptive.c:407: if ((ValidBitMap & 0b0100) == 0b0100) break;
	mov	a,#0x04
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00120$
	cjne	r7,#0x00,00120$
;	preemptive.c:409: case '3':
	sjmp	00122$
00116$:
;	preemptive.c:410: if ((ValidBitMap & 0b1000) == 0b1000) break;
	mov	a,#0x08
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00251$
	cjne	r7,#0x00,00251$
	sjmp	00252$
00251$:
	ljmp	00120$
00252$:
;	preemptive.c:414: } while (1);
00122$:
;	preemptive.c:415: RESTORESTATE;
	mov	r7,_curThreadID
	cjne	r7,#0x30,00253$
	sjmp	00123$
00253$:
	cjne	r7,#0x31,00254$
	sjmp	00124$
00254$:
	cjne	r7,#0x32,00255$
	sjmp	00125$
00255$:
	cjne	r7,#0x33,00128$
	sjmp	00126$
00123$:
	mov	_SP,_Pointer
	sjmp	00128$
00124$:
	mov	_SP,(_Pointer + 0x0001)
	sjmp	00128$
00125$:
	mov	_SP,(_Pointer + 0x0002)
	sjmp	00128$
00126$:
	mov	_SP,(_Pointer + 0x0003)
00128$:
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:417: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:420: __endasm;
	RETI
;	preemptive.c:421: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
