	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-96, %rsp
	movq $80, %rdi
	call malloc
	movq %rax, -96(%rbp)
	movq $4, %r10
	movq $8, %r8
	movq -96(%rbp), %r11
	movq %r10, 0(%r11)
	movq -96(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $0, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -96(%rbp), %r11
	movq %r9, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $1, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -96(%rbp), %r11
	movq %r9, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $2, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -96(%rbp), %r11
	movq %r9, 32(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $3, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -96(%rbp), %r11
	movq %r9, 40(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $4, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -96(%rbp), %r11
	movq %r9, 48(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $5, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -96(%rbp), %r11
	movq %r9, 56(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $6, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 64(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $7, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -96(%rbp), %r11
	movq %r10, 72(%r11)
	movq -96(%rbp), %r15
	movq %r15, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -48(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r15
	movq %r15, -56(%rbp)
	movq -56(%rbp), %r15
	movq 0(%r15), %r10
	movq -56(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L77
	cmpq $1, %r10
	jle L81
	cmpq $2, %r10
	jle L83
	cmpq $3, %r10
	jle L99
L73:
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $6, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -48(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r15
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
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
	movq $0, -16(%rbp)
L36:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -24(%rbp)
	movq $2, %r8
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L31
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L31:
	movq -16(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -16(%rbp), %r15
	addq -24(%rbp), %r15
	movq %r15, -16(%rbp)
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
L99:
	movq $0, -64(%rbp)
L98:
	movq -56(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -72(%rbp)
	movq $2, %r8
	subq -64(%rbp), %r10
	testq %r10, %r10
	jnz L93
L75:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L73
L93:
	movq -64(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -56(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	jmp L98
L83:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L75
L81:
	cmpq $0, %rsi
	jle L79
	movq $.LC2, %rdi
L78:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L75
L79:
	movq $.LC3, %rdi
	jmp L78
L77:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L75
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
