%include "macro.asm"
%include "constants.asm"

%define LISTEN_PORT 0x902f ; PORT : 8080 Network byte order, use 0x50 for port 80

section .bss
  %include "bss.asm"
section .data
  %include "data.asm"
section .text
  %include "syscalls.asm"
  %include "errors.asm"
  %include "utils.asm"
  %include "io.asm"

global _start

_start:
  ; just a section for tests
  jmp _main_start
  
_main_start:
  lea rsi, [rel banner]
  lea rdx, [rel banner_len]
  call print
  
  call sys_socket
  mov byte [server_fd], al ; store the socket file descriptor
  mov rdi, [server_fd]
  call sys_setsockopt ; SO_REUSADDR = 1
  call sys_bind
  call sys_listen 
  call sys_accept
  mov [clients_fd], rax;store clients_fd
  mov rdi, rax ; 1 
  
  _loop:

    mov rdi, [clients_fd]
  
    call sys_recv
    call sys_send

    jmp _loop

    mov rdi, 0
    call sys_exit