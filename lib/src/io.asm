;input:
; rsi : address to print
; rdx : length to print
print:
  stackpush
  call sys_write
  ; add new line
  mov rsi, new_line
  mov rdx, new_line_len ; new line length
  call sys_write
  stackpop
  ret