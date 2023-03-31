.syntax unified
.cpu cortex-a53

.text
.global _start

_start:
    /* write system call */
    mov r0, #1 /* file descriptor stdout */
    ldr r1, =message /* load message address into r1 */
    ldr r2, =len /* load message length into r2 */
    mov r7, #4 /* syscall number for write */
    svc #0 /* system call */

    /* exit system call */
    mov r0, #0 /* return code */
    mov r7, #1 /* syscall number for exit */
    svc #0 /* system call */

.data
message:
    .ascii "Hello, World!\n"
len = . - message
