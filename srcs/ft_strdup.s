;char    *_ft_strdup(char *s)
;{
;    int i = 0;
;    char *str = (char *) malloc(sizeof(char) * (strlen(s) + 1))
;    while (s[i] != '\0')
;    {
;        str[i] = s[i];
;        i += 1;
;    }
;    str[i] = '\0';
;    return (str)
;}


extern _ft_strlen
extern _ft_strcpy
extern ___error
extern _malloc

global _ft_strdup

section .text

_ft_strdup:
    mov r9, 0
    call _ft_strlen
    add rax, 1 ; add 1 the length of the string (for the terminating byte'\n')
    mov r10, rax ; move the contents of rax to r10 (strlen + 1)
    push rdi ; move the str (to be duplicate) to r11
    mov rdi, r10 ; move the length of str to rdi so malloc can use it
    call _malloc ; allocate as much bytes as we need to duplicate the str contained in r11
    cmp rax, 0   ; check that the poiner returned by malloc is not null
    je error
    pop rdi
    mov rsi, rdi
    mov rdi, rax ; mov the address of the alloced memory to rdi
    call _ft_strcpy ; call _ft_strcpy with rdi (dest) and rsi (src)
    ret

error:
    push rax
    call ___error
    pop qword[rax]
    mov rax, -1
    ret