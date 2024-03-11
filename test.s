	.text
	.globl	main
__main__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-8, %rsp
	movq $0, %rdi
	call loop
	movq %rax, %r10
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
loop:
	pushq %rbp
	movq %rsp, %rbp
	addq $-8, %rsp
	movq %rdi, %r10
	movq $3, %r8
	cmpq %r8, %r10
	setl %r11b
	movzbq %r11b, %r10
	testq %r10, %r10
	jnz L14
	movq $99, %r10
	movq $1, %r10
	addq %r10, %rdi
	call loop
L5:
	movq %rbp, %rsp
	popq %rbp
	ret
L14:
	movq $0, %rax
	jmp L5
	.data
