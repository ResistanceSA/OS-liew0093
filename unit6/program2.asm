.pc = $801 "Basic"
:BasicUpstart(main)
.pc = $80d "Program"
  .const OFFSET_STRUCT_IPC_MESSAGE_TO = 1
  .const OFFSET_STRUCT_IPC_MESSAGE_PRIORITY = 2
  .const OFFSET_STRUCT_IPC_MESSAGE_SEQUENCE = 3
  .const OFFSET_STRUCT_IPC_MESSAGE_MESSAGE = 4
main: {
    jsr ipc_send
  __b1:
    jsr yield
    jmp __b1
    message: .text "cpoint 6.2  "
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
ipc_send: {
    .label ipc_messages = $cb00
    .const to = 1
    .const priority = 1
    .const sequence_number = 1
    .label __9 = 5
    .label ipc_message_count = 2
    .label m = 3
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
    lda #to
    ldy #OFFSET_STRUCT_IPC_MESSAGE_TO
    sta (m),y
    lda #priority
    ldy #OFFSET_STRUCT_IPC_MESSAGE_PRIORITY
    sta (m),y
    lda #sequence_number
    ldy #OFFSET_STRUCT_IPC_MESSAGE_SEQUENCE
    sta (m),y
    ldy #0
  __b1:
    cpy #$c
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
    lda main.message,y
    sta (__9),y
    iny
    jmp __b1
}
