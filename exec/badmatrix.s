	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-120, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -120(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -120(%rbp), %r11
	movq %r10, 0(%r11)
	movq -120(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $2, %r8
	movq $1, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -120(%rbp), %r11
	movq %r9, 16(%r11)
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
	movq -120(%rbp), %r15
	movq %r15, -112(%rbp)
	movq $40, %rdi
	call malloc
	movq %rax, %r10
	movq $4, %r8
	movq $3, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq -112(%rbp), %r8
	movq %r8, 16(%r10)
	movq -112(%rbp), %r8
	movq %r8, 24(%r10)
	movq -112(%rbp), %r8
	movq %r8, 32(%r10)
	movq %r10, -56(%rbp)
	movq -56(%rbp), %r15
	movq %r15, -72(%rbp)
	movq -72(%rbp), %r15
	movq 0(%r15), %r10
	movq -72(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L88
	cmpq $1, %r10
	jle L92
	cmpq $2, %r10
	jle L94
	cmpq $3, %r10
	jle L110
L58:
	movq -64(%rbp), %r15
	movq -8(%rbp), %r11
	movq %r15, 8(%r11)
	movq -56(%rbp), %r15
	movq %r15, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
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
	movq 8(%r10), %r10
	movq %r10, -8(%rbp)
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L37:
	movq $0, -24(%rbp)
L36:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -32(%rbp)
	movq $2, %r8
	subq -24(%rbp), %r10
	testq %r10, %r10
	jnz L31
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L31:
	movq -24(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -24(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -24(%rbp)
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
L110:
	movq $0, -80(%rbp)
L109:
	movq -72(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -88(%rbp)
	movq $2, %r8
	subq -80(%rbp), %r10
	testq %r10, %r10
	jnz L104
L86:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L58
L104:
	movq -80(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -72(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -80(%rbp), %r15
	addq -88(%rbp), %r15
	movq %r15, -80(%rbp)
	jmp L109
L94:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L86
L92:
	cmpq $0, %rsi
	jle L90
	movq $.LC2, %rdi
L89:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L86
L90:
	movq $.LC3, %rdi
	jmp L89
L88:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L86
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
