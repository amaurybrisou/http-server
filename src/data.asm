filepath: dd "dictionary.json"

buffer: times 16 db 0
bufferend:
    db 0

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
sockaddr_len: equ $-sockaddr_in

timeval:
  tv_sec  dq 0
  tv_usec dq 0

MESS_ERRNO:
	; /usr/src/linux-source-3.2/include/asm-generic/errno-base.h
	DATA_ERR "Operation not permitted"                         ; EPERM             1
	DATA_ERR "No such file or directory"                       ; ENOENT            2
	DATA_ERR "No such process"                                 ; ESRCH             3
	DATA_ERR "Interrupted system call"                         ; EINTR             4
	DATA_ERR "I/O error"                                       ; EIO               5
	DATA_ERR "No such device or address"                       ; ENXIO             6
	DATA_ERR "Argument list too long"                          ; E2BIG             7
	DATA_ERR "Exec format error"                               ; ENOEXEC           8
	DATA_ERR "Bad file number"                                 ; EBADF             9
	DATA_ERR "No child processes"                              ; ECHILD           10
	DATA_ERR "Try again"                                       ; EAGAIN           11
	DATA_ERR "Out of memory"                                   ; ENOMEM           12
	DATA_ERR "Permission denied"                               ; EACCES           13
	DATA_ERR "Bad address"                                     ; EFAULT           14
	DATA_ERR "Block device required"                           ; ENOTBLK          15
	DATA_ERR "Device or resource busy"                         ; EBUSY            16
	DATA_ERR "File exists"                                     ; EEXIST           17
	DATA_ERR "Cross-device link"                               ; EXDEV            18
	DATA_ERR "No such device"                                  ; ENODEV           19
	DATA_ERR "Not a directory"                                 ; ENOTDIR          20
	DATA_ERR "Is a directory"                                  ; EISDIR           21
	DATA_ERR "Invalid argument"                                ; EINVAL           22
	DATA_ERR "File table overflow"                             ; ENFILE           23
	DATA_ERR "Too many open files"                             ; EMFILE           24
	DATA_ERR "Not a typewriter"                                ; ENOTTY           25
	DATA_ERR "Text file busy"                                  ; ETXTBSY          26
	DATA_ERR "File too large"                                  ; EFBIG            27
	DATA_ERR "No space left on device"                         ; ENOSPC           28
	DATA_ERR "Illegal seek"                                    ; ESPIPE           29
	DATA_ERR "Read-only file system"                           ; EROFS            30
	DATA_ERR "Too many links"                                  ; EMLINK           31
	DATA_ERR "Broken pipe"                                     ; EPIPE            32
	DATA_ERR "Math argument out of domain of func"             ; EDOM             33
	DATA_ERR "Math result not representable"                   ; ERANGE           34
	DATA_ERR "Resource deadlock would occur"                   ; EDEADLK          35

