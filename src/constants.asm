%define MAX_QUAD 0xFFFFFFFFFFFFFFFF
;System Call Values
%define SYS_WRITE 1 ;int fd, const void *buf, size_t count
%define SYS_LSEEK 8 ;int fd, off_t offset, int whence
%define SYS_MMAP 9 ;void *addr, size_t length, int prot, int flags, int fd, off_t offset
%define SYS_CLONE 56 ;unsigned long clone_flags, unsigned long newsp, void ___user *parent_tid, void __user *child_tid, struct pt_regs *regs
%define SYS_EXIT 60 ;int status
%define SYS_EXIT_GROUP 231 ;int status
%define SYS_EXIT 60 ;int status
%define SYS_NANOSLEEP 35 ;const struct timespec *req, struct timespec *rem
%define SYS_RT_SIGACTION 13 ;int sig,const struct sigaction __user * act,struct sigaction __user * oact,size_t sigsetsize
%define SYS_SOCKET 41 ;int domain, int type, int protocol
%define SYS_ACCEPT 43 ;int sockfd, struct sockaddr *addr, socklen_t *addrlen
%define SYS_SENDTO 44 ;int sockfd, const void *buf, size_t len, int flags, ...
%define SYS_RECVFROM 45 ;int sockfd, void *buf, size_t len, int flags
%define SYS_BIND 49 ;int sockfd, const struct sockaddr *addr, socklen_t addrlen
%define SYS_LISTEN 50 ;int sockfd, int backlog
%define SYS_SELECT 23 ;int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout
%define SYS_GETDENTS 78 ;unsigned int fd, struct linux_dirent *dirp, unsigned int count
%define SYS_OPEN 2 ;const char *pathname, int flags, mode_t mode
%define SYS_CLOSE 3 ;unsigned int fd
%define SYS_SENDFILE 40 ;int out_fd, int in_fd, off_t *offset, size_t count
%define SYS_SETSOCKOPT 54; int sockfd, int level, int optname,const void *optval, socklen_t optlen

%define STDOUT 1
%define STDERR 2

;sys_socket arguments
%define AF_INET 2
%define AF_INET6 10
%define SOCK_STREAM 1 
%define IPPROTO_TCP 0 ; useless shortcut, it's the only valid value 

%define SO_REUSEADDR 2
%define SO_NONBLOCK 4
%define SOL_SOCKET 1
;bind args / sockaddr_in
%define INADDR_ANY 0

%define BUFFER_SIZE 0x1000
;%define MESS_ERRNO "Operation not permitted", "No such file or directory", "No such process", "Interrupted system call", "I/O error", "No such device or address", "Argument list too long", "Exec format error", "Bad file number", "No child processes", "Try again", "Out of memory", "Permission denied", "Bad address", "Block device required", "Device or resource busy", "File exists", "Cross-device link", "No such device", "Not a directory", "Is a directory", "Invalid argument", "File table overflow", "Too many open files", "Not a typewriter", "Text file busy", "File too large", "No space left on device", "Illegal seek", "Read-only file system", "Too many links", "Broken pipe", "Math argument out of domain of func", "Math result not representable", "Resource deadlock would occur ", "File name too long ", "No record locks available ", "Invalid system call number ", "Directory not empty ", "Too many symbolic links encountered ", "Operation would block", "No message of desired type ", "Identifier removed ", "Channel number out of range ", "Level 2 not synchronized ", "Level 3 halted ", "Level 3 reset ", "Link number out of range ", "Protocol driver not attached ", "No CSI structure available ", "Level 2 halted ", "Invalid exchange ", "Invalid request descriptor ", "Exchange full ", "No anode ", "Invalid request code ", "Invalid slot ", "Bad font file format ", "Device not a stream ", "No data available ", "Timer expired ", "Out of streams resources ", "Machine is not on the network ", "Package not installed ", "Object is remote ", "Link has been severed ", "Advertise error ", "Srmount error ", "Communication error on send ", "Protocol error ", "Multihop attempted ", "RFS specific error ", "Not a data message ", "Value too large for defined data type ", "Name not unique on network ", "File descriptor in bad state ", "Remote address changed ", "Can not access a needed shared library ", "Accessing a corrupted shared library ", ".lib section in a.out corrupted ", "Attempting to link in too many shared libraries ", "Cannot exec a shared library directly ", "Illegal byte sequence ", "Interrupted system call should be restarted ", "Streams pipe error ", "Too many users ", "Socket operation on non-socket ", "Destination address required ", "Message too long ", "Protocol wrong type for socket ", "Protocol not available ", "Protocol not supported ", "Socket type not supported ", "Operation not supported on transport endpoint ", "Protocol family not supported ", "Address family not supported by protocol ", "Address already in use ", "Cannot assign requested address ", "Network is down ", "Network is unreachable ", "Network dropped connection because of reset ", "Software caused connection abort ", "Connection reset by peer ", "No buffer space available ", "Transport endpoint is already connected ", "Transport endpoint is not connected ", "Cannot send after transport endpoint shutdown ", "Too many references: cannot splice ", "Connection timed out ", "Connection refused ", "Host is down ", "No route to host ", "Operation already in progress ", "Operation now in progress ", "Stale file handle ", "Structure needs cleaning ", "Not a XENIX named type file ", "No XENIX semaphores available ", "Is a named type file ", "Remote I/O error ", "Quota exceeded ", "No medium found ", "Wrong medium type ", "Operation Canceled ", "Required key not available ", "Key has expired ", "Key has been revoked ", "Key was rejected by service ", "Owner died ", "State not recoverable ", "Operation not possible due to RF-kill ", "Memory page has hardware error "