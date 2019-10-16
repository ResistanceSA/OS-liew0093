// XMega65 Kernal Development Template
// Each function of the kernal is a no-args function
// The functions are placed in the SYSCALLS table surrounded by JMP and NOP
  .file [name="os5.2.bin", type="bin", segments="XMega65Bin"]
.segmentdef XMega65Bin [segments="Syscall, Code, Data, Stack, Zeropage"]
.segmentdef Syscall [start=$8000, max=$81ff]
.segmentdef Code [start=$8200, min=$8200, max=$bdff]
.segmentdef Data [startAfter="Code", min=$8200, max=$bdff]
.segmentdef Stack [min=$be00, max=$beff, fill]
.segmentdef Zeropage [min=$bf00, max=$bfff, fill]

  .const SIZEOF_WORD = 2
  .const OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_NAME = 2
  .const OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS = 4
  .const OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS = 8
  .const OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORED_STATE = $c
  .const OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_STATE = 1
  .label RASTER = $d012
  .label VIC_MEMORY = $d018
  .label SCREEN = $400
  .label BGCOL = $d021
  .label COLS = $d800
  .const BLUE = 6
  .const WHITE = 1
  .const STATE_NOTRUNNING = 0
  // Process stored state will live at $C000-$C7FF, with 256 bytes
  // for each process reserved
  .label stored_pdbs = $c000
  // 8 processes x 16 bytes = 128 bytes for names
  .label process_names = $c800
  // 8 processes x 64 bytes context state = 512 bytes
  .label process_context_states = $c900
  .const JMP = $4c
  .const NOP = $ea
  .label current_screen_line = 9
  .label current_screen_x = $b
  .label pid_counter = $c
  lda #<SCREEN
  sta.z current_screen_line
  lda #>SCREEN
  sta.z current_screen_line+1
  lda #0
  sta.z current_screen_x
  sta.z pid_counter
  jsr main
  rts
