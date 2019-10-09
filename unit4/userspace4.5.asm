.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
main: {
    lda #<string
    sta.z print_string.messa
    lda #>string
    sta.z print_string.messa+1
    jsr print_string
    jsr get_os_version
    lda #<os_version_return
    sta.z print_string.messa
    lda #>os_version_return
    sta.z print_string.messa+1
    jsr print_string
  __b1:
    jmp __b1
    string: .text "os version: "
    .byte 0
    //	call_syscall00();
    //	call_syscall01();
    os_version_return: .text ""
    .byte 0
    .fill $ff, 0
}
print_string: {
    // enable_syscalls();
    .label messa = 2
    .label __3 = 8
    .label i = 6
    .label __4 = 4
    lda #<0
    sta.z i
    sta.z i+1
  __b1:
    lda.z i+1
    cmp #>$ff
    bcc __b2
    bne !+
    lda.z i
    cmp #<$ff
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
    lda.z messa
    clc
    adc.z i
    sta.z __4
    lda.z messa+1
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
get_os_version: {
    .label __5 = 6
    .label i = 2
    .label __7 = 8
    jsr enable_syscalls
    lda #<0
    sta.z i
    sta.z i+1
  __b1:
    lda.z i+1
    cmp #>$100
    bcc __b2
    bne !+
    lda.z i
    cmp #<$100
    bcc __b2
  !:
    jsr call_syscall03
    rts
  __b2:
    lda #<$300
    clc
    adc.z i
    sta.z __5
    lda #>$300
    adc.z i+1
    sta.z __5+1
    lda #<os_version_return
    clc
    adc.z i
    sta.z __7
    lda #>os_version_return
    adc.z i+1
    sta.z __7+1
    ldy #0
    lda (__7),y
    sta (__5),y
    inc.z i
    bne !+
    inc.z i+1
  !:
    jmp __b1
    os_version_return: .text "vinoos 0.1"
    .byte 0
    .fill $f5, 0
}
call_syscall03: {
    jsr enable_syscalls
    lda #0
    sta $d643
    nop
    rts
}
