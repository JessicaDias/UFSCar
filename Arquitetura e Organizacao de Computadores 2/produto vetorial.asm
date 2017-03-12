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
	add esi, TYPE vet1
	loop L1
	
	mov esi, 0
	mov ecx, edx
	L2:
	call ReadInt
	mov [vet2+esi], eax
	add esi, TYPE vet2				
	loop L2

mov esi, 0
mov ebx, 0
mov ecx, edx
L3:
	push ecx
	mov ecx, [vet1 + esi]
	mov ebx, [vet2 + esi]
	mov eax, 0
		L4:
		add eax, ebx
		loop L4
	add esi, TYPE vet1
	call WriteDec
	call Crlf
	pop ecx
	loop L3

exit
main ENDP
END main