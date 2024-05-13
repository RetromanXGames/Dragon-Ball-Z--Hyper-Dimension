lorom

table english.tbl,myTable


;this file made for xkas
;graphics start at 308000



;variable locations (these are lowrom addresses) (these addresses should match the ones on the include below)

!CodeOffset = $39C000

!SetBank = #$30
!SetBank2 = #$31 ;should always be 1 more than SetBank1 (not sure if it's same with HiRom)
!SetOffset = #$8000

!MapBank = #$32
!MapOffset = #$8000

!ColBank = #$32
!ColOffset = #$9000

;includes for intro 
org $308000
incbin introfiles/intro.set

org $328000
incbin introfiles/intro.map

org $329000
incbin introfiles/intro.col


;start of rom position, should be 00:FF00 if it's HiRom (use LunarAdress to tell which it is)
org $008000
JMP !CodeOffset
NOP

;start initialization
org !CodeOffset
SEI
CLC
XCE
SEP #$30
PHB
LDA #$00
PHA
PLB
LDA #$80
STA $2100
LDA #$00
STA $2101
STA $2102
STA $2103
STA $2105
STA $2106
STA $2107
STA $2108
STA $2109
STA $210A
STA $210B
STA $210C
STA $210D
STA $210D
STA $210E
STA $210E
STA $210F
STA $210F
STA $2110
STA $2110
STA $2111
STA $2111
STA $2112
STA $2112
STA $2113
STA $2113
STA $2114
STA $2114

LDA #$80
STA $2115
LDA #$00
STA $2116
STA $2117
STA $211A
STA $211B
LDA #$01
STA $211B
LDA #$00
STA $211C
STA $211C
STA $211D
STA $211D
STA $211E
LDA #$01
STA $211E
LDA #$00
STA $211F
STA $211F
STA $2120
STA $2120
STA $2121
STA $2123
STA $2124
STA $2125
STA $2126
STA $2127
STA $2128
STA $2129
STA $212A
STA $212B
LDA #$01
STA $212C
LDA #$00
STA $212D
STA $212E
STA $212F
LDA #$30
STA $2130
LDA #$00
STA $2131
LDA #$E0
STA $2132
LDA #$00
STA $2133
LDA #$01	;auto read joypads
;LDA #$81
STA $4200
LDA #$FF
STA $4201
LDA #$00
STA $4202
STA $4203
STA $4204
STA $4205
STA $4206
STA $4207
STA $4208
STA $4209
STA $420A
STA $420B
STA $420C
STA $420D
REP #$30
SEP #$20
LDA #$03
STA $2105
LDA #$01
STA $212C
LDA #$00
STA $2107
LDA #$01
STA $210B
;JSR $2201
JSR Jump1

;DMA color stuff
LDX #$8000
STX $2116
LDX #$1801
STX $4300
LDX !MapOffset
STX $4302
LDA !MapBank
STA $4304
LDX #$0C00
STX $4305
LDA #$01
STA $420B
LDA #$00
STA $2121
LDX #$2200
STX $4300
LDX !ColOffset
STX $4302
LDA !ColBank
STA $4304
LDX #$0200	;512 colors
STX $4305
LDA #$01
STA $420B
JSR Jump1


;dma data information for set
;copy first half #$8000
LDX #$1000
STX $2116
LDX #$1801
STX $4300
LDX !SetOffset
STX $4302
LDA !SetBank
STA $4304
LDX #$8000
STX $4305
LDA #$01
STA $420B
JSR Jump1

;dma data information
;copy bottom half #$6000 in size
LDX !SetOffset
STX $4302
LDA !SetBank2
STA $4304
LDX #$6000
STX $4305
LDA #$01
STA $420B
Jump9:
STA $2100
INA
JSR Jump2

CMP #$10
BCC Jump9

FadeRoutine()
{
CLI
LDX #$0030

Jump3:
SEP #$20
LDY #$FFFF

Jump4:
DEY
BNE Jump4

Jump5:
;LDA $4210
LDA $4212
AND #$80
BEQ Jump5

Jump6:	
LDA $4212	;check vblank
AND #$01
BNE Jump6

REP #$20
LDA $4218
AND #$F0F0
BNE Jump7
DEX

;Get key press or not
;BNE Jump3 ;don't wait for keypress
BRA Jump3 ;wait for keypress

Jump7:
SEP #$20
LDA $4210
AND #$80
BEQ Jump7
LDA #$0F

Jump10:
STA $2100
DEC A
PHA
JSR Jump2
}



PLA
CMP #$00
BNE Jump10


LDX #$0000

;old code from beginning of unchanged rom
CLC
XCE
SEI
REP #$10
JMP.l $008005	;jump to fifth instruction


Jump1:
PHA
Jump11:
LDA $4210
AND #$80
BEQ Jump11
PLA
RTS


Jump2:
LDY #$FFFF
Jump8:
DEY
BNE Jump8
RTS



vblank:
 pha
 php
 sep #$20
 

; lda #$81		; enable temp NMI
; sta.l $4200

Vloop:
 lda.l $4210
 and #$80
 beq Vloop

; lda #$01		; disable again
; sta.l $4200

 plp
 pla
rts

