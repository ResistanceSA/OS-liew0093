.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
  .const OFFSET_STRUCT_IPC_MESSAGE_TO = 1
  .const OFFSET_STRUCT_IPC_MESSAGE_PRIORITY = 2
  .const OFFSET_STRUCT_IPC_MESSAGE_SEQUENCE = 3
  .const OFFSET_STRUCT_IPC_MESSAGE_MESSAGE = 4
main: {
    lda #<message
    sta.z ipc_send.message
    lda #>message
    sta.z ipc_send.message+1
    ldx #$ff
    jsr ipc_send
    lda #<message1
    sta.z ipc_send.message
    lda #>message1
    sta.z ipc_send.message+1
    ldx #$c8
    jsr ipc_send
    lda #<message2
    sta.z ipc_send.message
    lda #>message2
    sta.z ipc_send.message+1
    ldx #$c7
    jsr ipc_send
    lda #<message3
    sta.z ipc_send.message
    lda #>message3
    sta.z ipc_send.message+1
    ldx #$c6
    jsr ipc_send
    lda #<message2
    sta.z ipc_send.message
    lda #>message2
    sta.z ipc_send.message+1
    ldx #1
    jsr ipc_send
    lda #<message5
    sta.z ipc_send.message
    lda #>message5
    sta.z ipc_send.message+1
    ldx #$64
    jsr ipc_send
    lda #<message6
    sta.z ipc_send.message
    lda #>message6
    sta.z ipc_send.message+1
    ldx #$f0
    jsr ipc_send
  __b1:
    jsr yield
    jmp __b1
    message: .text "checkpoint  "
    .byte 0
    message1: .text "4           "
    .byte 0
    message2: .text "------------"
    .byte 0
    message3: .text "moremessages"
    .byte 0
    message5: .text "3           "
    .byte 0
    message6: .text "6.          "
    .byte 0
}
yield: {
    jsr enable_syscalls
    lda #0
    sta $d645
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
// ipc_send(byte register(X) priority, byte* zeropage(2) message)
ipc_send: {
    .label ipc_messages = $cb00
    .label __9 = 7
    .label ipc_message_count = 4
    .label m = 5
    .label message = 2
    lda #0
    sta.z ipc_message_count
    asl
    asl
    asl
    asl
    clc
    adc #<ipc_messages
    sta.z m
    lda #>ipc_messages
    adc #0
    sta.z m+1
    lda #1
    ldy #OFFSET_STRUCT_IPC_MESSAGE_TO
    sta (m),y
    ldy #OFFSET_STRUCT_IPC_MESSAGE_PRIORITY
    txa
    sta (m),y
    lda #1
    ldy #OFFSET_STRUCT_IPC_MESSAGE_SEQUENCE
    sta (m),y
    ldx #0
  __b1:
    cpx #$c
    bcc __b2
    jsr enable_syscalls
    lda #0
    sta $d64a
    rts
  __b2:
    lda #OFFSET_STRUCT_IPC_MESSAGE_MESSAGE
    clc
    adc.z m
    sta.z __9
    lda #0
    adc.z m+1
    sta.z __9+1
    stx.z $ff
    txa
    tay
    lda (message),y
    sta (__9),y
    inx
    jmp __b1
}
