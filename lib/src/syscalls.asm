sys_socket:
  stackpush
  mov rdi, AF_INET
  mov rsi, SOCK_STREAM
  mov rdx, IPPROTO_TCP
  mov rax, SYS_SOCKET
  syscall
  stackpop
  cmp al, 0
  jl sys_exit_group
  ret

sys_bind:
  stackpush
  mov rdi, [server_fd]
  mov rsi, sockaddr_in
  mov rdx, 16
  mov rax, SYS_BIND
  syscall
  stackpop
  cmp rax, 0
  jl sys_exit_group
  ret

sys_listen:
  stackpush
  mov rdi, [server_fd]
  mov rsi, MAX_QUAD
  mov rax, SYS_LISTEN
  syscall
  stackpop
  cmp rax, 0
  jl sys_exit_group
  ret
  
sys_accept:
  stackpush
  mov rdi, [server_fd]
  xor rsi, rsi
  xor rdx, rdx
  mov rax, SYS_ACCEPT
  syscall
  stackpop
  cmp rax, 0
  jl sys_exit_group
  ret
  
  
; rdi filled with connected socket value
sys_recv:
  push rbp
  mov rbp, rsp
  stackpush
  mov rsi, rsp
  mov qword [rsi], 0
  xor rdx, 4096
  mov rax, SYS_RECVFROM
  syscall
  stackpop
  cmp rax, 0
  jl sys_exit_group
  mov byte [rsi-1], 0x0
  leave
  ret

; rdi filled with connected socket value
sys_send:
  push rbp
  mov rbp, rsp
  stackpush
  mov rsi, rsp
  call _strlen
  mov rdx, rax
  mov rax, SYS_SENDTO
  syscall
  stackpop
  cmp rax, 0
  jl sys_exit_group
  leave
  ret

sys_close:
  stackpush
  mov rax, SYS_CLOSE
  syscall
  stackpop
  ret
  
sys_write:
  stackpush
  mov rdi, STDOUT
  mov rax, SYS_WRITE
  syscall
  stackpop
  ret
  
sys_sleep:
  stackpush
	mov qword [tv_sec], rdi
	mov qword [tv_usec],0
	xor rsi, rsi
	mov rdi, timeval
	mov rax, SYS_NANOSLEEP
	syscall
	stackpop
	ret

sys_exit_group:
  mov rdi, rax
  mov rax, SYS_EXIT_GROUP
  syscall
  