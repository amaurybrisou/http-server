sys_bind:
  stackpush
  mov rdi, [server_fd]
  mov rsi, sockaddr_in
  mov rdx, 16
  mov rax, SYS_BIND
  syscall
  stackpop
  ret
  
  
sys_socket:
  stackpush
  mov rsi, AF_INET
  mov rdi, SOCK_STREAM
  mov rdx, IPPROTO_TCP
  mov rax, SYS_SOCKET
  syscall
  stackpop
  cmp al, 0
  jl sys_exit_group
  ret

sys_write:
  stackpush
  mov rdi, STDOUT
  mov rax, SYS_WRITE
  syscall
  stackpop
  ret
  
sys_exit_group:
  xor rdi, rdi
  mov rax, SYS_EXIT_GROUP
  syscall
  