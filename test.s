	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-32, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $87, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 0(%r10), %r9
	movq 8(%r10), %rax
	movq $0, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L14
	movq $1, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L20
	movq $2, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L23
	movq $3, %r8
	subq %r9, %r8
	testq %r8, %r8
	jz L38
L10:
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
L38:
	movq $0, -8(%rbp)
	movq 8(%r10), %r8
	movq $1, -16(%rbp)
	movq $2, %r9
	cmpq %r8, -8(%rbp)
	jl L33
L12:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L10
L33:
	movq -8(%rbp), %r8
	addq %r9, %r8
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call putchar
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L12
L23:
	movq $.LC1, %rdi
	movq 8(%r10), %rsi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L12
L20:
	movq $0, %r8
	subq %rax, %r8
	testq %r8, %r8
	jz L17
	movq $.LC2, %rdi
L15:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L12
L17:
	movq $.LC3, %rdi
	jmp L15
L14:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L12
	.data
.LC4:
	.string "None"
.LC3:
	.string "True"
.LC1:
	.string "%d"
.LC2:
	.string "False"
