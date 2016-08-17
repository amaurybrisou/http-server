_itoa:; rdi - buffer, rsi - int
    stackpush
    push rcx
    push rbx

    xchg rdi, rsi
    call get_number_of_digits
    xchg rdi, rsi
    mov rcx, rax ;
    
    ;add null
    mov al, 0x0
    mov [rdi+rcx], al
    dec rcx

    mov rax, rsi ; value to print
    xor rdx, rdx ; zero other half
    mov rbx, 10
    
    string_itoa_start:
    xor rdx, rdx ; zero other half
    div rbx      ; divide by 10

    add rdx, 0x30
    mov [rdi+rcx], dl
    dec rcx
    cmp rax, 9
    ja string_itoa_start

    cmp rcx, 0
    jl string_itoa_done
    add rax, 0x30 ;last digit
    mov [rdi+rcx], al

    string_itoa_done:
    pop rbx
    pop rcx
    stackpop
    ret


; _htoi
;   Input:
;     rax = Number to be converted
;     rbx = Base
;   
;   Output:
;     rsi = Start of NUL-terminated buffer
;          containing the converted number
;          in ASCII represention.

_htoi:
    push rax            ; Save modified registers
    push rbx
    push rdx
    mov rsi, bufferend  ; Start at the end
.convert:
    xor rdx, rdx         ; Clear dx for division
    div rbx             ; Divide by base
    add dl, '0'        ; Convert to printable char
    cmp dl, '9'        ; Hex digit?
    jbe .store         ; No. Store it
    add dl, 'A'-'0'-10 ; Adjust hex digit
.store:
    dec rsi             ; Move back one position
    mov byte [rsi], dl       ; Store converted digit
    and rax, rax         ; Division result 0?
    jnz .convert       ; No. Still digits to convert
    pop rdx             ; Restore modified registers
    pop rbx
    pop rax
    ret

get_number_of_digits: ; of rdi, ret rax
    stackpush
    push rbx
    push rcx
    
    mov rax, rdi
    mov rbx, 10
    mov rcx, 1 ;count
gnod_cont:
    cmp rax, 10
    jb gnod_ret

    xor rdx,rdx
    div rbx

    inc rcx
    jmp gnod_cont
gnod_ret:
    mov rax, rcx
    
    pop rcx
    pop rbx
    stackpop
    ret
