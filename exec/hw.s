	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-40, %rsp
	movq $112, %rdi
	call malloc
	movq %rax, %r10
	movq $3, %r8
	movq $12, %r9
	movq %r8, 0(%r10)
	movq %r9, 8(%r10)
	movq $104, %r8
	movq %r8, 16(%r10)
	movq $101, %r8
	movq %r8, 24(%r10)
	movq $108, %r8
	movq %r8, 32(%r10)
	movq $108, %r8
	movq %r8, 40(%r10)
	movq $111, %r8
	movq %r8, 48(%r10)
	movq $44, %r8
	movq %r8, 56(%r10)
	movq $32, %r8
	movq %r8, 64(%r10)
	movq $119, %r8
	movq %r8, 72(%r10)
	movq $111, %r8
	movq %r8, 80(%r10)
	movq $114, %r8
	movq %r8, 88(%r10)
	movq $108, %r8
	movq %r8, 96(%r10)
	movq $100, %r8
	movq %r8, 104(%r10)
	movq %r10, -8(%rbp)
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
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"