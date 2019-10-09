.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
main: {
    jsr print_string
  __b1:
    jmp __b1
    string: .text "printed via printstring api"
    .byte 0
}
print_string: {
    .label __3 = 4
    .label i = 2
    .label __4 = 6
    lda #<0
    sta.z i
    sta.z i+1
  __b1:
    lda.z i+1
    cmp #>$64
    bcc __b2
    bne !+
    lda.z i
    cmp #<$64
    bcc __b2
  !:
    jsr call_syscall02
    rts
  __b2:
    lda #<$300
    clc
    adc.z i
    sta.z __3
    lda #>$300
    adc.z i+1
    sta.z __3+1
    lda #<main.string
    clc
    adc.z i
    sta.z __4
    lda #>main.string
    adc.z i+1
    sta.z __4+1
    ldy #0
    lda (__4),y
    sta (__3),y
    inc.z i
    bne !+
    inc.z i+1
  !:
    jmp __b1
}
call_syscall02: {
    jsr enable_syscalls
    lda #0
    sta $d642
    nop
    rts
}
enable_syscalls: {
    lda #$47
    sta $d02f
    lda #$53
    sta $d02f
    rts
}
