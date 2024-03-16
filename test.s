	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-40, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, -8(%rbp)
	movq $0, %r10
	movq %r10, 0(%r15)
	movq %r15, -8(%rbp)
	movq %r10, 8(%r15)
	movq %r15, -8(%rbp)
	movq %r11, %r11
	movq 0(%r11), %r8
	movq %r11, %r11
	movq 8(%r11), %r9
	movq $0, %rax
	movq $0, %r10
	subq %r8, %r10
	testq %r10, %r10
	jz L14
	movq $1, %r10
	subq %r8, %r10
	testq %r10, %r10
	jz L20
	movq $2, %r10
	subq %r8, %r10
	testq %r10, %r10
	jz L23
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
L23:
	movq $.LC1, %rdi
	movq %r11, %r11
	movq 8(%r11), %rsi
	movq $0, %rax
	call printf
	movq %rax, %r10
L12:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L10
L20:
	movq $0, %r10
	subq %r9, %r10
	testq %r10, %r10
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
