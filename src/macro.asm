%macro save 0
  push rbp
  mov rbp, rsp
%endmacro

%macro done 0
  leave
  ret
%endmacro

%macro stackpush 0; 0 args
  push rdi
  push rsi
  push rdx
  push r10
  push r8
  push r9
  push rbx
  push rcx
%endmacro

%macro stackpop 0
  pop rcx
  pop rbx
  pop r9
  pop r8
  pop r10
  pop rdx
  pop rsi
  pop rdi
%endmacro

%macro DATA_ERR 1
    %strlen len %1
    db len, %1
%endmacro

