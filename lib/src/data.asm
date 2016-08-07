buffer: dd 1

banner: 
db " _____           _   _                                                       ",0x0a
db "/ ____|         (_) | |                                                      ",0x0a
db "| |  __   _ __   _  | |   __ _    __ _   _ __    _ __    ___     ___     ___ ",0x0a
db "| | |_ | | '__| | | | |  / _` |  / _` | | '_ \  | '__|  / _ \   / _ \   / _ \",0x0a
db "| |__| | | |    | | | | | (_| | | (_| | | | | | | |    | (_) | | (_) | |  __/",0x0a
db " \_____| |_|    |_| |_|  \__, |  \__,_| |_| |_| |_|     \___/   \___/   \___|",0x0a
db "                          __/ |                                              ",0x0a
db "                         |___/                                               ",0x0a

banner_len: equ $-banner

int_size: equ 8

new_line: dw 0x0a0d
new_line_len: equ $-new_line

sockaddr_in:
  dw AF_INET
  dw LISTEN_PORT
  dd INADDR_ANY

timeval:
  tv_sec  dq 0
  tv_usec dq 0
  
_test: db "Bonjour", 0x0a, 0x0d

ERROR_WRITE_EAGAIN:  db "Error in Write : EAGAIN", 0x0a, 0x0d
ERROR_WRITE_EAGAIN_LEN: equ $-ERROR_WRITE_EAGAIN