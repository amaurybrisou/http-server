print_error: ; ARG: RDI=errno
  push rbp
  mov rbp, rsp
  sub rbp, 16
  
  xor edx, edx ; counter
  mov rsi, MESS_ERRNO ; load the array

  .lp:
    lea rsi, [rsi+rdx] ; array address + offset
    mov dl, [rsi]
    add rsi, 1
    dec edi
    jns .lp

  mov word [rsi+rdx], 0x0a0d
  add rdx, 2
  mov edi, 2 ;stderr
  mov eax, 1 ; sys_write
  syscall

  call sys_exit ;exit program