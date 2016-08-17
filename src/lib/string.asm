;input:
; rsi=string
;output:
; rax=len
_strlen:
  save
  xor rax, rax; set rax to 0
  .for_each:
    cmp word [rsi+rax], 0xa0d ; \n\r
    je .done
    inc rax
    cmp byte [rsi+rax], 0x0
    je .done
    jmp .for_each
  .done:
    done

;input
; rsi=string
; rdi=string
; rdx=len to check
;output
; rax (cf man strncmp for return value)
_strncmp:
  save
  push rcx
  xor rcx, rcx
  .for_each:
    xor rax, rax
    cmp rcx, rdx
    jae .done
    mov byte al, [rsi+rcx]
    sub byte al, [rdi+rcx]
    jnz .done
    inc rcx
    jmp .for_each
  .done:
    pop rcx
    done