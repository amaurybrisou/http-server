section .data
  msg: db 'Basic Environment',0x0a
  len: equ $-msg

section .text
  global _start
  global main

_start:
main:
  mov rdi, 1 ;stdout
  mov rsi, msg
  mov rdx, len
  mov rax, 1
  syscall

  xor rdi, rdi
  mov rax, 60
  syscall