	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -24(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, -88(%rbp)
	movq -88(%rbp), %r15
	movq 0(%r15), %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L147
	cmpq $1, %r10
	jle L151
	cmpq $2, %r10
	jle L153
	cmpq $3, %r10
	jle L169
	cmpq $4, %r10
	jle L195
L145:
	movq -96(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L195:
	movq $0, -16(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L192:
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	subq -16(%rbp), %r10
	testq %r10, %r10
	jnz L189
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L145
L189:
	movq -16(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -88(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -88(%rbp), %r15
	movq 8(%r15), %r10
	subq -16(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L176
L170:
	incq -16(%rbp)
	jmp L192
L176:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L170
L169:
	movq $0, -104(%rbp)
L168:
	movq -88(%rbp), %r15
	movq 8(%r15), %r8
	movq $1, -8(%rbp)
	movq $2, %r10
	subq -104(%rbp), %r8
	testq %r8, %r8
	jz L145
	movq -104(%rbp), %r9
	addq %r10, %r9
	movq $8, %r8
	movq %r9, %r10
	imulq %r8, %r10
	addq -88(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -104(%rbp), %r15
	addq -8(%rbp), %r15
	movq %r15, -104(%rbp)
	jmp L168
L153:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L145
L151:
	cmpq $0, %rsi
	jle L149
	movq $.LC2, %rdi
L148:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L145
L149:
	movq $.LC3, %rdi
	jmp L148
L147:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L145
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -80(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -80(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
	movq %rsi, -48(%rbp)
	movq %rdi, -40(%rbp)
	movq -40(%rbp), %r15
	movq 0(%r15), %r10
	movq -40(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -64(%rbp)
	movq -48(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -72(%rbp)
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
	movq -56(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L128:
	movq -72(%rbp), %r15
	addq -64(%rbp), %r15
	movq %r15, -72(%rbp)
	movq -72(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -40(%rbp)
	addq $2, %r10
L123:
	cmpq %r8, -64(%rbp)
	jle L122
	movq $0, %r8
	addq $2, -48(%rbp)
	addq $2, %r10
L105:
	cmpq %r8, -72(%rbp)
	jl L84
L104:
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
	jmp L105
L122:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -40(%rbp), %r9
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
	movq -64(%rbp), %r15
	addq -72(%rbp), %r15
	movq %r15, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -64(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -56(%rbp)
	jmp L84
	jmp L84
	jmp L84
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-104, %rsp
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
	movq $0, -32(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -32(%rbp), %r15
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
