%include "macro.asm"
%include "constants.asm"

%define LISTEN_PORT 0x901F ; PORT : 8080 Network byte order, use 0x50 for port 80

section .bss
  %include "bss.asm"
section .data
  %include "data.asm"
section .text
  %include "syscalls/net.asm"
  %include "syscalls/file.asm"
  %include "errors.asm"
  %include "lib/string.asm"
  %include "lib/stdio.asm"
  %include "lib/stdlib.asm"

global _start

_start:
  ; just a section for tests
  jmp _main_start
  
_main_start:
  ; lea rsi, [rel banner]
  ; lea rdx, [rel banner_len]
  ; call _print_str
  ; call _print_nl
  
  call sys_socket
  mov byte [server_fd], al ; store the socket file descriptor
  mov rdi, [server_fd]
  call sys_setsockopt ; SO_REUSADDR = 1
  call sys_bind
  call sys_listen 
  
  mov rdi, rax ; 1 

  push rdi

  lea rdi, [rel filepath]
  call sys_open

  mov rsi, dictionary
  mov rdi, rax
  call sys_read

  ; call sys_getpeername
  
  ; lea rsi, [rel sockaddr_in+4] ; address of the remote IP
  ; call parse_addr
  ; call print
  pop rdi

  
  _loop:
    call sys_accept
    mov [clients_fd], rax;store clients_fd

    mov rdi, [rel clients_fd]
    call sys_recv; output: rsi contains the user string
    
    lea rdi, [rel dictionary]
    mov rdx, 3

    call _strncmp ;compare 'cat' with user input


    mov rbx, 10 ;htoi base 10
    call _htoi;


    lea rdi, [rel b]
    lea rsi, [rel buffer]
    call _itoa

    call _strlen

    mov rdx, rax
    call _print_str
    call _print_nl
    
    mov rdi, [rel clients_fd]
    lea rsi, [rel buffer]
    call sys_send

    call sys_close

    jmp _loop


  jmp _exit

  _exit:
    mov rdi, 0
    call sys_exit