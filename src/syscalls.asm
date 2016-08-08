isError:
  stackpush

  cmp eax, -1
  jg .done
  
  neg rax
  mov rdi, rax  ; print_error expect ERRNO edi
  
  test edi, edi ; set ZF to 1 if edi == 0
  jz .done
  cmp edi, 133
  ja .done
  
  call print_error

  .done:
    stackpop
    leave
    ret

sys_socket:
  save
  mov rdi, AF_INET
  mov rsi, SOCK_STREAM
  mov rdx, IPPROTO_TCP
  mov rax, SYS_SOCKET
  syscall
  
  call isError

  done
  

sys_setsockopt:;args: rdi=fd
  save
  mov rbp, rsp
  mov QWORD [rbp-8], 1
  mov r10, rbp
  sub r10, 8
  mov r8, int_size
  mov rdx, SO_REUSEADDR;| SO_NONBLOCK
  mov rsi, SOL_SOCKET
  mov rax, SYS_SETSOCKOPT
  syscall
  call isError
  done

sys_bind:
  save
  mov rdi, [server_fd]
  mov rsi, sockaddr_in
  mov rdx, 16
  mov rax, SYS_BIND
  syscall

  call isError
  done
  
sys_listen:
  save
  mov rdi, [server_fd]
  mov rsi, MAX_QUAD
  mov rax, SYS_LISTEN
  syscall

  call isError
  
  done
  
  
sys_accept:
  save
  mov rdi, [server_fd]
  xor rsi, rsi
  xor rdx, rdx
  mov rax, SYS_ACCEPT
  syscall

  call isError
  
  done
  
  
  

sys_recv: ;arg: rdi filled with connected socket value
  save

  sub rsp, BUFFER_SIZE ; 0x1000 
  
  mov rsi, rsp ; 2nd 
  mov qword [rsi], 0 
  mov rdx, BUFFER_SIZE ; 3rd 
  xor rcx, rcx ;4th 
  xor r10, r10 ;flags
  xor r9, r9
  xor r8, r8
  mov rax, SYS_RECVFROM
  syscall

  call isError
  done


; rdi filled with connected socket value
sys_send:
  save
  ;sub rsp, BUFFER_SIZE
  lea rsi, [rsp-BUFFER_SIZE] ;point to the stack holding the string
  xor r10, r10
  call _strlen
  mov rdx, rax ; rax contains the string len
  mov rax, SYS_SENDTO
  syscall

  call isError
  done


sys_close:
  save
  mov rax, SYS_CLOSE
  syscall

  call isError
  done
  
  
sys_write: ; args: RDI=FD, rsi=address to print; rdx: len
  save
  mov rdi, STDOUT
  mov rax, SYS_WRITE
  syscall

  call isError

  done
  
  
sys_sleep:
  save

	mov qword [tv_sec], rdi
	mov qword [tv_usec],0
	xor rsi, rsi
	mov rdi, timeval
	mov rax, SYS_NANOSLEEP
	syscall

  call isError
  done

sys_exit_group: ;args:  rdi => exit code
  mov rdi, rax
  mov rax, SYS_EXIT_GROUP
  syscall
  
sys_exit: ;args:  rdi => exit code
  mov rdi, rax
  mov rax, SYS_EXIT
  syscall