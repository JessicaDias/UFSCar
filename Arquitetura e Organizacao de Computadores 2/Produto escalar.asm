INCLUDE Irvine32.inc

.data
num DWORD 0
vet1 DWORD 1024 dup(0)
vet2 DWORD 1024 dup(0)

.code
main PROC

mov esi,0
mov ecx, 0
mov edx,0
call ReadInt
mov ecx, eax
mov edx, ecx
	L1:
	call ReadInt
	mov [vet1+esi], eax
	call ReadInt
	mov [vet2+esi], eax
	add esi, TYPE vet1
	loop L1

mov esi, 0
mov ebx, 0
mov ecx, edx
L2:
	push ecx
	mov ecx, [vet1 + esi]
	mov ebx, [vet2 + esi]
	mov eax, 0
		L3:
		add eax, ebx
		loop L3
	add esi, TYPE vet1
	add num, eax
	pop ecx
	loop L2

	mov eax, num
	call WriteDec
	call Crlf

exit
main ENDP
END main