.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
main: {
    jsr call_SYSCALL00
    jsr call_SYSCALL01
  b1:
    jmp b1
}
call_SYSCALL01: {
    jsr enable_syscalls
    lda #0
    sta $d641
    nop
    rts
}
enable_syscalls: {
    lda #$47
    sta $d62f
    lda #$53
    sta $d62f
    rts
}
call_SYSCALL00: {
    jsr enable_syscalls
    lda #0
    sta $d640
    nop
    rts
}
