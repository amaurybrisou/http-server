write_error:
	;here compare th error code to print the underlying message
  mov rsi, ERROR_WRITE_EAGAIN
  mov rdi, ERROR_WRITE_EAGAIN_LEN
	call print
  call sys_exit_group
  stackpop
