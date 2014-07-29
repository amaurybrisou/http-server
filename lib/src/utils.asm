;input:
; rsi : adress to write output to
; rax : number to convert
;ouput:
; rsi : output string with LFCR
; rdx : strlen
itoa:
  stackpush
  mov dword [rsi], 0x0a0d ; this line is optional, if you don't want it, set rcx to 0 instead of 2
  mov rbx, 10
  mov rcx, 2; take into account LFCR, we wil
  r_itoa:
  mov rdx, 0
  div rbx
  add rdx, 0x30
  inc rcx
  dec rsi
  mov byte [rsi], dl
  cmp al, 0
  jne r_itoa
  mov rdx, rcx
  stackpop
  ret

