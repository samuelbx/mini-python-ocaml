	.text
	.globl	main
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-56, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %r9
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%r9)
	movq %r10, 8(%r9)
	movq -24(%rbp), %r15
	movq 0(%r15), %r10
	movq -24(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jg L101
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
L62:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
L60:
	movq $40, %rdi
	call malloc
	movq %rax, -16(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -16(%rbp), %r11
	movq %r10, 0(%r11)
	movq -16(%rbp), %r11
	movq %r8, 8(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $1, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 16(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 24(%r11)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $3, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq -16(%rbp), %r11
	movq %r10, 32(%r11)
	movq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r9
	movq $-2, %r8
	movq %r9, 0(%r10)
	movq %r8, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -8(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %r10
	movq 8(%r10), %r10
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
L101:
	cmpq $1, %r10
	jg L100
	cmpq $0, %rsi
	jg L67
	movq $.LC2, %rdi
L65:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L62
L67:
	movq $.LC3, %rdi
	jmp L65
L100:
	cmpq $2, %r10
	jg L60
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L62
	jmp L60
	.data
.LC1:
	.string "None"
.LC3:
	.string "True"
.LC4:
	.string "%d"
.LC2:
	.string "False"
