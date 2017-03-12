INCLUDE Irvine32.inc

.data
vet1 DWORD 10 dup(0)
var1 DWORD 0
var2 DWORD 0
mdc1 DWORD 0
mmc DWORD 0

.code
main PROC

mov esi, 0
call ReadInt
mov ecx, eax
push ecx
L1 :
	call ReadInt
	mov vet1[esi], eax
	add esi, TYPE vet1
	loop L1
pop ecx

push ecx
sub esi, TYPE vet1
mov ebx, vet1[esi]
sub esi, TYPE vet1
mov eax, vet1[esi]
sub ecx, 2
L2:
		mov var1, eax
		mov var2, ebx
		push eax
		push ebx
		call mdc
		mov mdc1, eax
		mov eax, var1
		imul var2
		mov edx, 0
		idiv mdc1
		mov mmc, eax
		sub esi, TYPE vet1
		mov eax, vet1[esi]
		mov ebx, mmc
		cmp ecx, 0
		je next
		loop L2
	next:
		mov eax, ebx
		call WriteDec
		call Crlf


exit
main ENDP

mdc PROC,
b: DWORD, a: DWORD
	topo1 :
	cmp b, 0
	je next
	mov edx, 0
	idiv b
	mov a, ebx
	mov eax, a
	mov b, edx
	mov ebx, b
	jmp topo1
	next :
	mov eax, a
	ret
mdc ENDP
END main