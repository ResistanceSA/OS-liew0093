  .file [name="checkpoint3.4.bin", type="bin", segments="XMega65Bin"]
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
  .label current_screen_x = 6
  .label current_screen_line = 7
  .label current_screen_line_41 = 4
  .label current_screen_line_78 = 4
  .label current_screen_line_79 = 4
  .label current_screen_line_80 = 4
  .label current_screen_line_81 = 4
  .label current_screen_line_82 = 4
  .label current_screen_line_83 = 4
  .label current_screen_line_84 = 4
  .label current_screen_line_85 = 4
  .label current_screen_line_86 = 4
  .label current_screen_line_87 = 4
  .label current_screen_line_88 = 4
.segment Code
main: {
    jsr exit_hypervisor
    rts
}
exit_hypervisor: {
    //Trigger exit from Hypervisor mode
    lda #1
    sta $d67f
    rts
}
CPUKIL: {
    jsr exit_hypervisor
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
    jsr exit_hypervisor
    rts
}
SYSCALL01: {
    jsr exit_hypervisor
    rts
}
SYSCALL00: {
    jsr exit_hypervisor
    rts
}
RESET: {
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
    lda #0
    sta.z current_screen_x
    lda #<$400
    sta.z current_screen_line_41
    lda #>$400
    sta.z current_screen_line_41+1
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda #<$400
    sta.z current_screen_line
    lda #>$400
    sta.z current_screen_line+1
    jsr print_newline
    lda.z current_screen_line
    sta.z current_screen_line_78
    lda.z current_screen_line+1
    sta.z current_screen_line_78+1
    lda #0
    sta.z current_screen_x
    lda #<message1
    sta.z print_to_screen.message
    lda #>message1
    sta.z print_to_screen.message+1
    jsr print_to_screen
    jsr print_newline
    jsr test_memory
    jsr print_newline
    jsr detect_devices
    jsr exit_hypervisor
    rts
  .segment Data
    message: .text "liew0093 operating system starting..."
    .byte 0
    message1: .text "testing hardware"
    .byte 0
}
.segment Code
detect_devices: {
    .label p = 2
    lda #<$d000
    sta.z p
    lda #>$d000
    sta.z p+1
    ldx #0
  b1:
    lda.z p+1
    cmp #>$dff0
    bcc b2
    bne !+
    lda.z p
    cmp #<$dff0
    bcc b2
  !:
    lda.z current_screen_line
    sta.z current_screen_line_81
    lda.z current_screen_line+1
    sta.z current_screen_line_81+1
    lda #0
    sta.z current_screen_x
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    rts
  b2:
    txa
    ldy #0
    sta (p),y
  b4:
    txa
    ldy #0
    cmp (p),y
    beq b5
    jsr detect_vicii
    lda.z current_screen_line
    sta.z current_screen_line_79
    lda.z current_screen_line+1
    sta.z current_screen_line_79+1
    lda #<message1
    sta.z print_to_screen.message
    lda #>message1
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    jsr print_newline
    lda.z current_screen_line
    sta.z current_screen_line_80
    lda.z current_screen_line+1
    sta.z current_screen_line_80+1
    lda #0
    sta.z current_screen_x
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    rts
  b5:
    inx
    cpx #0
    bne b4
    lda #$a
    clc
    adc.z p
    sta.z p
    bcc !+
    inc.z p+1
  !:
    jmp b1
  .segment Data
    message: .text "finished probing devices"
    .byte 0
    message1: .text "vic-ii detected at $"
    .byte 0
}
.segment Code
// print_to_screen(byte* zeropage($b) message)
print_to_screen: {
    .label message = $b
  b1:
    ldy #0
    lda (message),y
    cmp #0
    bne b2
    rts
  b2:
    ldy #0
    lda (message),y
    ldy.z current_screen_x
    sta (current_screen_line_41),y
    inc.z message
    bne !+
    inc.z message+1
  !:
    inc.z current_screen_x
    jmp b1
}
print_newline: {
    lda #$28
    clc
    adc.z current_screen_line
    sta.z current_screen_line
    bcc !+
    inc.z current_screen_line+1
  !:
    rts
}
// print_hex(word zeropage($b) value)
print_hex: {
    .label _3 = $f
    .label _6 = $11
    .label value = $b
    ldx #0
  b1:
    cpx #4
    bcc b2
    lda #0
    sta hex+4
    lda.z current_screen_line
    sta.z current_screen_line_83
    lda.z current_screen_line+1
    sta.z current_screen_line_83+1
    lda #<hex
    sta.z print_to_screen.message
    lda #>hex
    sta.z print_to_screen.message+1
    jsr print_to_screen
    rts
  b2:
    lda.z value+1
    cmp #>$a000
    bcc b4
    bne !+
    lda.z value
    cmp #<$a000
    bcc b4
  !:
    ldy #$c
    lda.z value
    sta.z _3
    lda.z value+1
    sta.z _3+1
    cpy #0
    beq !e+
  !:
    lsr.z _3+1
    ror.z _3
    dey
    bne !-
  !e:
    lda.z _3
    sec
    sbc #9
    sta hex,x
  b5:
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    inx
    jmp b1
  b4:
    ldy #$c
    lda.z value
    sta.z _6
    lda.z value+1
    sta.z _6+1
    cpy #0
    beq !e+
  !:
    lsr.z _6+1
    ror.z _6
    dey
    bne !-
  !e:
    lda.z _6
    clc
    adc #'0'
    sta hex,x
    jmp b5
  .segment Data
    hex: .fill 5, 0
}
.segment Code
detect_vicii: {
    .const address = $d800
    .label p = $d
    .label v2 = $13
    .label i = $b
    // POinter where VIC-II is suspected to be
    lda #<address
    sta.z p
    lda #>address
    sta.z p+1
    ldy #$12
    lda (p),y
    tax
    lda #<1
    sta.z i
    lda #>1
    sta.z i+1
  //Read start address + $12
  //wait 64 microseconds
  b1:
    lda.z i+1
    cmp #>$3e8
    bcc b3
    bne !+
    lda.z i
    cmp #<$3e8
    bcc b3
  !:
    ldy #$12
    lda (p),y
    sta.z v2
    cpx.z v2
    bcs b2
    lda.z current_screen_line
    sta.z current_screen_line_82
    lda.z current_screen_line+1
    sta.z current_screen_line_82+1
    lda #0
    sta.z current_screen_x
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    rts
  b2:
    lda #0
    sta.z current_screen_x
    rts
  b3:
    inc.z i
    bne !+
    inc.z i+1
  !:
    jmp b1
  .segment Data
    message: .text "Seems to be a VIC-II here"
    .byte 0
}
.segment Code
test_memory: {
    .const mem_start = $800
    .label p = 9
    .label mem_end = $14
    lda #<$800
    sta.z p
    lda #>$800
    sta.z p+1
  b1:
    lda.z p+1
    cmp #>$8000
    bcc b2
    bne !+
    lda.z p
    cmp #<$8000
    bcc b2
  !:
    lda.z current_screen_line
    sta.z current_screen_line_87
    lda.z current_screen_line+1
    sta.z current_screen_line_87+1
    lda #0
    sta.z current_screen_x
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda #<mem_start
    sta.z print_hex.value
    lda #>mem_start
    sta.z print_hex.value+1
    jsr print_hex
    lda.z current_screen_line
    sta.z current_screen_line_84
    lda.z current_screen_line+1
    sta.z current_screen_line_84+1
    lda #<message1
    sta.z print_to_screen.message
    lda #>message1
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda #<$7fff
    sta.z print_hex.value
    lda #>$7fff
    sta.z print_hex.value+1
    jsr print_hex
    rts
  b2:
    lda #0
  b3:
    ldy #0
    sta (p),y
    cmp (p),y
    beq b4
    lda.z current_screen_line
    sta.z current_screen_line_88
    lda.z current_screen_line+1
    sta.z current_screen_line_88+1
    tya
    sta.z current_screen_x
    lda #<message2
    sta.z print_to_screen.message
    lda #>message2
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda.z p
    sta.z print_hex.value
    lda.z p+1
    sta.z print_hex.value+1
    jsr print_hex
    jsr print_newline
    lda.z p
    sec
    sbc #1
    sta.z mem_end
    lda.z p+1
    sbc #0
    sta.z mem_end+1
    lda.z current_screen_line
    sta.z current_screen_line_85
    lda.z current_screen_line+1
    sta.z current_screen_line_85+1
    lda #0
    sta.z current_screen_x
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda #<mem_start
    sta.z print_hex.value
    lda #>mem_start
    sta.z print_hex.value+1
    jsr print_hex
    lda.z current_screen_line
    sta.z current_screen_line_86
    lda.z current_screen_line+1
    sta.z current_screen_line_86+1
    lda #<message1
    sta.z print_to_screen.message
    lda #>message1
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda.z mem_end
    sta.z print_hex.value
    lda.z mem_end+1
    sta.z print_hex.value+1
    jsr print_hex
    rts
  b4:
    clc
    adc #1
    cmp #$ff
    bcs !b3+
    jmp b3
  !b3:
    inc.z p
    bne !+
    inc.z p+1
  !:
    jmp b1
  .segment Data
    message: .text "memory found at $"
    .byte 0
    message1: .text " - $"
    .byte 0
    message2: .text "memory error at $"
    .byte 0
}
.segment Code
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage($f) str, byte register(X) c, word zeropage($b) num)
memset: {
    .label end = $b
    .label dst = $f
    .label num = $b
    .label str = $f
    lda.z num
    bne !+
    lda.z num+1
    beq breturn
  !:
    lda.z end
    clc
    adc.z str
    sta.z end
    lda.z end+1
    adc.z str+1
    sta.z end+1
  b2:
    lda.z dst+1
    cmp.z end+1
    bne b3
    lda.z dst
    cmp.z end
    bne b3
  breturn:
    rts
  b3:
    txa
    ldy #0
    sta (dst),y
    inc.z dst
    bne !+
    inc.z dst+1
  !:
    jmp b2
}
.segment Syscall
SYSCALLS:
  .byte JMP
  .word SYSCALL00
  .byte NOP
  .byte JMP
  .word SYSCALL01
  .byte NOP
  .byte JMP
  .word SYSCALL02
  .byte NOP
  .byte JMP
  .word SYSCALL03
  .byte NOP
  .byte JMP
  .word SYSCALL04
  .byte NOP
  .byte JMP
  .word SYSCALL05
  .byte NOP
  .byte JMP
  .word SYSCALL06
  .byte NOP
  .byte JMP
  .word SYSCALL07
  .byte NOP
  .byte JMP
  .word SYSCALL08
  .byte NOP
  .byte JMP
  .word SYSCALL09
  .byte NOP
  .byte JMP
  .word SYSCALL0A
  .byte NOP
  .byte JMP
  .word SYSCALL0B
  .byte NOP
  .byte JMP
  .word SYSCALL0C
  .byte NOP
  .byte JMP
  .word SYSCALL0D
  .byte NOP
  .byte JMP
  .word SYSCALL0E
  .byte NOP
  .byte JMP
  .word SYSCALL0F
  .byte NOP
  .byte JMP
  .word SYSCALL10
  .byte NOP
  .byte JMP
  .word SECURENTR
  .byte NOP
  .byte JMP
  .word SECUREXIT
  .byte NOP
  .byte JMP
  .word SYSCALL13
  .byte NOP
  .byte JMP
  .word SYSCALL14
  .byte NOP
  .byte JMP
  .word SYSCALL15
  .byte NOP
  .byte JMP
  .word SYSCALL16
  .byte NOP
  .byte JMP
  .word SYSCALL17
  .byte NOP
  .byte JMP
  .word SYSCALL18
  .byte NOP
  .byte JMP
  .word SYSCALL19
  .byte NOP
  .byte JMP
  .word SYSCALL1A
  .byte NOP
  .byte JMP
  .word SYSCALL1B
  .byte NOP
  .byte JMP
  .word SYSCALL1C
  .byte NOP
  .byte JMP
  .word SYSCALL1D
  .byte NOP
  .byte JMP
  .word SYSCALL1E
  .byte NOP
  .byte JMP
  .word SYSCALL1F
  .byte NOP
  .byte JMP
  .word SYSCALL20
  .byte NOP
  .byte JMP
  .word SYSCALL21
  .byte NOP
  .byte JMP
  .word SYSCALL22
  .byte NOP
  .byte JMP
  .word SYSCALL23
  .byte NOP
  .byte JMP
  .word SYSCALL24
  .byte NOP
  .byte JMP
  .word SYSCALL25
  .byte NOP
  .byte JMP
  .word SYSCALL26
  .byte NOP
  .byte JMP
  .word SYSCALL27
  .byte NOP
  .byte JMP
  .word SYSCALL28
  .byte NOP
  .byte JMP
  .word SYSCALL29
  .byte NOP
  .byte JMP
  .word SYSCALL2A
  .byte NOP
  .byte JMP
  .word SYSCALL2B
  .byte NOP
  .byte JMP
  .word SYSCALL2C
  .byte NOP
  .byte JMP
  .word SYSCALL2D
  .byte NOP
  .byte JMP
  .word SYSCALL2E
  .byte NOP
  .byte JMP
  .word SYSCALL2F
  .byte NOP
  .byte JMP
  .word SYSCALL30
  .byte NOP
  .byte JMP
  .word SYSCALL31
  .byte NOP
  .byte JMP
  .word SYSCALL32
  .byte NOP
  .byte JMP
  .word SYSCALL33
  .byte NOP
  .byte JMP
  .word SYSCALL34
  .byte NOP
  .byte JMP
  .word SYSCALL35
  .byte NOP
  .byte JMP
  .word SYSCALL36
  .byte NOP
  .byte JMP
  .word SYSCALL37
  .byte NOP
  .byte JMP
  .word SYSCALL38
  .byte NOP
  .byte JMP
  .word SYSCALL39
  .byte NOP
  .byte JMP
  .word SYSCALL3A
  .byte NOP
  .byte JMP
  .word SYSCALL3B
  .byte NOP
  .byte JMP
  .word SYSCALL3C
  .byte NOP
  .byte JMP
  .word SYSCALL3D
  .byte NOP
  .byte JMP
  .word SYSCALL3E
  .byte NOP
  .byte JMP
  .word SYSCALL3F
  .byte NOP
  .align $100
TRAPS:
  .byte JMP
  .word RESET
  .byte NOP
  .byte JMP
  .word PAGFAULT
  .byte NOP
  .byte JMP
  .word RESTORKEY
  .byte NOP
  .byte JMP
  .word ALTTABKEY
  .byte NOP
  .byte JMP
  .word VF011RD
  .byte NOP
  .byte JMP
  .word VF011WR
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word undefined_trap
  .byte NOP
  .byte JMP
  .word CPUKIL
  .byte NOP
