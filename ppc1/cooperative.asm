;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module cooperative
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
;	cooperative.c:118: void Bootstrap(void)
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
;	cooperative.c:133: ValidBitMap = 0b0000;
	clr	a
	mov	_ValidBitMap,a
	mov	(_ValidBitMap + 1),a
;	cooperative.c:134: Pointer[0] = 0x3F;
	mov	_Pointer,#0x3f
;	cooperative.c:135: Pointer[1] = 0x4F;
	mov	(_Pointer + 0x0001),#0x4f
;	cooperative.c:136: Pointer[2] = 0x5F;
	mov	(_Pointer + 0x0002),#0x5f
;	cooperative.c:137: Pointer[3] = 0x6F;
	mov	(_Pointer + 0x0003),#0x6f
;	cooperative.c:138: curThreadID = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_curThreadID,dpl
;	cooperative.c:139: RESTORESTATE;
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
;	cooperative.c:140: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	cooperative.c:148: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	cooperative.c:194: if ((ValidBitMap & 0b1111) == 0b1111) {
	mov	a,#0x0f
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x0f,00102$
	cjne	r7,#0x00,00102$
;	cooperative.c:195: return -1;
	mov	dpl, #0xff
	ret
00102$:
;	cooperative.c:198: if ((ValidBitMap & 0b0001) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.0,00112$
;	cooperative.c:199: newThreadID = '0';
	mov	_newThreadID,#0x30
;	cooperative.c:200: ValidBitMap |= 0b0001;
	orl	_ValidBitMap,#0x01
	mov	a,(_ValidBitMap + 1)
;	cooperative.c:201: newSP =  Pointer[0];
	mov	_newSP,_Pointer
	sjmp	00113$
00112$:
;	cooperative.c:203: else if ((ValidBitMap & 0b0010) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.1,00109$
;	cooperative.c:204: newThreadID = '1';
	mov	_newThreadID,#0x31
;	cooperative.c:205: ValidBitMap |= 0b0010;
	orl	_ValidBitMap,#0x02
	mov	a,(_ValidBitMap + 1)
;	cooperative.c:206: newSP =  Pointer[1];
	mov	_newSP,(_Pointer + 0x0001)
	sjmp	00113$
00109$:
;	cooperative.c:208: else if ((ValidBitMap & 0b1000) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.3,00106$
;	cooperative.c:209: newThreadID = '2';
	mov	_newThreadID,#0x32
;	cooperative.c:210: ValidBitMap |= 0b0100;
	orl	_ValidBitMap,#0x04
	mov	a,(_ValidBitMap + 1)
;	cooperative.c:211: newSP =  Pointer[2];
	mov	_newSP,(_Pointer + 0x0002)
	sjmp	00113$
00106$:
;	cooperative.c:213: else if ((ValidBitMap & 0b1000) == 0b0000) {
	mov	a,_ValidBitMap
	jb	acc.3,00113$
;	cooperative.c:214: newThreadID = '3';
	mov	_newThreadID,#0x33
;	cooperative.c:215: ValidBitMap |= 0b1000;
	orl	_ValidBitMap,#0x08
	mov	a,(_ValidBitMap + 1)
;	cooperative.c:216: newSP =  Pointer[3];
	mov	_newSP,(_Pointer + 0x0003)
00113$:
;	cooperative.c:229: __endasm;
	MOV	0x22, SP
	MOV	SP, 0x23
	PUSH	DPL
	PUSH	DPH
	MOV	A, 0x00
	PUSH	A
	PUSH	A
	PUSH	A
	PUSH	A
;	cooperative.c:231: switch (newThreadID) {
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
;	cooperative.c:232: case '0':
	cjne	r7,#0x33,00119$
	sjmp	00117$
00114$:
;	cooperative.c:233: PSW = 0b00000000;               
	mov	_PSW,#0x00
;	cooperative.c:237: __endasm;
	PUSH	PSW
	MOV	0x30, SP
;	cooperative.c:238: break;
;	cooperative.c:239: case '1':
	sjmp	00119$
00115$:
;	cooperative.c:240: PSW = 0b00001000;
	mov	_PSW,#0x08
;	cooperative.c:244: __endasm;
	PUSH	PSW
	MOV	0x31, SP
;	cooperative.c:245: break;
;	cooperative.c:246: case '2':
	sjmp	00119$
00116$:
;	cooperative.c:247: PSW = 0b00010000;
	mov	_PSW,#0x10
;	cooperative.c:251: __endasm;
	PUSH	PSW
	MOV	0x32, SP
;	cooperative.c:252: break;
;	cooperative.c:253: case '3':
	sjmp	00119$
00117$:
;	cooperative.c:254: PSW = 0b00011000;
	mov	_PSW,#0x18
;	cooperative.c:258: __endasm;
	PUSH	PSW
	MOV	0x33, SP
;	cooperative.c:262: }
00119$:
;	cooperative.c:264: SP = tempSP;
	mov	_SP,_tempSP
;	cooperative.c:266: return newThreadID;
	mov	dpl, _newThreadID
;	cooperative.c:267: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	cooperative.c:276: void ThreadYield(void)
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	cooperative.c:278: SAVESTATE;
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
;	cooperative.c:279: do
00120$:
;	cooperative.c:291: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
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
;	cooperative.c:294: switch (curThreadID) {
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
;	cooperative.c:295: case '0':
	cjne	r7,#0x33,00122$
	sjmp	00116$
00107$:
;	cooperative.c:296: if ((ValidBitMap & 0b0001) == 0b0001) {
	mov	a,#0x01
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00120$
	cjne	r7,#0x00,00120$
;	cooperative.c:297: break; // Exit loop if thread 0 is runnable
;	cooperative.c:300: case '1':
	sjmp	00122$
00110$:
;	cooperative.c:301: if ((ValidBitMap & 0b0010) == 0b0010) {
	mov	a,#0x02
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00120$
	cjne	r7,#0x00,00120$
;	cooperative.c:302: break; // Exit loop if thread 1 is runnable
;	cooperative.c:305: case '2':
	sjmp	00122$
00113$:
;	cooperative.c:306: if ((ValidBitMap & 0b0100) == 0b0100) {
	mov	a,#0x04
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00120$
	cjne	r7,#0x00,00120$
;	cooperative.c:307: break; // Exit loop if thread 2 is runnable
;	cooperative.c:310: case '3':
	sjmp	00122$
00116$:
;	cooperative.c:311: if ((ValidBitMap & 0b1000) == 0b1000) {
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
;	cooperative.c:318: } while (1);
00122$:
;	cooperative.c:319: RESTORESTATE;
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
;	cooperative.c:320: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	cooperative.c:327: void ThreadExit(void)
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	cooperative.c:335: switch (curThreadID) {
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
;	cooperative.c:336: case '0':
	cjne	r7,#0x33,00105$
	sjmp	00104$
00101$:
;	cooperative.c:337: ValidBitMap &= 0b1110; // Clear bit 0
	anl	_ValidBitMap,#0x0e
	mov	(_ValidBitMap + 1),#0x00
;	cooperative.c:338: break;
;	cooperative.c:339: case '1':
	sjmp	00121$
00102$:
;	cooperative.c:340: ValidBitMap &= 0b1101; // Clear bit 1
	anl	_ValidBitMap,#0x0d
	mov	(_ValidBitMap + 1),#0x00
;	cooperative.c:341: break;
;	cooperative.c:342: case '2':
	sjmp	00121$
00103$:
;	cooperative.c:343: ValidBitMap &= 0b1011; // Clear bit 2
	anl	_ValidBitMap,#0x0b
	mov	(_ValidBitMap + 1),#0x00
;	cooperative.c:344: break;
;	cooperative.c:345: case '3':
	sjmp	00121$
00104$:
;	cooperative.c:346: ValidBitMap &= 0b0111; // Clear bit 3
	anl	_ValidBitMap,#0x07
	mov	(_ValidBitMap + 1),#0x00
;	cooperative.c:347: break;
;	cooperative.c:348: default:
	sjmp	00121$
00105$:
;	cooperative.c:349: return;
	ret
;	cooperative.c:352: do {
00121$:
;	cooperative.c:353: curThreadID = (curThreadID == '3') ? '0' : curThreadID + 1;
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
;	cooperative.c:355: switch (curThreadID) {
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
;	cooperative.c:356: case '0':
	cjne	r7,#0x33,00123$
	sjmp	00116$
00107$:
;	cooperative.c:357: if ((ValidBitMap & 0b0001) == 0b0001) {
	mov	a,#0x01
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x01,00121$
	cjne	r7,#0x00,00121$
;	cooperative.c:358: break; // Exit loop if thread 0 is valid
;	cooperative.c:361: case '1':
	sjmp	00123$
00110$:
;	cooperative.c:362: if ((ValidBitMap & 0b0010) == 0b0010) {
	mov	a,#0x02
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x02,00121$
	cjne	r7,#0x00,00121$
;	cooperative.c:363: break; // Exit loop if thread 1 is valid
;	cooperative.c:366: case '2':
	sjmp	00123$
00113$:
;	cooperative.c:367: if ((ValidBitMap & 0b0100) == 0b0100) {
	mov	a,#0x04
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x04,00121$
	cjne	r7,#0x00,00121$
;	cooperative.c:368: break; // Exit loop if thread 2 is valid
;	cooperative.c:371: case '3':
	sjmp	00123$
00116$:
;	cooperative.c:372: if ((ValidBitMap & 0b1000) == 0b1000) {
	mov	a,#0x08
	anl	a,_ValidBitMap
	mov	r6,a
	mov	a,(_ValidBitMap + 1)
	mov	r7,#0x00
	cjne	r6,#0x08,00252$
	cjne	r7,#0x00,00252$
	sjmp	00253$
00252$:
	ljmp	00121$
00253$:
;	cooperative.c:380: } while (1);
00123$:
;	cooperative.c:382: RESTORESTATE;
	mov	r7,_curThreadID
	cjne	r7,#0x30,00254$
	sjmp	00124$
00254$:
	cjne	r7,#0x31,00255$
	sjmp	00125$
00255$:
	cjne	r7,#0x32,00256$
	sjmp	00126$
00256$:
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
;	cooperative.c:383: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
