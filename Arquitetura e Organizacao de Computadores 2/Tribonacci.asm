INCLUDE Irvine32.inc

.data
num DWORD 0
antant DWORD 0
ant DWORD 1
atual DWORD 1
prox DWORD 2

.code
main PROC

call ReadInt
mov num, eax
mov ebx, 0
mov ecx, num

;Três primeiros termos
cmp eax, 0
je T0
cmp eax, 1
je T1
cmp eax, 2
je T2
cmp eax, 3
je T3

mov eax, 0
call WriteDec
call Crlf
mov eax, 1
call WriteDec
call Crlf
mov eax, 1
call WriteDec
call Crlf
sub ecx, 3

L1:
	mov ebx, antant
	add ebx, ant
	add ebx, atual
	mov prox, ebx
	mov eax, prox
	call WriteDec
	call Crlf

	mov eax, ant
	mov antant, eax
	mov eax, atual
	mov ant, eax
	mov eax, prox
	mov atual, eax
	loop L1
	exit

T1:
	mov eax, 0
	call WriteDec
	call Crlf
	exit

T2:
	mov eax, 0
	call WriteDec
	call Crlf
    mov eax, 1
	call WriteDec
    call Crlf
    exit

T3 :
	mov eax, 0
	call WriteDec
	call Crlf
    mov eax, 1
	call WriteDec
	call Crlf
	mov eax, 1
	call WriteDec
	call Crlf

T0:
	exit

main ENDP
END main