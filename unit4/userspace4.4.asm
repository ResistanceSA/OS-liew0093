.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
main: {
    jsr print_string
  __b1:
    jmp __b1
    string: .text "printed via print string api"
    .byte 0
}
print_string: {
    jsr enable_syscalls
    lda #0
    sta $d642
    lda main.string
    sta $301
    rts
}
enable_syscalls: {
    lda #$47
    sta $d02f
    lda #$53
    sta $d02f
    rts
}
