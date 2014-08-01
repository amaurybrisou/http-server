###Coding Rules

* Use system syscalls
* Follwing amd64 syscall standards for internal function calls:  %rdi, %rsi, %rdx, %rcx, %r8 and %r9. The kernel interface uses rdi, rsi, rdx, r10, r8 and r9.
* End strings with LINE FIN, '0x0a'
* Add a specific prefix to struct members ([see HELP.md](HELP.md))