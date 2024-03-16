	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-40, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -8(%rbp), %r15
	movq 0(%r15), %r8
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	movq $0, %r10
	subq %r8, %r10
	testq %r10, %r10
	jz L15
	movq $1, %r10
	subq %r8, %r10
	testq %r10, %r10
	jz L21
	movq $2, %r10
	subq %r8, %r10
	testq %r10, %r10
	jz L23
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
L23:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
L21:
	movq $0, %r10
	subq %rsi, %r10
	testq %r10, %r10
	jz L17
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
