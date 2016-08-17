;arguments:
; rsi : address to print
; rdx : length to print
_print_str:
  save
  call sys_write ; display rsi
  call isError
  done

_print_nl:
  save
  mov rsi, new_line
  mov rdx, new_line_len
  call sys_write
  call isError
  done  