;arguments:
; rsi : address to print
; rdx : length to print
print:
  save
  call sys_write ; display rsi
  mov rsi, new_line ; add new line
  mov rdx, new_line_len ; new line length
  call sys_write

  cmp eax, -1
  jg .done

  neg rax ; get ERRNO number
  mov rdi, rax  ; print_error expect ERRNO edi
  
  test edi, edi ; set ZF to 1 if edi == 0
  jz .done 
  cmp edi, 133
  ja .done
  
  jmp print_error

  done

  .done:
    leave
    ret
  