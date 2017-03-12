INCLUDE Irvine32.inc
.686p
.mmx
.xmm

.data
elementos DWORD 100000 dup(0)
incremento DWORD 0

.code
main proc

call  ReadDec
mov ecx, eax
L1 :
call ReadInt
add incremento, eax
loop L1

call ReadDec
mov ecx, eax
push ecx
xor esi, esi
L2 :
call ReadInt
mov[elementos + esi], eax
add esi, 4
loop L2

pop ecx
movd mm1, incremento
packssdw mm1, mm1
xor esi, esi
L3 :
movd mm0, [elementos + esi]
packssdw mm0, mm0
paddd mm0, mm1
movd eax, mm0
cmp eax, 0
jle next1
cmp eax, 255
jle next
mov eax, 255
jmp next
next1 :
mov eax, 0
next :
	call WriteDec
	call Crlf
	add esi, 4
	loop L3
	emms

	exit
	main endp
	end main