.segment Code
main: {
    rts
}
RESET: {
    .label sc = $11
    .label msg = 7
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
    sta.z current_screen_line
    lda #>SCREEN
    sta.z current_screen_line+1
    lda #<SCREEN+$28
    sta.z sc
    lda #>SCREEN+$28
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
    jsr print_newline
    jsr print_newline
    jsr initialise_pdb
    jsr describe_pdb
  __b4:
    lda #$36
    cmp RASTER
    beq __b5
    lda #$42
    cmp RASTER
    beq __b5
    lda #BLUE
    sta BGCOL
    jmp __b4
  __b5:
    lda #WHITE
    sta BGCOL
    jmp __b4
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
  .segment Data
    name: .text "program1.prg"
    .byte 0
}
.segment Code
describe_pdb: {
    .label p = stored_pdbs
    .label n = $11
    .label ss = 7
    lda #<message
    sta.z print_to_screen.c
    lda #>message
    sta.z print_to_screen.c+1
    jsr print_to_screen
    lda #<0
    sta.z print_hex.value
    sta.z print_hex.value+1
    jsr print_hex
    lda #<message1
    sta.z print_to_screen.c
    lda #>message1
    sta.z print_to_screen.c+1
    jsr print_to_screen
    jsr print_newline
    lda #<message2
    sta.z print_to_screen.c
    lda #>message2
    sta.z print_to_screen.c+1
    jsr print_to_screen
    lda p
    sta.z print_hex.value
    lda #0
    sta.z print_hex.value+1
    jsr print_hex
    jsr print_newline
    lda #<message3
    sta.z print_to_screen.c
    lda #>message3
    sta.z print_to_screen.c+1
    jsr print_to_screen
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_NAME
    sta.z n
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_NAME+1
    sta.z n+1
    ldx #0
  __b1:
    txa
    tay
    lda (n),y
    cmp #0
    beq __b3
    cpx #$11
    bcc __b2
  __b3:
    jsr print_newline
    lda #<message4
    sta.z print_to_screen.c
    lda #>message4
    sta.z print_to_screen.c+1
    jsr print_to_screen
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS
    sta.z print_dhex.value
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS+1
    sta.z print_dhex.value+1
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS+2
    sta.z print_dhex.value+2
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS+3
    sta.z print_dhex.value+3
    jsr print_dhex
    jsr print_newline
    lda #<message5
    sta.z print_to_screen.c
    lda #>message5
    sta.z print_to_screen.c+1
    jsr print_to_screen
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS
    sta.z print_dhex.value
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS+1
    sta.z print_dhex.value+1
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS+2
    sta.z print_dhex.value+2
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS+3
    sta.z print_dhex.value+3
    jsr print_dhex
    jsr print_newline
    lda #<message6
    sta.z print_to_screen.c
    lda #>message6
    sta.z print_to_screen.c+1
    jsr print_to_screen
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORED_STATE
    sta.z ss
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORED_STATE+1
    sta.z ss+1
    ldy #4*SIZEOF_WORD
    lda (print_hex.value),y
    pha
    iny
    lda (print_hex.value),y
    sta.z print_hex.value+1
    pla
    sta.z print_hex.value
    jsr print_hex
    jsr print_newline
    rts
  __b2:
    txa
    tay
    lda (n),y
    jsr print_char
    inx
    jmp __b1
  .segment Data
    message: .text "pdb#"
    .byte 0
    message1: .text ":"
    .byte 0
    message2: .text "  pid:          "
    .byte 0
    message3: .text "  process name: "
    .byte 0
    message4: .text "  mem start:    $"
    .byte 0
    message5: .text "  mem end:      $"
    .byte 0
    message6: .text "  pc:           $"
    .byte 0
}
.segment Code
// print_char(byte register(A) c)
print_char: {
    ldy.z current_screen_x
    sta (current_screen_line),y
    inc.z current_screen_x
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
// print_hex(word zeropage(7) value)
print_hex: {
    .label __3 = $13
    .label __6 = $11
    .label value = 7
    ldx #0
  __b1:
    cpx #8
    bcc __b2
    lda #0
    sta hex+4
    lda #<hex
    sta.z print_to_screen.c
    lda #>hex
    sta.z print_to_screen.c+1
    jsr print_to_screen
    rts
  __b2:
    lda.z value+1
    cmp #>$a000
    bcc __b4
    bne !+
    lda.z value
    cmp #<$a000
    bcc __b4
  !:
    ldy #$c
    lda.z value
    sta.z __3
    lda.z value+1
    sta.z __3+1
    cpy #0
    beq !e+
  !:
    lsr.z __3+1
    ror.z __3
    dey
    bne !-
  !e:
    lda.z __3
    sec
    sbc #9
    sta hex,x
  __b5:
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    inx
    jmp __b1
  __b4:
    ldy #$c
    lda.z value
    sta.z __6
    lda.z value+1
    sta.z __6+1
    cpy #0
    beq !e+
  !:
    lsr.z __6+1
    ror.z __6
    dey
    bne !-
  !e:
    lda.z __6
    clc
    adc #'0'
    sta hex,x
    jmp __b5
  .segment Data
    hex: .fill 5, 0
}
.segment Code
print_to_screen: {
    .label c = $11
  __b1:
    ldy #0
    lda (c),y
    cmp #0
    bne __b2
    rts
  __b2:
    ldy #0
    lda (c),y
    ldy.z current_screen_x
    sta (current_screen_line),y
    inc.z current_screen_x
    inc.z c
    bne !+
    inc.z c+1
  !:
    jmp __b1
}
// print_dhex(dword zeropage(2) value)
print_dhex: {
    .label __0 = $d
    .label value = 2
    lda #0
    sta.z __0+2
    sta.z __0+3
    lda.z value+3
    sta.z __0+1
    lda.z value+2
    sta.z __0
    sta.z print_hex.value
    lda.z __0+1
    sta.z print_hex.value+1
    jsr print_hex
    lda.z value
    sta.z print_hex.value
    lda.z value+1
    sta.z print_hex.value+1
    jsr print_hex
    rts
}
// Setup a new process descriptor block
initialise_pdb: {
    .label p = stored_pdbs
    .label pn = $13
    .label ss = $11
    jsr next_free_pid
    lda.z next_free_pid.pid
    // Setup process ID
    // XXX - Call the function next_free_pid() to get a process ID for //the 
    //  process in this PDB, and store it in p->process_id
    sta p
    // Setup process name 
    // (32 bytes space for each to fit 16 chars + nul)
    // (we could just use 17 bytes, but kickc can't multiply by 17)
    lda #<process_names
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_NAME
    lda #>process_names
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_NAME+1
    /*  XXX - copy the string in the array 'name' into the array 'p->process_name'
  XXX - To make your life easier, do something like char *pn=p->process_name
        Then you can just do something along the lines of pn[...]=name[...] 
        in a loop to copy the name into place.
        (The arrays are both 17 bytes long)*/
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_NAME
    sta.z pn
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_NAME+1
    sta.z pn+1
    ldy #0
  __b1:
    cpy #$11+1
    bcc __b2
    // Set process state as not running.
    //  XXX - Put the value STATE_NOTRUNNING into p->process_state
    lda #STATE_NOTRUNNING
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_PROCESS_STATE
    // Set stored memory area
    // (for now, we just use fixed 8KB steps from $30000-$3FFFF
    // corresponding to the PDB number
    // XXX - Set p->storage_start_address to the correct start address
    // for a process that is in this PDB.
    lda #<$30000
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS
    lda #>$30000
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS+1
    lda #<$30000>>$10
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS+2
    lda #>$30000>>$10
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_START_ADDRESS+3
    //  XXX - Then do the same for the end address of the process
    // This gets stored into p->process_end_address and the correct
    // address is $31FFF + (((unsigned dword)pdb_number)*$2000);
    lda #<$31fff
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS
    lda #>$31fff
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS+1
    lda #<$31fff>>$10
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS+2
    lda #>$31fff>>$10
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORAGE_END_ADDRESS+3
    // 64 bytes context switching state for each process
    lda #<process_context_states
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORED_STATE
    lda #>process_context_states
    sta p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORED_STATE+1
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORED_STATE
    sta.z ss
    lda p+OFFSET_STRUCT_PROCESS_DESCRIPTOR_BLOCK_STORED_STATE+1
    sta.z ss+1
    ldy #0
  // XXX - Set all 64 bytes of the array 'ss' to zero, to clear the c//ontext
  //switching state
  __b4:
    cpy #$3f
    bcc __b5
    // Set tandard CPU flags (8-bit stack, interrupts disabled)
    lda #$24
    ldy #8
    sta (ss),y
    /*  XXX - Set the stack pointer to $01FF
  (This requires a bit of fiddly pointer arithmetic, so to save you 
  the trouble working it out, you can use the following as the left 
   side of the expression:   *(unsigned short *)&ss[x] = $01FF;
  where x is the offset of the stack pointer low byte (SPL) in the
  Hypervisor saved state registers in Appendix D of the MEGA65 User's
  Guide. i.e., if it were at $D640, x would be replaced with 0, and
  if it were at $D641, x would be replaced with 1, and so on.
  XXX - Note that the MEGA65 User's Guide has been updated on FLO.
  You will required the latest version, as otherwise SPL is not listed. */
    ldy #4
    lda #<$1fff
    sta (ss),y
    iny
    lda #>$1fff
    sta (ss),y
    /*  XXX - Set the program counter to $080D
  (This requires a bit of fiddly pointer arithmetic, so to save you 
  the trouble working it out, you can use the following as the left 
  side of the expression:   *(unsigned short *)&ss[x] = ...
  where x is the offset of the program counter low byte (PCL) in the
  Hypervisor saved state registers in Appendix D of the MEGA65 User's
  Guide. */
    ldy #7
    lda #<$80d
    sta (ss),y
    iny
    lda #>$80d
    sta (ss),y
    rts
  __b5:
    lda #0
    sta (ss),y
    iny
    jmp __b4
  __b2:
    lda RESET.name,y
    sta (pn),y
    iny
    jmp __b1
}
next_free_pid: {
    .label __2 = $13
    .label pid = 6
    .label p = $13
    .label i = 7
    inc.z pid_counter
    // start with the next process ID
    lda.z pid_counter
    sta.z pid
    ldx #1
  __b1:
    cpx #0
    bne b1
    rts
  b1:
    ldx #0
    txa
    sta.z i
    sta.z i+1
  __b2:
    lda.z i+1
    cmp #>8
    bcc __b3
    bne !+
    lda.z i
    cmp #<8
    bcc __b3
  !:
    jmp __b1
  __b3:
    lda.z i
    sta.z __2+1
    lda #0
    sta.z __2
    clc
    lda.z p
    adc #<stored_pdbs
    sta.z p
    lda.z p+1
    adc #>stored_pdbs
    sta.z p+1
    ldy #0
    lda (p),y
    cmp.z pid
    bne __b4
    inc.z pid
    ldx #1
  __b4:
    inc.z i
    bne !+
    inc.z i+1
  !:
    jmp __b2
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage($11) str, byte register(X) c, word zeropage(7) num)
memset: {
    .label end = 7
    .label dst = $11
    .label num = 7
    .label str = $11
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
CPUKIL: {
    jsr exit_hypervisor
    rts
}
exit_hypervisor: {
    // Exit hypervisor
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
.segment Data
  MESSAGE: .text "checkpoint 5.2 liew0093"
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
