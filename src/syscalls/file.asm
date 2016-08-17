sys_open: ; args rdi: pathname
  save
  mov rsi, O_CREATE
  mov rax, SYS_OPEN
  syscall
  call isError
  done

sys_read: ; args rdi: file_fd
  save
  mov rdx, BUFFER_SIZE
  mov rax, SYS_READ
  syscall
  call isError
  done