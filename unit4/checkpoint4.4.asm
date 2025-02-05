  .file [name="checkpoint4.4.bin", type="bin", segments="XMega65Bin"]
.segmentdef XMega65Bin [segments="Syscall, Code, Data, Stack, Zeropage"]
.segmentdef Syscall [start=$8000, max=$81ff]
.segmentdef Code [start=$8200, min=$8200, max=$bdff]
.segmentdef Data [startAfter="Code", min=$8200, max=$bdff]
.segmentdef Stack [min=$be00, max=$beff, fill]
.segmentdef Zeropage [min=$bf00, max=$bfff, fill]

  .label VIC_MEMORY = $d018
  .label SCREEN = $400
  .label COLS = $d800
  .const WHITE = 1
  .const JMP = $4c
  .const NOP = $ea
  .label current_screen_line = 2
  .label current_screen_x = 6
  lda #<0
  sta.z current_screen_line
  sta.z current_screen_line+1
  sta.z current_screen_x
  jsr main
  rts
.segment Code
main: {
    rts
}
CPUKIL: {
    jsr exit_hypervisor
    rts
}
exit_hypervisor: {
    //Trigger exit from Hypervisor mode
    lda #1
    sta $d67f
    rts
}
undefined_trap: {
    jsr exit_hypervisor
    rts
}
VF011WR: {
    jsr exit_hypervisor
    rts
}
VF011RD: {
    jsr exit_hypervisor
    rts
}
ALTTABKEY: {
    jsr exit_hypervisor
    rts
}
RESTORKEY: {
    jsr exit_hypervisor
    rts
}
PAGFAULT: {
    jsr exit_hypervisor
    rts
}
SYSCALL3F: {
    jsr exit_hypervisor
    rts
}
SYSCALL3E: {
    jsr exit_hypervisor
    rts
}
SYSCALL3D: {
    jsr exit_hypervisor
    rts
}
SYSCALL3C: {
    jsr exit_hypervisor
    rts
}
SYSCALL3B: {
    jsr exit_hypervisor
    rts
}
SYSCALL3A: {
    jsr exit_hypervisor
    rts
}
SYSCALL39: {
    jsr exit_hypervisor
    rts
}
SYSCALL38: {
    jsr exit_hypervisor
    rts
}
SYSCALL37: {
    jsr exit_hypervisor
    rts
}
SYSCALL36: {
    jsr exit_hypervisor
    rts
}
SYSCALL35: {
    jsr exit_hypervisor
    rts
}
SYSCALL34: {
    jsr exit_hypervisor
    rts
}
SYSCALL33: {
    jsr exit_hypervisor
    rts
}
SYSCALL32: {
    jsr exit_hypervisor
    rts
}
SYSCALL31: {
    jsr exit_hypervisor
    rts
}
SYSCALL30: {
    jsr exit_hypervisor
    rts
}
SYSCALL2F: {
    jsr exit_hypervisor
    rts
}
SYSCALL2E: {
    jsr exit_hypervisor
    rts
}
SYSCALL2D: {
    jsr exit_hypervisor
    rts
}
SYSCALL2C: {
    jsr exit_hypervisor
    rts
}
SYSCALL2B: {
    jsr exit_hypervisor
    rts
}
SYSCALL2A: {
    jsr exit_hypervisor
    rts
}
SYSCALL29: {
    jsr exit_hypervisor
    rts
}
SYSCALL28: {
    jsr exit_hypervisor
    rts
}
SYSCALL27: {
    jsr exit_hypervisor
    rts
}
SYSCALL26: {
    jsr exit_hypervisor
    rts
}
SYSCALL25: {
    jsr exit_hypervisor
    rts
}
SYSCALL24: {
    jsr exit_hypervisor
    rts
}
SYSCALL23: {
    jsr exit_hypervisor
    rts
}
SYSCALL22: {
    jsr exit_hypervisor
    rts
}
SYSCALL21: {
    jsr exit_hypervisor
    rts
}
SYSCALL20: {
    jsr exit_hypervisor
    rts
}
SYSCALL1F: {
    jsr exit_hypervisor
    rts
}
SYSCALL1E: {
    jsr exit_hypervisor
    rts
}
SYSCALL1D: {
    jsr exit_hypervisor
    rts
}
SYSCALL1C: {
    jsr exit_hypervisor
    rts
}
SYSCALL1B: {
    jsr exit_hypervisor
    rts
}
SYSCALL1A: {
    jsr exit_hypervisor
    rts
}
SYSCALL19: {
    jsr exit_hypervisor
    rts
}
SYSCALL18: {
    jsr exit_hypervisor
    rts
}
SYSCALL17: {
    jsr exit_hypervisor
    rts
}
SYSCALL16: {
    jsr exit_hypervisor
    rts
}
SYSCALL15: {
    jsr exit_hypervisor
    rts
}
SYSCALL14: {
    jsr exit_hypervisor
    rts
}
SYSCALL13: {
    jsr exit_hypervisor
    rts
}
SECUREXIT: {
    jsr exit_hypervisor
    rts
}
SECURENTR: {
    jsr exit_hypervisor
    rts
}
SYSCALL10: {
    jsr exit_hypervisor
    rts
}
SYSCALL0F: {
    jsr exit_hypervisor
    rts
}
SYSCALL0E: {
    jsr exit_hypervisor
    rts
}
SYSCALL0D: {
    jsr exit_hypervisor
    rts
}
SYSCALL0C: {
    jsr exit_hypervisor
    rts
}
SYSCALL0B: {
    jsr exit_hypervisor
    rts
}
SYSCALL0A: {
    jsr exit_hypervisor
    rts
}
SYSCALL09: {
    jsr exit_hypervisor
    rts
}
SYSCALL08: {
    jsr exit_hypervisor
    rts
}
SYSCALL07: {
    jsr exit_hypervisor
    rts
}
SYSCALL06: {
    jsr exit_hypervisor
    rts
}
SYSCALL05: {
    jsr exit_hypervisor
    rts
}
SYSCALL04: {
    jsr exit_hypervisor
    rts
}
SYSCALL03: {
    jsr exit_hypervisor
    rts
}
SYSCALL02: {
    lda #<$300
    sta.z print_to_screen.message
    lda #>$300
    sta.z print_to_screen.message+1
    jsr print_to_screen
    jsr print_newline
    jsr exit_hypervisor
    rts
}
print_newline: {
    lda #$28
    clc
    adc.z current_screen_line
    sta.z current_screen_line
    bcc !+
    inc.z current_screen_line+1
  !:
    lda #0
    sta.z current_screen_x
    rts
}
// print_to_screen(byte* zeropage(4) message)
print_to_screen: {
    .label message = 4
  __b1:
    ldy #0
    lda (message),y
    cmp #0
    bne __b2
    rts
  __b2:
    ldy #0
    lda (message),y
    ldy.z current_screen_x
    sta (current_screen_line),y
    inc.z message
    bne !+
    inc.z message+1
  !:
    inc.z current_screen_x
    jmp __b1
}
SYSCALL01: {
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    jsr print_newline
    jsr exit_hypervisor
    rts
  .segment Data
    message: .text "syscall01 entered"
    .byte 0
}
.segment Code
SYSCALL00: {
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    jsr print_newline
    jsr exit_hypervisor
    rts
  .segment Data
    message: .text "syscall00 entered"
    .byte 0
}
.segment Code
RESET: {
    .label sc = 9
    .label msg = 7
    lda #<$400
    sta.z current_screen_line
    lda #>$400
    sta.z current_screen_line+1
    lda #0
    sta.z current_screen_x
    lda #$14
    sta VIC_MEMORY
    ldx #' '
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #WHITE
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #<SCREEN
    sta.z sc
    lda #>SCREEN
    sta.z sc+1
    lda #<MESSAGE
    sta.z msg
    lda #>MESSAGE
    sta.z msg+1
  __b1:
    ldy #0
    lda (msg),y
    cmp #0
    bne __b2
    jsr print_newline
    jsr start_simple_program
    rts
  __b2:
    ldy #0
    lda (msg),y
    sta (sc),y
    inc.z sc
    bne !+
    inc.z sc+1
  !:
    inc.z msg
    bne !+
    inc.z msg+1
  !:
    jmp __b1
}
start_simple_program: {
    lda #<$80d
    sta $d648
    lda #>$80d
    sta $d648+1
    lda #$80
    sta $300
    lda #0
    sta $301
    lda #$81
    sta $302
    lda #0
    sta $303
    sta $304
    sta $305
    sta $306
    lda #$60
    sta $307
    lda #2
    sta $308
    lda #0
    sta $309
    lda #2
    sta $30a
    lda #1
    sta $30b
    lda #8
    sta $30c
    lda #0
    sta $30d
    sta $30e
    sta $30f
    lda #$60
    sta $310
    lda #3
    sta $d701
    lda #0
    sta $d702
    sta $d705
    jsr exit_hypervisor
    rts
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage(9) str, byte register(X) c, word zeropage(7) num)
memset: {
    .label end = 7
    .label dst = 9
    .label num = 7
    .label str = 9
    lda.z num
    bne !+
    lda.z num+1
    beq __breturn
  !:
    lda.z end
    clc
    adc.z str
    sta.z end
    lda.z end+1
    adc.z str+1
    sta.z end+1
  __b2:
    lda.z dst+1
    cmp.z end+1
    bne __b3
    lda.z dst
    cmp.z end
    bne __b3
  __breturn:
    rts
  __b3:
    txa
    ldy #0
    sta (dst),y
    inc.z dst
    bne !+
    inc.z dst+1
  !:
    jmp __b2
}
.segment Data
  MESSAGE: .text "checkpoint 4.4  liew0093"
  .byte 0
