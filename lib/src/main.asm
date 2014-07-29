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
  mov rsi, banner
  mov rdx, banner_len
  call print
  
  call sys_socket
  mov byte [server_fd], al
  call sys_bind
  
  call sys_exit_group
  
  