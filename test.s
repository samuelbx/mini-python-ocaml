	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-56, %rsp
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L5
	cmpq $1, %r10
	jle L9
	cmpq $2, %r10
	jle L11
	cmpq $3, %r10
	jle L27
	cmpq $4, %r10
	jle L43
L1:
	movq -32(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L43:
	movq $0, -40(%rbp)
L42:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -48(%rbp)
	movq $2, %r8
	subq -40(%rbp), %r10
	testq %r10, %r10
	jnz L37
L3:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L1
L37:
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
	jmp L42
L27:
	movq $0, -16(%rbp)
L26:
	movq -8(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -24(%rbp)
	movq $2, %r8
	subq -16(%rbp), %r10
	testq %r10, %r10
	jz L3
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
	jmp L26
L11:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L3
L9:
	cmpq $0, %rsi
	jle L7
	movq $.LC2, %rdi
L6:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L3
L7:
	movq $.LC3, %rdi
	jmp L6
L5:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L3
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-56, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $2, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $40, %rdi
	call malloc
	movq %rax, -56(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -56(%rbp), %r11
	movq %r10, 0(%r11)
	movq -56(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -56(%rbp), %r11
	movq %r10, 32(%r11)
	movq -56(%rbp), %rdi
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
