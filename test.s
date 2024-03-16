	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $1, %r9
	movq $0, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 0(%r10), %r8
	movq 8(%r10), %rsi
	cmpq $0, %r8
	jle L15
	cmpq $1, %r8
	jle L19
	cmpq $2, %r8
	jle L21
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
L21:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
L13:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L11
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