.segment Syscall
  SYSCALLS: .byte JMP
  .word SYSCALL00
  .byte NOP, JMP
  .word SYSCALL01
  .byte NOP, JMP
  .word SYSCALL02
  .byte NOP, JMP
  .word SYSCALL03
  .byte NOP, JMP
  .word SYSCALL04
  .byte NOP, JMP
  .word SYSCALL05
  .byte NOP, JMP
  .word SYSCALL06
  .byte NOP, JMP
  .word SYSCALL07
  .byte NOP, JMP
  .word SYSCALL08
  .byte NOP, JMP
  .word SYSCALL09
  .byte NOP, JMP
  .word SYSCALL0A
  .byte NOP, JMP
  .word SYSCALL0B
  .byte NOP, JMP
  .word SYSCALL0C
  .byte NOP, JMP
  .word SYSCALL0D
  .byte NOP, JMP
  .word SYSCALL0E
  .byte NOP, JMP
  .word SYSCALL0F
  .byte NOP, JMP
  .word SYSCALL10
  .byte NOP, JMP
  .word SECURENTR
  .byte NOP, JMP
  .word SECUREXIT
  .byte NOP, JMP
  .word SYSCALL13
  .byte NOP, JMP
  .word SYSCALL14
  .byte NOP, JMP
  .word SYSCALL15
  .byte NOP, JMP
  .word SYSCALL16
  .byte NOP, JMP
  .word SYSCALL17
  .byte NOP, JMP
  .word SYSCALL18
  .byte NOP, JMP
  .word SYSCALL19
  .byte NOP, JMP
  .word SYSCALL1A
  .byte NOP, JMP
  .word SYSCALL1B
  .byte NOP, JMP
  .word SYSCALL1C
  .byte NOP, JMP
  .word SYSCALL1D
  .byte NOP, JMP
  .word SYSCALL1E
  .byte NOP, JMP
  .word SYSCALL1F
  .byte NOP, JMP
  .word SYSCALL20
  .byte NOP, JMP
  .word SYSCALL21
  .byte NOP, JMP
  .word SYSCALL22
  .byte NOP, JMP
  .word SYSCALL23
  .byte NOP, JMP
  .word SYSCALL24
  .byte NOP, JMP
  .word SYSCALL25
  .byte NOP, JMP
  .word SYSCALL26
  .byte NOP, JMP
  .word SYSCALL27
  .byte NOP, JMP
  .word SYSCALL28
  .byte NOP, JMP
  .word SYSCALL29
  .byte NOP, JMP
  .word SYSCALL2A
  .byte NOP, JMP
  .word SYSCALL2B
  .byte NOP, JMP
  .word SYSCALL2C
  .byte NOP, JMP
  .word SYSCALL2D
  .byte NOP, JMP
  .word SYSCALL2E
  .byte NOP, JMP
  .word SYSCALL2F
  .byte NOP, JMP
  .word SYSCALL30
  .byte NOP, JMP
  .word SYSCALL31
  .byte NOP, JMP
  .word SYSCALL32
  .byte NOP, JMP
  .word SYSCALL33
  .byte NOP, JMP
  .word SYSCALL34
  .byte NOP, JMP
  .word SYSCALL35
  .byte NOP, JMP
  .word SYSCALL36
  .byte NOP, JMP
  .word SYSCALL37
  .byte NOP, JMP
  .word SYSCALL38
  .byte NOP, JMP
  .word SYSCALL39
  .byte NOP, JMP
  .word SYSCALL3A
  .byte NOP, JMP
  .word SYSCALL3B
  .byte NOP, JMP
  .word SYSCALL3C
  .byte NOP, JMP
  .word SYSCALL3D
  .byte NOP, JMP
  .word SYSCALL3E
  .byte NOP, JMP
  .word SYSCALL3F
  .byte NOP
  .align $100
  TRAPS: .byte JMP
  .word RESET
  .byte NOP, JMP
  .word PAGFAULT
  .byte NOP, JMP
  .word RESTORKEY
  .byte NOP, JMP
  .word ALTTABKEY
  .byte NOP, JMP
  .word VF011RD
  .byte NOP, JMP
  .word VF011WR
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word undefined_trap
  .byte NOP, JMP
  .word CPUKIL
  .byte NOP
