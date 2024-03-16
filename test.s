	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-40, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $0, %r10
	movq %r10, 0(%r8)
	movq %r10, 8(%r8)
	movq %r8, -8(%rbp)
	movq -8(%rbp), %r15
	movq 0(%r15), %r10
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jg L52
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
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
L52:
	cmpq $1, %r10
	jg L51
	cmpq $0, %rsi
	jg L18
	movq $.LC2, %rdi
L16:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
L18:
	movq $.LC3, %rdi
	jmp L16
L51:
	cmpq $2, %r10
	jg L11
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L13
	jmp L11
	.data
.LC1:
	.string "None"
.LC3:
	.string "True"
.LC4:
	.string "%d"
.LC2:
	.string "False"
