	.text
main:
	pushq %rbp
	movq %rsp, %rbp
	movl $0, %eax
	popq %rbp
	ret
f:
	pushq %rbp
	movq %rsp, %rbp
	movl %edi, -4(%rbp)
	ret
	movl $0, %eax
	popq %rbp
	ret
	.data
.LC0:
	.string "%d"
