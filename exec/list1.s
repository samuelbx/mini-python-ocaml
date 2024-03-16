	.text
	.globl	main
__print__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	call __print_no_endline__
	movq %rax, %r10
	movq $10, %rdi
	call putchar
	movq %rax, %r10
	movq -8(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
__print_no_endline__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, -120(%rbp)
	movq -120(%rbp), %r15
	movq 0(%r15), %r10
	movq -120(%rbp), %r15
	movq 8(%r15), %rsi
	cmpq $0, %r10
	jle L124
	cmpq $1, %r10
	jle L128
	cmpq $2, %r10
	jle L130
	cmpq $3, %r10
	jle L146
	cmpq $4, %r10
	jle L172
L122:
	movq -128(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L172:
	movq $0, -152(%rbp)
	movq $91, %rdi
	call putchar
	movq %rax, %r10
L169:
	movq -120(%rbp), %r15
	movq 8(%r15), %r10
	subq -152(%rbp), %r10
	testq %r10, %r10
	jnz L166
	movq $93, %rdi
	call putchar
	movq %rax, %r10
	jmp L122
L166:
	movq -152(%rbp), %r10
	addq $2, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -120(%rbp), %r10
	movq 0(%r10), %rdi
	call __print_no_endline__
	movq %rax, %r10
	movq -120(%rbp), %r15
	movq 8(%r15), %r10
	subq -152(%rbp), %r10
	decq %r10
	testq %r10, %r10
	jnz L153
L147:
	incq -152(%rbp)
	jmp L169
L153:
	movq $44, %rdi
	call putchar
	movq %rax, %r10
	movq $32, %rdi
	call putchar
	movq %rax, %r10
	jmp L147
L146:
	movq $0, -136(%rbp)
L145:
	movq -120(%rbp), %r15
	movq 8(%r15), %r10
	movq $1, -144(%rbp)
	movq $2, %r8
	subq -136(%rbp), %r10
	testq %r10, %r10
	jz L122
	movq -136(%rbp), %r10
	addq %r8, %r10
	movq $8, %r8
	imulq %r8, %r10
	addq -120(%rbp), %r10
	movq 0(%r10), %rdi
	call putchar
	movq %rax, %r10
	movq -136(%rbp), %r15
	addq -144(%rbp), %r15
	movq %r15, -136(%rbp)
	jmp L145
L130:
	movq $.LC1, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L122
L128:
	cmpq $0, %rsi
	jle L126
	movq $.LC2, %rdi
L125:
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L122
L126:
	movq $.LC3, %rdi
	jmp L125
L124:
	movq $.LC4, %rdi
	movq $0, %rax
	call printf
	movq %rax, %r10
	jmp L122
__len__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rdi, %r10
	movq 8(%r10), %r15
	movq %r15, -112(%rbp)
	movq $16, %rdi
	call malloc
	movq $2, %r10
	movq %r10, 0(%rax)
	movq -112(%rbp), %r15
	movq %r15, 8(%rax)
	movq %rbp, %rsp
	popq %rbp
	ret
__add__:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq %rsi, -80(%rbp)
	movq %rdi, -72(%rbp)
	movq -72(%rbp), %r15
	movq 0(%r15), %r10
	movq -72(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -96(%rbp)
	movq -80(%rbp), %r15
	movq 8(%r15), %r11
	movq %r11, -104(%rbp)
	cmpq $0, %r10
	jle L61
	cmpq $1, %r10
	jle L61
	cmpq $2, %r10
	jle L68
	cmpq $3, %r10
	jle L105
	cmpq $4, %r10
	jle L105
L61:
	movq -88(%rbp), %rax
	movq %rbp, %rsp
	popq %rbp
	ret
L105:
	movq -104(%rbp), %r15
	addq -96(%rbp), %r15
	movq %r15, -104(%rbp)
	movq -104(%rbp), %rdi
	call malloc
	movq %rax, %r10
	movq $0, %r8
	addq $2, -72(%rbp)
	addq $2, %r10
L100:
	cmpq %r8, -96(%rbp)
	jle L99
	movq $0, %r8
	addq $2, -80(%rbp)
	addq $2, %r10
L82:
	cmpq %r8, -104(%rbp)
	jl L61
L81:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -80(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L82
L99:
	movq $8, %rax
	movq %r8, %r9
	imulq %rax, %r9
	addq -72(%rbp), %r9
	movq 0(%r9), %r9
	movq $8, %rcx
	movq %r8, %rax
	imulq %rcx, %rax
	addq %r10, %rax
	movq %r9, 0(%rax)
	incq %r8
	jmp L100
	jmp L105
L68:
	movq -96(%rbp), %r15
	addq -104(%rbp), %r15
	movq %r15, -96(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r8
	movq $2, %r10
	movq %r10, 0(%r8)
	movq -96(%rbp), %r15
	movq %r15, 8(%r8)
	movq %r8, -88(%rbp)
	jmp L61
	jmp L61
	jmp L61
main:
	pushq %rbp
	movq %rsp, %rbp
	addq $-152, %rsp
	movq $40, %rdi
	call malloc
	movq %rax, -32(%rbp)
	movq $4, %r10
	movq $3, %r8
	movq -32(%rbp), %r11
	movq %r10, 0(%r11)
	movq -32(%rbp), %r11
	movq %r8, 8(%r11)
	movq $111, -56(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -56(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 16(%r11)
	movq $222, -48(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -48(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 24(%r11)
	movq $333, -40(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -40(%rbp), %r15
	movq %r15, 8(%r10)
	movq -32(%rbp), %r11
	movq %r10, 32(%r11)
	movq -32(%rbp), %r15
	movq %r15, -16(%rbp)
	movq $1, -24(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -24(%rbp), %r15
	movq %r15, 8(%r10)
	movq 8(%r10), %r8
	movq $2, %r10
	addq %r10, %r8
	movq -16(%rbp), %r10
	movq $8, %r9
	imulq %r9, %r8
	addq %r10, %r8
	movq 0(%r8), %rdi
	call __print__
	movq $0, -64(%rbp)
	movq $16, %rdi
	call malloc
	movq %rax, %r10
	movq $2, %r8
	movq %r8, 0(%r10)
	movq -64(%rbp), %r15
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
