.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
main: {
    jsr call_syscall02
    jsr print_string
    rts
    string: .text "printed via print string api"
    .byte 0
}
print_string: {
    lda main.string
    sta $301
    nop
    rts
}
call_syscall02: {
    jsr enable_syscalls
    lda #0
    sta $d641
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
