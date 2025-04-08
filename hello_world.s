.align 2
.global _main

.data
msg: .asciz "Hello, World!\n"
.align 4

.text
_main:
    // Save link register
    stp x29, x30, [sp, #-16]!

    // write(int fd, const void *buf, size_t count)
    mov x0, #1          // file descriptor 1 (stdout)
    adrp x1, msg@PAGE   // address of the string (page)
    add x1, x1, msg@PAGEOFF // add page offset
    mov x2, #14         // length of the string
    mov x16, #4         // syscall number for write (4 on macOS)
    svc #0x80          // make the syscall

    mov x0, #0          // return value
    
    // Restore link register and return
    ldp x29, x30, [sp], #16
    ret
