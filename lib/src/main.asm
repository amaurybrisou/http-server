%include "data.asm"

section .text
  global main
  extern write, exit

main:
  mov rdi, 1
  mov rsi, msg
  mov rdx, len
  call write
  xor rdi, rdi
	call exit