	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rdi, -104(%rbp)
	movq -104(%rbp), %r15
	movq 0(%r15), %r10
	movq -104(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L149
	cmpq $1, %r10
	jle L153
	cmpq $2, %r10
	jle L155
	cmpq $3, %r10
	jle L171
	cmpq $4, %r10
	jle L187
L145:
	movq -112(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L187:
	movq $0, -24(%rbp)
L186:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -32(%rbp)
	movq $2, %r8
	subq -24(%rbp), %r10
	testq %r10, %r10
	jnz L181
L147:
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	jmp L145
L181:
	movq -24(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call __print__
	movq %rax, %r10
	movq -24(%rbp), %r15
	addq -32(%rbp), %r15
	movq %r15, -24(%rbp)
	jmp L186
L171:
	movq $0, -8(%rbp)
L170:
	movq -104(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -16(%rbp)
	movq $2, %r8
	subq -8(%rbp), %r10
	testq %r10, %r10
	jz L147
	movq -8(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -104(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -8(%rbp), %r15
	addq -16(%rbp), %r15
	movq %r15, -8(%rbp)
	jmp L170
L155:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L147
L153:
	cmpq $0, %rsi
	jle L151
	movq $.LC2, %rdi
L150:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L147
L151:
	movq $.LC3, %rdi
	jmp L150
L149:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L147
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -96(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq %rsi, -56(%rbp)
	movq %rdi, -48(%rbp)
	movq -48(%rbp), %r15
	movq 0(%r15), %r10
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
	movq -56(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -80(%rbp)
	cmpq $0, %r10
	jle L84
	cmpq $1, %r10
	jle L84
	cmpq $2, %r10
	jle L91
	cmpq $3, %r10
	jle L128
	cmpq $4, %r10
	jle L128
L84:
	movq -64(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L128:
	movq -80(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -80(%rbp)
	movq -80(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L123:
	cmpq %r8, -72(%rbp)
	jle L122
	movq $0, %r8
	addq $2, -56(%rbp)
	addq $2, %r10
L105:
	cmpq %r8, -80(%rbp)
	jl L84
L104:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -56(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L105
L122:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -48(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L123
	jmp L128
L91:
	addq %r8, -88(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -88(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -64(%rbp)
	jmp L84
	jmp L84
	jmp L84
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-112, %rsp
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $1, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $16, %rdi
	call malloc
	movq %rax, %rdi
	movq $1, %r8
	movq $0, %r10
	movq %r8, 0(%rdi)
	movq %r10, 8(%rdi)
	call __print__
	movq $0, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
	.data
.LC4:
	.string "None"
.LC2:
	.string "True"
.LC1:
	.string "%d"
.LC3:
	.string "False"
