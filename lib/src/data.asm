buffer: dd 1

banner: 
db " _____           _   _                                                       ",0x0a
db "/ ____|         (_) | |                                                      ",0x0a
db "| |  __   _ __   _  | |   __ _    __ _   _ __    _ __    ___     ___     ___ ",0x0a
db "| | |_ | | '__| | | | |  / _` |  / _` | | '_ \  | '__|  / _ \   / _ \   / _ \",0x0a
db "| |__| | | |    | | | | | (_| | | (_| | | | | | | |    | (_) | | (_) | |  __/",0x0a
db " \_____| |_|    |_| |_|  \__, |  \__,_| |_| |_| |_|     \___/   \___/   \___|",0x0a
db "                          __/ |                                              ",0x0a
db "                         |___/                                               "

banner_len: equ $-banner

new_line: dw 0x0a0d
new_line_len: equ $-new_line

sockaddr_in:
  dw AF_INET
  dw LISTEN_PORT
  dd INADDR_ANY

sockaddr_in_len: db 5