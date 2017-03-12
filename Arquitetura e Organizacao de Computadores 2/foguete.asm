INCLUDE Irvine32.inc
.686
.data
var1 DWORD 0
dir DWORD 0
cont BYTE 0
dois REAL4 2.0
epsilon1 REAL4 1.0E-20
epsilon2 REAL8 1.0E-20
uni1 REAL4 0.0
uni2 REAL8 0.0
resul1 REAL4 0.0
resul2 REAL8 0.0
x1 REAL4 0.0
y1 REAL4 0.0
x2 REAL8 0.0
y2 REAL8 0.0
msg1 BYTE "DECOLAR", 0
msg2 BYTE "EXPLODIR", 0
diag1 REAL4 0.0

.code
main PROC
finit

call ReadInt
mov ecx, eax

L1 :
push ecx
mov edx, OFFSET dir
mov ecx, SIZEOF dir
call ReadString
pop ecx
call ReadInt
mov var1, eax

fld dois
fsqrt
fld dois
fdiv ST(1), ST(0)
fstp diag1
fstp diag1

mov ebx, 0
mov ebx, dir

cmp bl, 50h
je P
cmp bl, 4Ch
je L
cmp bl, 52h
je R
cmp bl, 53h
je S
cmp bl, 51h
je Q
cmp bl, 4Fh
je O
cmp bl, 4Dh
je M
cmp bl, 4Eh
je N
jmp next

P :

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni1
ffree ST(0)

fld x1
fld uni1
fadd
fstp x1
fld y1
fld uni1
fadd
fstp y1

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni2
ffree ST(0)

fld x2
fld uni2
fadd
fstp x2
fld y2
fld uni2
fadd
fstp y2

mov al, cont
inc al
mov cont, al
jmp next

L :

fld x1
fild var1
fwait
fadd
fstp x1

fld x2
fild var1
fwait
fadd
fstp x2

mov al, cont
inc al
mov cont, al
jmp next

R :

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni1
ffree ST(0)

fld x1
fld uni1
fadd
fstp x1
fld y1
fld uni1
fsub
fstp y1

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni2
ffree ST(0)

fld x2
fld uni2
fadd
fstp x2
fld y2
fld uni2
fsub
fstp y2

mov al, cont
inc al
mov cont, al
jmp next

S :
fld y1
fild var1
fwait
fsub
fstp y1

fld y2
fild var1
fwait
fsub
fstp y2

mov al, cont
inc al
mov cont, al
jmp next

Q :

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni1
ffree ST(0)

fld x1
fld uni1
fsub
fstp x1
fld y1
fld uni1
fsub
fstp y1

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni2
ffree ST(0)

fld x2
fld uni2
fsub
fstp x2
fld y2
fld uni2
fsub
fstp y2

mov al, cont
inc al
mov cont, al
jmp next

O :
fld x1
fild var1
fwait
fsub
fstp x1

fld x2
fild var1
fwait
fsub
fstp x2

mov al, cont
inc al
mov cont, al
jmp next

M :

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni1
ffree ST(0)

fld x1
fld uni1
fsub
fstp x1
fld y1
fld uni1
fadd
fstp y1

fild var1
fwait
fld diag1
fmul ST(0), ST(1)
fstp uni2
ffree ST(0)

fld x2
fld uni2
fsub
fstp x2
fld y2
fld uni2
fadd
fstp y2

mov al, cont
inc al
mov cont, al
jmp next

N :
fld y1
fild var1
fwait
fadd
fstp y1

fld y2
fild var1
fwait
fadd
fstp y2

mov al, cont
inc al
mov cont, al

next :
dec ecx
cmp ecx, 0
jne L1

mov eax, 0
mov al, cont
call WriteDec
call Crlf

fld x1
fabs
fld y1
fabs
fadd
fstp resul1
fld resul1
fld epsilon1
fcom
fnstsw ax
sahf
jbe EX1
mov edx, OFFSET msg1
call WriteString
call Crlf
fstp resul1
fstp resul1
jmp next1
EX1 :
mov edx, OFFSET msg2
call WriteString
call Crlf
fstp resul1
fstp resul1

next1 :
fld x2
fabs
fld y2
fabs
fadd
fstp resul2
fld resul2
fld epsilon1
fcom
fnstsw ax
sahf
jbe EX2
mov edx, OFFSET msg1
call WriteString
call Crlf
fstp resul2
fstp resul2
jmp next2

EX2 :
mov edx, OFFSET msg2
call WriteString
call Crlf
fstp resul2
fstp resul2
next2 :
exit
main ENDP
END main