	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-48, %rsp
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L33
	cmpq $1, %r10
	jle L37
	cmpq $2, %r10
	jle L39
	cmpq $3, %r10
	jle L55
	cmpq $4, %r10
	jle L71
L29:
	movq -16(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L71:
	movq $0, -40(%rbp)
L70:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -48(%rbp)
	movq $2, %r8
	subq -40(%rbp), %r10
	testq %r10, %r10
	jnz L65
L31:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L29
L65:
	movq -40(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -40(%rbp), %r15
	addq -48(%rbp), %r15
	movq %r15, -40(%rbp)
	jmp L70
L55:
	movq $0, -24(%rbp)
L54:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -32(%rbp)
	movq $2, %r8
	subq -24(%rbp), %r10
	testq %r10, %r10
	jz L31
	movq -24(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -8(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -24(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	jmp L54
L39:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L31
L37:
	cmpq $0, %rsi
	jle L35
	movq $.LC2, %rdi
L34:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L31
L35:
	movq $.LC3, %rdi
	jmp L34
L33:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L31
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-48, %rsp
	movq %rdi, %r10
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-48, %rsp
	movq $32, %rdi
	call malloc
	movq %rax, %rdi
	movq $3, %r10
	movq $2, %r8
	movq %r10, 0(%rdi)
	movq %r8, 8(%rdi)
	movq $111, %r10
	movq %r10, 16(%rdi)
	movq $107, %r10
	movq %r10, 24(%rdi)
	call __len__
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
