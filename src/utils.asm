;input:
; rsi : adress to write output to
; rax : number to convert
;ouput:
; rsi : output string with LFCR
; rdx : strlen
_itoa:
  save
  mov dword [rsi], 0x0a0d ; this line is optional, if you don't want it, set rcx to 0 instead of 2
  mov rbx, 10
  mov rcx, 2; take into account LFCR, we wil
  r_itoa:
    mov rdx, 0
    div rbx ; divide rax by 10 set rdx to the rest of the division
    add rdx, 0x30 ; add 0x30 (48) to get the ASCII char value
    inc rcx 
    dec rsi
    mov byte [rsi], dl
    cmp al, 0
    jne r_itoa
  mov rdx, rcx
  done

;input:
; rsi=string
;output:
; rax=len
_strlen:
  save
  xor rax, rax
  r_strlen:
    inc rax
    cmp byte [rsi+rax], 0x0
    jne r_strlen
  done