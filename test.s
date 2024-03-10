	.text
main:
	pushq %rbp
	movq %rsp, %rbp
	pushq $1
	pushq $1
	movl $1, %r9d
	movl $1, %r8d
	movl $1, %ecx
	movl $1, %edx
	movl $1, %esi
	movl $1, %edi
	call f
	addq $16, %rsp
	movl $0, %eax
	popq %rbp
	ret
f:
	pushq %rbp
	movq %rsp, %rbp
	movl %edi, -4(%rbp)
	movl %esi, -8(%rbp)
	movl %edx, -12(%rbp)
	movl %ecx, -16(%rbp)
	movl %r8d, -20(%rbp)
	movl %r9d, -24(%rbp)
	movl $.LC0, %edi
	movl $0, %eax
	call printf
	movl $0, %eax
	popq %rbp
	ret
	.data
.LC0:
	.string "Hello world!"
.LC1:
	.string "%d"
