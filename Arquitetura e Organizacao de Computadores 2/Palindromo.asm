INCLUDE Irvine32.inc

.data
frase BYTE 255 dup(0)
fcorreta BYTE 255 dup(0)
tamanho BYTE 0

.code
main PROC

mov edx, OFFSET frase
mov ecx, SIZEOF frase
call ReadString
mov ebx, eax
mov esi, 0
mov edi, 0
mov ecx, eax

L1:
	mov al, frase[esi]
	cmp al, 41h
	jae maiuscula
B1:
	cmp al, 61h
	jae minuscula
B2:
	inc esi
	cmp ecx,1
	je CONTINUA
loop L1

minuscula:
	cmp al, 7Ah
	ja B2
	mov fcorreta[edi], al
	inc edi
	jmp B2

maiuscula :
	cmp al, 5Ah
	ja B1
	add al, 20h
	mov fcorreta[edi], al
	inc edi
	jmp B2

CONTINUA:
	mov edx, OFFSET fcorreta
	call WriteString
	call Crlf
	mov eax, ebx
	call WriteDec
	call Crlf
	mov eax, edi
	call WriteDec
	call Crlf

	shr eax, 1
	mov ecx, eax
	mov edx, OFFSET fcorreta
	mov esi, 0
L2:
	mov al, fcorreta[esi]
	mov bl, fcorreta[edi-1]
	inc esi
	dec edi
	cmp al, bl
	jne NAO
	cmp ecx, 1
	je CONTINUA2
	loop L2

NAO:
	mov eax, 0
	call WriteDec
	call Crlf
	jmp FIM

CONTINUA2:
	mov eax, 1
	call WriteDec
	call Crlf

FIM:
exit
main ENDP
END main