; /usr/src/linux-source-3.2/include/asm-generic/errno.h
	DATA_ERR "File name too long"                              ; ENAMETOOLONG     36
	DATA_ERR "No record locks available"                       ; ENOLCK           37
	DATA_ERR "Function not implemented"                        ; ENOSYS           38
	DATA_ERR "Directory not empty"                             ; ENOTEMPTY        39
	DATA_ERR "Too many symbolic links encountered"             ; ELOOP            40
	DATA_ERR "Operation would block"                           ; EWOULDBLOCK  EAGAIN
	DATA_ERR "No message of desired type"                      ; ENOMSG           42
	DATA_ERR "Identifier removed"                              ; EIDRM            43
	DATA_ERR "Channel number out of range"                     ; ECHRNG           44
	DATA_ERR "Level 2 not synchronized"                        ; EL2NSYNC         45
	DATA_ERR "Level 3 halted"                                  ; EL3HLT           46
	DATA_ERR "Level 3 reset"                                   ; EL3RST           47
	DATA_ERR "Link number out of range"                        ; ELNRNG           48
	DATA_ERR "Protocol driver not attached"                    ; EUNATCH          49
	DATA_ERR "No CSI structure available"                      ; ENOCSI           50
	DATA_ERR "Level 2 halted"                                  ; EL2HLT           51
	DATA_ERR "Invalid exchange"                                ; EBADE            52
	DATA_ERR "Invalid request descriptor"                      ; EBADR            53
	DATA_ERR "Exchange full"                                   ; EXFULL           54
	DATA_ERR "No anode"                                        ; ENOANO           55
	DATA_ERR "Invalid request code"                            ; EBADRQC          56
	DATA_ERR "Invalid slot"                                    ; EBADSLT          57
	DATA_ERR "Resource deadlock would occur"                   ; EDEADLOCK   EDEADLK
	DATA_ERR "Bad font file format"                            ; EBFONT           59
	DATA_ERR "Device not a stream"                             ; ENOSTR           60
	DATA_ERR "No data available"                               ; ENODATA          61
	DATA_ERR "Timer expired"                                   ; ETIME            62
	DATA_ERR "Out of streams resources"                        ; ENOSR            63
	DATA_ERR "Machine is not on the network"                   ; ENONET           64
	DATA_ERR "Package not installed"                           ; ENOPKG           65
	DATA_ERR "Object is remote"                                ; EREMOTE          66
	DATA_ERR "Link has been severed"                           ; ENOLINK          67
	DATA_ERR "Advertise error"                                 ; EADV             68
	DATA_ERR "Srmount error"                                   ; ESRMNT           69
	DATA_ERR "Communication error on send"                     ; ECOMM            70
	DATA_ERR "Protocol error"                                  ; EPROTO           71
	DATA_ERR "Multihop attempted"                              ; EMULTIHOP        72
	DATA_ERR "RFS specific error"                              ; EDOTDOT          73
	DATA_ERR "Not a data message"                              ; EBADMSG          74
	DATA_ERR "Value too large for defined data type"           ; EOVERFLOW        75
	DATA_ERR "Name not unique on network"                      ; ENOTUNIQ         76
	DATA_ERR "File descriptor in bad state"                    ; EBADFD           77
	DATA_ERR "Remote address changed"                          ; EREMCHG          78
	DATA_ERR "Can not access a needed shared library"          ; ELIBACC          79
	DATA_ERR "Accessing a corrupted shared library"            ; ELIBBAD          80
	DATA_ERR ".lib section in a.out corrupted"                 ; ELIBSCN          81
	DATA_ERR "Attempting to link in too many shared libraries" ; ELIBMAX          82
	DATA_ERR "Cannot exec a shared library directly"           ; ELIBEXEC         83
	DATA_ERR "Illegal byte sequence"                           ; EILSEQ           84
	DATA_ERR "Interrupted system call should be restarted"     ; ERESTART         85
	DATA_ERR "Streams pipe error"                              ; ESTRPIPE         86
	DATA_ERR "Too many users"                                  ; EUSERS           87
	DATA_ERR "Socket operation on non-socket"                  ; ENOTSOCK         88
	DATA_ERR "Destination address required"                    ; EDESTADDRREQ     89
	DATA_ERR "Message too long"                                ; EMSGSIZE         90
	DATA_ERR "Protocol wrong type for socket"                  ; EPROTOTYPE       91
	DATA_ERR "Protocol not available"                          ; ENOPROTOOPT      92
	DATA_ERR "Protocol not supported"                          ; EPROTONOSUPPORT  93
	DATA_ERR "Socket type not supported"                       ; ESOCKTNOSUPPORT  94
	DATA_ERR "Operation not supported on transport endpoint"   ; EOPNOTSUPP       95
	DATA_ERR "Protocol family not supported"                   ; EPFNOSUPPORT     96
	DATA_ERR "Address family not supported by protocol"        ; EAFNOSUPPORT     97
	DATA_ERR "Address already in use"                          ; EADDRINUSE       98
	DATA_ERR "Cannot assign requested address"                 ; EADDRNOTAVAIL    99
	DATA_ERR "Network is down"                                 ; ENETDOWN        100
	DATA_ERR "Network is unreachable"                          ; ENETUNREACH     101
	DATA_ERR "Network dropped connection because of reset"     ; ENETRESET       102
	DATA_ERR "Software caused connection abort"                ; ECONNABORTED    103
	DATA_ERR "Connection reset by peer"                        ; ECONNRESET      104
	DATA_ERR "No buffer space available"                       ; ENOBUFS         105
	DATA_ERR "Transport endpoint is already connected"         ; EISCONN         106
	DATA_ERR "Transport endpoint is not connected"             ; ENOTCONN        107
	DATA_ERR "Cannot send after transport endpoint shutdown"   ; ESHUTDOWN       108
	DATA_ERR "Too many references: cannot splice"              ; ETOOMANYREFS    109
	DATA_ERR "Connection timed out"                            ; ETIMEDOUT       110
	DATA_ERR "Connection refused"                              ; ECONNREFUSED    111
	DATA_ERR "Host is down"                                    ; EHOSTDOWN       112
	DATA_ERR "No route to host"                                ; EHOSTUNREACH    113
	DATA_ERR "Operation already in progress"                   ; EALREADY        114
	DATA_ERR "Operation now in progress"                       ; EINPROGRESS     115
	DATA_ERR "Stale NFS file handle"                           ; ESTALE          116
	DATA_ERR "Structure needs cleaning"                        ; EUCLEAN         117
	DATA_ERR "Not a XENIX named type file"                     ; ENOTNAM         118
	DATA_ERR "No XENIX semaphores available"                   ; ENAVAIL         119
	DATA_ERR "Is a named type file"                            ; EISNAM          120
	DATA_ERR "Remote I/O error"                                ; EREMOTEIO       121
	DATA_ERR "Quota exceeded"                                  ; EDQUOT          122
	DATA_ERR "No medium found"                                 ; ENOMEDIUM       123
	DATA_ERR "Wrong medium type"                               ; EMEDIUMTYPE     124
	DATA_ERR "Operation Canceled"                              ; ECANCELED       125
	DATA_ERR "Required key not available"                      ; ENOKEY          126
	DATA_ERR "Key has expired"                                 ; EKEYEXPIRED     127
	DATA_ERR "Key has been revoked"                            ; EKEYREVOKED     128
	DATA_ERR "Key was rejected by service"                     ; EKEYREJECTED    129
	DATA_ERR "Owner died"                                      ; EOWNERDEAD      130
	DATA_ERR "State not recoverable"                           ; ENOTRECOVERABLE 131
	DATA_ERR "Operation not possible due to RF-kill"           ; ERFKILL         132
	DATA_ERR "Memory page has hardware error"                  ; EHWPOISON       133