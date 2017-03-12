#include <iostream>
#include <string>

using namespace std;

int mmxSuporta();
int sseSuporta();
int sse2Suporta();
int ssse3Suporta();
int sse4_1Suporta();
int sse4_2Suporta();
int avxSuporta();
int avx2Suporta();
void yesOrNo(int);

int main() {
	string instrucao;
	cin >> instrucao;

	if (instrucao == "mmx")
		yesOrNo(mmxSuporta());
	else if (instrucao == "sse")
		yesOrNo(sseSuporta());
	else if (instrucao == "sse2")
		yesOrNo(sse2Suporta());
	else if (instrucao == "ssse3")
		yesOrNo(ssse3Suporta());
	else if (instrucao == "sse4_1")
		yesOrNo(sse4_1Suporta());
	else if (instrucao == "sse4_2")
		yesOrNo(sse4_2Suporta());
	else if (instrucao == "avx")
		yesOrNo(avxSuporta());
	else
		yesOrNo(avx2Suporta());
	
EXIT_SUCCESS;
}

int mmxSuporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $23, %edx\n\t"
		"adc %eax, %eax");
}

int sseSuporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $25, %edx\n\t"
		"adc %eax, %eax");
}

int sse2Suporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $26, %edx\n\t"
		"adc %eax, %eax");
}

int ssse3Suporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $9, %ecx\n\t"
		"adc %eax, %eax");
}

int sse4_1Suporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $19, %ecx\n\t"
		"adc %eax, %eax");
}

int sse4_2Suporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $20, %ecx\n\t"
		"adc %eax, %eax");
}

int avxSuporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $28, %ecx\n\t"
		"adc %eax, %eax");
}

int avx2Suporta() {
	__asm__ (
		"movl $1, %eax\n\t"
		"cpuid\n\t"
		"xorl %eax, %eax\n\t"
		"bt $5, %ebx\n\t"
		"adc %eax, %eax");
}

void yesOrNo(int resultado) {
	if (resultado == 0)
		cout << "no" << endl;
	else
		cout << "yes" << endl;
}