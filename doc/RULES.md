###Coding Rules

* Use system syscalls
* Follwing amd64 syscall standards for internal function calls: rsi rdi rdx r10 r8 r9
* End strings with LINE FIN, '0x0a'
* Add a specific prefix to struct members ([see HELP.md](HELP.md))