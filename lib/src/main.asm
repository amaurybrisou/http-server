%include "macro.asm"
%include "constants.asm"

%define LISTEN_PORT 0x901f ; PORT : 8080 Network byte order, use 0x50 for port 80

section .bss
  %include "bss.asm"
section .data
  %include "data.asm"
section .text
  %include "syscalls.asm"
  %include "utils.asm"
  %include "io.asm"

global _start
  
_start:
  ; just a section for tests
  jmp _main_start
  
_main_start:
  mov rsi, [rel banner]
  mov rdx, [rel banner_len]
  call print
  
  call sys_socket
  cmp rax, 0
  je exit_sys_socket
  
  mov byte [rel server_fd], al
  call sys_bind
  
  call sys_listen
  
  ._loop:
  call sys_accept
  mov rdi, rax ; mov client socket fd to rdi
  
  call sys_recv
  ; rdi still hold client socket fd
  call sys_send
  
  call sys_close
  
  jmp ._loop
  
  
  

_manage:
  
  