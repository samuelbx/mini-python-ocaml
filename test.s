	.text
__main__:
	pushq %rbp
	movq %rsp, %rbp
	call f
	movl $0, %eax
	popq %rbp
	ret
f:
	pushq %rbp
	movq %rsp, %rbp
	ret
	movl $0, %eax
	popq %rbp
	ret
	.data
.LC0:
	.string "%d"
