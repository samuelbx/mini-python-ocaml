	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, -160(%rbp)
	movq $4, %r10
	movq $0, %r8
	movq -160(%rbp), %r11
	movq %r10, 0(%r11)
	movq -160(%rbp), %r11
	movq %r8, 8(%r11)
	movq -160(%rbp), %r15
	movq 0(%r15), %r10
	movq -160(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L166
	cmpq $1, %r10
	jle L170
	cmpq $2, %r10
	jle L172
	cmpq $3, %r10
	jle L188
L162:
	movq $56, %rdi
	call malloc
	movq %rax, -120(%rbp)
	movq $4, %r10
	movq $5, %r8
	movq -120(%rbp), %r11
	movq %r10, 0(%r11)
	movq -120(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 32(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $4, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 40(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $5, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -120(%rbp), %r11
	movq %r10, 48(%r11)
	movq -120(%rbp), %r15
	movq 0(%r15), %r10
	movq -120(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L75
	cmpq $1, %r10
	jle L79
	cmpq $2, %r10
	jle L81
	cmpq $3, %r10
	jle L97
L71:
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $4, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq %r9, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %rsi
	movq $2, %r8
	movq $7, %r10
	movq %r8, 0(%rsi)
	movq %r10, 8(%rsi)
	movq -112(%rbp), %rdi
	call def_f
	movq %rax, -24(%rbp)
	movq -24(%rbp), %r15
	movq 0(%r15), %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L15
	cmpq $1, %r10
	jle L19
	cmpq $2, %r10
	jle L21
	cmpq $3, %r10
	jle L37
L11:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L37:
	movq $0, -80(%rbp)
L36:
	movq -24(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -88(%rbp)
	movq $2, %r8
	subq -80(%rbp), %r10
	testq %r10, %r10
	jnz L31
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L31:
	movq -80(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -24(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	jmp L36
L21:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L19:
	cmpq $0, %rsi
	jle L17
	movq $.LC2, %rdi
L16:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L17:
	movq $.LC3, %rdi
	jmp L16
L15:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L97:
	movq $0, -128(%rbp)
L96:
	movq -120(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -136(%rbp)
	movq $2, %r8
	subq -128(%rbp), %r10
	testq %r10, %r10
	jnz L91
L73:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L71
L91:
	movq -128(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -120(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -128(%rbp), %r15
	addq -136(%rbp), %r15
	movq %r15, -128(%rbp)
	jmp L96
L81:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L73
L79:
	cmpq $0, %rsi
	jle L77
	movq $.LC2, %rdi
L76:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L73
L77:
	movq $.LC3, %rdi
	jmp L76
L75:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L73
L188:
	movq $0, -8(%rbp)
L187:
	movq -160(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jnz L182
L164:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L162
L182:
	movq -8(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -160(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L187
L172:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L164
L170:
	cmpq $0, %rsi
	jle L168
	movq $.LC2, %rdi
L167:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L164
L168:
	movq $.LC3, %rdi
	jmp L167
L166:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L164
def_f:
	pushq %rbp
	movq %rsp, %rbp
	addq $-160, %rsp
	movq %rsi, -56(%rbp)
	movq %rdi, -48(%rbp)
	movq -48(%rbp), %r10
	movq 8(%r10), %r10
	movq -56(%rbp), %r8
	movq 8(%r8), %r8
	cmpq %r8, %r10
	setge %r11b
	movzbq %r11b, %r10
	movq 8(%r10), %r10
	testq %r10, %r10
	jnz L251
	movq $24, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $1, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -48(%rbp), %r8
	movq %r8, 16(%r10)
	movq 8(%r10), %r15
	movq %r15, -64(%rbp)
	movq -48(%rbp), %r10
	movq 8(%r10), %r15
	movq %r15, -72(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r10
	addq %r10, -72(%rbp)
	movq -72(%rbp), %rdi
	movq -56(%rbp), %rsi
	call def_f
	movq %rax, %r10
	movq 8(%r10), %r10
	addq %r10, -64(%rbp)
	movq -64(%rbp), %r10
	movq 8(%r10), %rax
L214:
	movq %rbp, %rsp
	popq %rbp
	ret
L251:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $0, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq 8(%r10), %rax
	jmp L214
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
