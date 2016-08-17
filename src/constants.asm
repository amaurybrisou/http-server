%define MINUS 	0x2D
%define INT_VAL 8
%define QUAD_SIZE 64
%define MAX_QUAD 0xFFFFFFFFFFFFFFFF
;System Call Values
%define SYS_READ 0 ;int fd, const void *buf, size_t count
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
%define SYS_GETPEERNAME 52; int sockfd, struct sockaddr *addr, int *addrlen
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

;block modes
%define O_RDONLY	0x0000
%define O_CREATE 	0x0100
%define O_APPEND	0x1000

