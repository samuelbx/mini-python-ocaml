	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-56, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 0(%r15), %r10
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L52
	cmpq $1, %r10
	jle L56
	cmpq $2, %r10
	jle L58
	cmpq $3, %r10
	jle L74
	cmpq $4, %r10
	jle L90
L48:
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L90:
	movq $0, -48(%rbp)
L89:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -56(%rbp)
	movq $2, %r8
	subq -48(%rbp), %r10
	testq %r10, %r10
	jnz L84
L50:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L48
L84:
	movq -48(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -48(%rbp), %r15
	addq -56(%rbp), %r15
	movq %r15, -48(%rbp)
	jmp L89
L74:
	movq $0, -32(%rbp)
L73:
	movq -16(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -40(%rbp)
	movq $2, %r8
	subq -32(%rbp), %r10
	testq %r10, %r10
	jz L50
	movq -32(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -16(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -32(%rbp), %r15
	addq -40(%rbp), %r15
	movq %r15, -32(%rbp)
	jmp L73
L58:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L50
L56:
	cmpq $0, %rsi
	jle L54
	movq $.LC2, %rdi
L53:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L50
L54:
	movq $.LC3, %rdi
	jmp L53
L52:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L50
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-56, %rsp
	movq %rdi, %r10
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-56, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -8(%rbp), %r11
	movq %r10, 0(%r11)
	movq -8(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -8(%rbp), %r11
	movq %r10, 32(%r11)
	movq -8(%rbp), %rdi
	call len
	movq %rax, %rdi
	call __print__
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
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
