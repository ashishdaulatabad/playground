	.file	"main.cpp"
	.text
	.section	.rodata._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"basic_string::_M_construct null not valid"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LFB3322:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	16(%rdi), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%r12, (%rdi)
	testq	%rsi, %rsi
	je	.L2
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rsi, %rbp
	call	strlen@PLT
	movq	%rax, (%rsp)
	movq	%rax, %r13
	cmpq	$15, %rax
	ja	.L15
	cmpq	$1, %rax
	jne	.L6
	movzbl	0(%rbp), %edx
	movb	%dl, 16(%rbx)
.L7:
	movq	%rax, 8(%rbx)
	movb	$0, (%r12,%rax)
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	testq	%rax, %rax
	je	.L7
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L15:
	movq	%rsp, %rsi
	xorl	%edx, %edx
	movq	%rbx, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
	movq	%rax, (%rbx)
	movq	%rax, %r12
	movq	(%rsp), %rax
	movq	%rax, 16(%rbx)
.L5:
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	movq	(%rsp), %rax
	movq	(%rbx), %r12
	jmp	.L7
.L16:
	call	__stack_chk_fail@PLT
.L2:
	leaq	.LC0(%rip), %rdi
	call	_ZSt19__throw_logic_errorPKc@PLT
	.cfi_endproc
.LFE3322:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.section	.rodata._ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_.str1.1,"aMS",@progbits,1
.LC1:
	.string	"vector::_M_realloc_insert"
	.section	.text._ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB3472:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3472
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	8(%rdi), %rbp
	movq	(%rdi), %r14
	movq	%rdx, (%rsp)
	movabsq	$-3689348814741910323, %rdx
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movq	%rbp, %rax
	subq	%r14, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$230584300921369395, %rdx
	cmpq	%rdx, %rax
	je	.L72
	testq	%rax, %rax
	movl	$1, %edx
	movq	%rsi, %r13
	movq	%rdi, %r15
	cmovne	%rax, %rdx
	movq	%rsi, %rbx
	addq	%rdx, %rax
	setc	%dl
	movq	%rax, 16(%rsp)
	subq	%r14, %r13
	movzbl	%dl, %edx
	testq	%rdx, %rdx
	jne	.L55
	testq	%rax, %rax
	jne	.L22
	xorl	%r12d, %r12d
.L53:
	leaq	64(%rsp), %rax
	movq	(%rsp), %rdi
	addq	%r12, %r13
	movq	%rax, 40(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	%rax, 64(%rsp)
	call	strlen@PLT
	movq	%rax, 32(%rsp)
	movq	%rax, 56(%rsp)
	cmpq	$15, %rax
	ja	.L73
	cmpq	$1, %rax
	jne	.L25
	movq	(%rsp), %rsi
	movzbl	(%rsi), %edx
	movb	%dl, 80(%rsp)
	movq	24(%rsp), %rdx
.L26:
	movq	%rax, 72(%rsp)
	movb	$0, (%rdx,%rax)
	leaq	24(%r13), %rax
	movq	%rax, 8(%r13)
	movq	64(%rsp), %rax
	movl	$0, 0(%r13)
	cmpq	24(%rsp), %rax
	je	.L74
	movq	%rax, 8(%r13)
	movq	80(%rsp), %rax
	movq	%rax, 24(%r13)
	movq	72(%rsp), %rax
	movq	%rax, 16(%r13)
	cmpq	%r14, %rbx
	je	.L57
.L81:
	movq	%r14, %rax
	movq	%r12, %rcx
	jmp	.L38
	.p2align 4,,10
	.p2align 3
.L68:
	movdqu	8(%rax), %xmm1
	movups	%xmm1, 8(%rcx)
.L35:
	addq	$40, %rax
	addq	$40, %rcx
	cmpq	%rax, %rbx
	je	.L75
.L38:
	movl	(%rax), %edx
	cmpl	$2, %edx
	je	.L30
	ja	.L31
	testl	%edx, %edx
	jne	.L68
	leaq	24(%rcx), %rdx
	leaq	24(%rax), %rsi
	movq	%rdx, 8(%rcx)
	movq	8(%rax), %rdx
	cmpq	%rsi, %rdx
	je	.L76
	movq	%rdx, 8(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
.L37:
	movq	16(%rax), %rdx
	addq	$40, %rax
	addq	$40, %rcx
	movq	%rdx, -24(%rcx)
	cmpq	%rax, %rbx
	jne	.L38
	.p2align 4,,10
	.p2align 3
.L75:
	leaq	-40(%rbx), %rax
	subq	%r14, %rax
	shrq	$3, %rax
	leaq	40(%r12,%rax,8), %rsi
.L29:
	addq	$40, %rsi
	cmpq	%rbp, %rbx
	je	.L39
	movq	%rbx, %rax
	movq	%rsi, %rcx
	jmp	.L48
	.p2align 4,,10
	.p2align 3
.L69:
	movdqu	8(%rax), %xmm2
	movups	%xmm2, 8(%rcx)
.L45:
	addq	$40, %rax
	addq	$40, %rcx
	cmpq	%rax, %rbp
	je	.L77
.L48:
	movl	(%rax), %edx
	cmpl	$2, %edx
	je	.L40
	ja	.L41
	testl	%edx, %edx
	jne	.L69
	leaq	24(%rcx), %rdx
	leaq	24(%rax), %rdi
	movq	%rdx, 8(%rcx)
	movq	8(%rax), %rdx
	cmpq	%rdi, %rdx
	je	.L78
	movq	%rdx, 8(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
.L47:
	movq	16(%rax), %rdx
	addq	$40, %rax
	addq	$40, %rcx
	movq	%rdx, -24(%rcx)
	cmpq	%rax, %rbp
	jne	.L48
.L77:
	subq	%rbx, %rbp
	leaq	-40(%rbp), %rax
	shrq	$3, %rax
	leaq	40(%rsi,%rax,8), %rsi
.L39:
	movq	%r12, %xmm0
	movq	%rsi, %xmm3
	punpcklqdq	%xmm3, %xmm0
	testq	%r14, %r14
	je	.L49
	movq	16(%r15), %rsi
	movq	%r14, %rdi
	movaps	%xmm0, (%rsp)
	subq	%r14, %rsi
	call	_ZdlPvm@PLT
	movdqa	(%rsp), %xmm0
.L49:
	addq	16(%rsp), %r12
	movups	%xmm0, (%r15)
	movq	%r12, 16(%r15)
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L79
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	.cfi_restore_state
	cmpq	$0, 32(%rsp)
	jne	.L80
	movq	24(%rsp), %rdx
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L31:
	cmpl	$3, %edx
	jne	.L35
	cvttsd2sil	8(%rax), %edx
	movl	%edx, 8(%rcx)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L30:
	movq	8(%rax), %rdx
	movl	%edx, 8(%rcx)
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L41:
	cmpl	$3, %edx
	jne	.L45
	cvttsd2sil	8(%rax), %edx
	movl	%edx, 8(%rcx)
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L40:
	movq	8(%rax), %rdx
	movl	%edx, 8(%rcx)
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L78:
	movdqu	24(%rax), %xmm5
	movups	%xmm5, 24(%rcx)
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L76:
	movdqu	24(%rax), %xmm4
	movups	%xmm4, 24(%rcx)
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L55:
	movabsq	$9223372036854775800, %rax
	movq	%rax, 16(%rsp)
	movq	%rax, %rdi
.L21:
.LEHB0:
	call	_Znwm@PLT
.LEHE0:
	movq	%rax, %r12
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L73:
	movq	40(%rsp), %rdi
	leaq	56(%rsp), %rsi
	xorl	%edx, %edx
.LEHB1:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.LEHE1:
	movq	%rax, 64(%rsp)
	movq	%rax, %rdi
	movq	56(%rsp), %rax
	movq	%rax, 80(%rsp)
.L24:
	movq	32(%rsp), %rdx
	movq	(%rsp), %rsi
	call	memcpy@PLT
	movq	56(%rsp), %rax
	movq	64(%rsp), %rdx
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L74:
	movdqa	80(%rsp), %xmm6
	movq	72(%rsp), %rax
	movups	%xmm6, 24(%r13)
	movq	%rax, 16(%r13)
	cmpq	%r14, %rbx
	jne	.L81
.L57:
	movq	%r12, %rsi
	jmp	.L29
.L22:
	movq	%rax, %rsi
	movabsq	$230584300921369395, %rax
	cmpq	%rax, %rsi
	cmovbe	%rsi, %rax
	leaq	(%rax,%rax,4), %rax
	salq	$3, %rax
	movq	%rax, 16(%rsp)
	movq	%rax, %rdi
	jmp	.L21
.L80:
	movq	24(%rsp), %rdi
	jmp	.L24
.L79:
	call	__stack_chk_fail@PLT
.L72:
	leaq	.LC1(%rip), %rdi
.LEHB2:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE2:
.L58:
	endbr64
	movq	%rax, %rdi
.L50:
	call	__cxa_begin_catch@PLT
	testq	%r12, %r12
	je	.L51
	movq	16(%rsp), %rsi
	movq	%r12, %rdi
	call	_ZdlPvm@PLT
.L51:
.LEHB3:
	call	__cxa_rethrow@PLT
.LEHE3:
.L59:
	endbr64
	movq	%rax, %rbp
.L52:
	call	__cxa_end_catch@PLT
	movq	%rbp, %rdi
.LEHB4:
	call	_Unwind_Resume@PLT
.LEHE4:
	.cfi_endproc
.LFE3472:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"aG",@progbits,_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 4
.LLSDA3472:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT3472-.LLSDATTD3472
.LLSDATTD3472:
	.byte	0x1
	.uleb128 .LLSDACSE3472-.LLSDACSB3472
.LLSDACSB3472:
	.uleb128 .LEHB0-.LFB3472
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB3472
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L58-.LFB3472
	.uleb128 0x1
	.uleb128 .LEHB2-.LFB3472
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB3472
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L59-.LFB3472
	.uleb128 0
	.uleb128 .LEHB4-.LFB3472
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE3472:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT3472:
	.section	.text._ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.text._ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.type	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, @function
_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_:
.LFB3478:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3478
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	8(%rdi), %rbp
	movq	(%rdi), %r14
	movq	%rdx, (%rsp)
	movabsq	$-3689348814741910323, %rdx
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movq	%rbp, %rax
	subq	%r14, %rax
	sarq	$3, %rax
	imulq	%rdx, %rax
	movabsq	$230584300921369395, %rdx
	cmpq	%rdx, %rax
	je	.L137
	testq	%rax, %rax
	movl	$1, %edx
	movq	%rsi, %r13
	movq	%rdi, %r15
	cmovne	%rax, %rdx
	movq	%rsi, %rbx
	addq	%rdx, %rax
	setc	%dl
	movq	%rax, 16(%rsp)
	subq	%r14, %r13
	movzbl	%dl, %edx
	testq	%rdx, %rdx
	jne	.L120
	testq	%rax, %rax
	jne	.L87
	xorl	%r12d, %r12d
.L118:
	leaq	64(%rsp), %rax
	movq	(%rsp), %rdi
	addq	%r12, %r13
	movq	%rax, 40(%rsp)
	leaq	80(%rsp), %rax
	movq	%rax, 24(%rsp)
	movq	%rax, 64(%rsp)
	call	strlen@PLT
	movq	%rax, 32(%rsp)
	movq	%rax, 56(%rsp)
	cmpq	$15, %rax
	ja	.L138
	cmpq	$1, %rax
	jne	.L90
	movq	(%rsp), %rsi
	movzbl	(%rsi), %edx
	movb	%dl, 80(%rsp)
	movq	24(%rsp), %rdx
.L91:
	movq	%rax, 72(%rsp)
	movb	$0, (%rdx,%rax)
	leaq	24(%r13), %rax
	movq	%rax, 8(%r13)
	movq	64(%rsp), %rax
	movl	$0, 0(%r13)
	cmpq	24(%rsp), %rax
	je	.L139
	movq	%rax, 8(%r13)
	movq	80(%rsp), %rax
	movq	%rax, 24(%r13)
	movq	72(%rsp), %rax
	movq	%rax, 16(%r13)
	cmpq	%r14, %rbx
	je	.L122
.L146:
	movq	%r14, %rax
	movq	%r12, %rcx
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L133:
	movdqu	8(%rax), %xmm1
	movups	%xmm1, 8(%rcx)
.L100:
	addq	$40, %rax
	addq	$40, %rcx
	cmpq	%rax, %rbx
	je	.L140
.L103:
	movl	(%rax), %edx
	cmpl	$2, %edx
	je	.L95
	ja	.L96
	testl	%edx, %edx
	jne	.L133
	leaq	24(%rcx), %rdx
	leaq	24(%rax), %rsi
	movq	%rdx, 8(%rcx)
	movq	8(%rax), %rdx
	cmpq	%rsi, %rdx
	je	.L141
	movq	%rdx, 8(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
.L102:
	movq	16(%rax), %rdx
	addq	$40, %rax
	addq	$40, %rcx
	movq	%rdx, -24(%rcx)
	cmpq	%rax, %rbx
	jne	.L103
	.p2align 4,,10
	.p2align 3
.L140:
	leaq	-40(%rbx), %rax
	subq	%r14, %rax
	shrq	$3, %rax
	leaq	40(%r12,%rax,8), %rsi
.L94:
	addq	$40, %rsi
	cmpq	%rbp, %rbx
	je	.L104
	movq	%rbx, %rax
	movq	%rsi, %rcx
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L134:
	movdqu	8(%rax), %xmm2
	movups	%xmm2, 8(%rcx)
.L110:
	addq	$40, %rax
	addq	$40, %rcx
	cmpq	%rax, %rbp
	je	.L142
.L113:
	movl	(%rax), %edx
	cmpl	$2, %edx
	je	.L105
	ja	.L106
	testl	%edx, %edx
	jne	.L134
	leaq	24(%rcx), %rdx
	leaq	24(%rax), %rdi
	movq	%rdx, 8(%rcx)
	movq	8(%rax), %rdx
	cmpq	%rdi, %rdx
	je	.L143
	movq	%rdx, 8(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
.L112:
	movq	16(%rax), %rdx
	addq	$40, %rax
	addq	$40, %rcx
	movq	%rdx, -24(%rcx)
	cmpq	%rax, %rbp
	jne	.L113
.L142:
	subq	%rbx, %rbp
	leaq	-40(%rbp), %rax
	shrq	$3, %rax
	leaq	40(%rsi,%rax,8), %rsi
.L104:
	movq	%r12, %xmm0
	movq	%rsi, %xmm3
	punpcklqdq	%xmm3, %xmm0
	testq	%r14, %r14
	je	.L114
	movq	16(%r15), %rsi
	movq	%r14, %rdi
	movaps	%xmm0, (%rsp)
	subq	%r14, %rsi
	call	_ZdlPvm@PLT
	movdqa	(%rsp), %xmm0
.L114:
	addq	16(%rsp), %r12
	movups	%xmm0, (%r15)
	movq	%r12, 16(%r15)
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L144
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L90:
	.cfi_restore_state
	cmpq	$0, 32(%rsp)
	jne	.L145
	movq	24(%rsp), %rdx
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L96:
	cmpl	$3, %edx
	jne	.L100
	cvttsd2sil	8(%rax), %edx
	movl	%edx, 8(%rcx)
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L95:
	movq	8(%rax), %rdx
	movl	%edx, 8(%rcx)
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L106:
	cmpl	$3, %edx
	jne	.L110
	cvttsd2sil	8(%rax), %edx
	movl	%edx, 8(%rcx)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L105:
	movq	8(%rax), %rdx
	movl	%edx, 8(%rcx)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L143:
	movdqu	24(%rax), %xmm5
	movups	%xmm5, 24(%rcx)
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L141:
	movdqu	24(%rax), %xmm4
	movups	%xmm4, 24(%rcx)
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L120:
	movabsq	$9223372036854775800, %rax
	movq	%rax, 16(%rsp)
	movq	%rax, %rdi
.L86:
.LEHB5:
	call	_Znwm@PLT
.LEHE5:
	movq	%rax, %r12
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L138:
	movq	40(%rsp), %rdi
	leaq	56(%rsp), %rsi
	xorl	%edx, %edx
.LEHB6:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT
.LEHE6:
	movq	%rax, 64(%rsp)
	movq	%rax, %rdi
	movq	56(%rsp), %rax
	movq	%rax, 80(%rsp)
.L89:
	movq	32(%rsp), %rdx
	movq	(%rsp), %rsi
	call	memcpy@PLT
	movq	56(%rsp), %rax
	movq	64(%rsp), %rdx
	jmp	.L91
	.p2align 4,,10
	.p2align 3
.L139:
	movdqa	80(%rsp), %xmm6
	movq	72(%rsp), %rax
	movups	%xmm6, 24(%r13)
	movq	%rax, 16(%r13)
	cmpq	%r14, %rbx
	jne	.L146
.L122:
	movq	%r12, %rsi
	jmp	.L94
.L87:
	movq	%rax, %rsi
	movabsq	$230584300921369395, %rax
	cmpq	%rax, %rsi
	cmovbe	%rsi, %rax
	leaq	(%rax,%rax,4), %rax
	salq	$3, %rax
	movq	%rax, 16(%rsp)
	movq	%rax, %rdi
	jmp	.L86
.L145:
	movq	24(%rsp), %rdi
	jmp	.L89
.L144:
	call	__stack_chk_fail@PLT
.L137:
	leaq	.LC1(%rip), %rdi
.LEHB7:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE7:
.L123:
	endbr64
	movq	%rax, %rdi
.L115:
	call	__cxa_begin_catch@PLT
	testq	%r12, %r12
	je	.L116
	movq	16(%rsp), %rsi
	movq	%r12, %rdi
	call	_ZdlPvm@PLT
.L116:
.LEHB8:
	call	__cxa_rethrow@PLT
.LEHE8:
.L124:
	endbr64
	movq	%rax, %rbp
.L117:
	call	__cxa_end_catch@PLT
	movq	%rbp, %rdi
.LEHB9:
	call	_Unwind_Resume@PLT
.LEHE9:
	.cfi_endproc
.LFE3478:
	.section	.gcc_except_table._ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"aG",@progbits,_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.align 4
.LLSDA3478:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT3478-.LLSDATTD3478
.LLSDATTD3478:
	.byte	0x1
	.uleb128 .LLSDACSE3478-.LLSDACSB3478
.LLSDACSB3478:
	.uleb128 .LEHB5-.LFB3478
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB6-.LFB3478
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L123-.LFB3478
	.uleb128 0x1
	.uleb128 .LEHB7-.LFB3478
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB3478
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L124-.LFB3478
	.uleb128 0
	.uleb128 .LEHB9-.LFB3478
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSE3478:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT3478:
	.section	.text._ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,"axG",@progbits,_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_,comdat
	.size	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_, .-_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Hello"
.LC3:
	.string	"12"
.LC5:
	.string	" ("
.LC6:
	.string	"),"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB3057:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA3057
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm0, %xmm0
	leaq	.LC2(%rip), %rdx
	xorl	%esi, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %r12
	movaps	%xmm0, 32(%rsp)
	movq	$0, 48(%rsp)
	movq	%r12, %rdi
.LEHB10:
	call	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA6_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	40(%rsp), %rbp
	movq	48(%rsp), %r15
	cmpq	%r15, %rbp
	je	.L148
	leaq	31(%rsp), %rdx
	leaq	64(%rsp), %rdi
	leaq	.LC3(%rip), %rsi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	leaq	24(%rbp), %rax
	leaq	80(%rsp), %rdx
	movl	$0, 0(%rbp)
	movq	%rax, 8(%rbp)
	movq	64(%rsp), %rax
	cmpq	%rdx, %rax
	je	.L237
	movq	%rax, 8(%rbp)
	movq	80(%rsp), %rax
	movq	%rax, 24(%rbp)
.L150:
	movq	72(%rsp), %rax
	addq	$40, %rbp
	movq	%rax, -24(%rbp)
	movq	%rbp, 40(%rsp)
.L151:
	movq	32(%rsp), %r12
	cmpq	%rbp, %r15
	je	.L152
	movq	.LC4(%rip), %rax
	movl	$3, 0(%rbp)
	addq	$40, %rbp
	movq	%rax, -32(%rbp)
	movq	%rbp, 40(%rsp)
.L153:
	cmpq	%rbp, %r15
	je	.L170
	movl	$2, 0(%rbp)
	addq	$40, %rbp
	movq	$1986666, -32(%rbp)
	movq	%rbp, 40(%rsp)
.L171:
	movq	32(%rsp), %rax
	leaq	_ZSt4cout(%rip), %r12
	leaq	.LC5(%rip), %r13
	leaq	.LC6(%rip), %r14
	movq	%rax, (%rsp)
	movq	%rax, %rbx
	cmpq	%rbp, %rax
	jne	.L198
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L234:
	movq	8(%rbx), %rdx
	movq	16(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	.p2align 4,,10
	.p2align 3
.L196:
	movl	$2, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	(%rbx), %esi
	movq	%r12, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movl	$2, %edx
	movq	%r14, %rsi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	addq	$40, %rbx
	cmpq	%rbx, %rbp
	je	.L199
.L198:
	movl	(%rbx), %eax
	cmpl	$2, %eax
	je	.L191
	ja	.L192
	testl	%eax, %eax
	jne	.L234
	movq	16(%rbx), %rdx
	movq	8(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	jmp	.L196
.L237:
	movdqa	80(%rsp), %xmm3
	movups	%xmm3, 24(%rbp)
	jmp	.L150
	.p2align 4,,10
	.p2align 3
.L192:
	cmpl	$3, %eax
	jne	.L196
	movsd	8(%rbx), %xmm0
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L191:
	movq	8(%rbx), %rsi
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIxEERSoT_@PLT
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L199:
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbp
	testq	%rbp, %rbp
	je	.L238
	cmpb	$0, 56(%rbp)
	je	.L200
	movsbl	67(%rbp), %esi
.L201:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movq	(%rsp), %rdi
	testq	%rdi, %rdi
	je	.L202
	movq	%r15, %rsi
	subq	%rdi, %rsi
	call	_ZdlPvm@PLT
.L202:
	movq	104(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L239
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L200:
	.cfi_restore_state
	movq	%rbp, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%rbp), %rax
	movl	$10, %esi
	movq	%rbp, %rdi
	call	*48(%rax)
	movsbl	%al, %esi
	jmp	.L201
.L148:
	leaq	.LC3(%rip), %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	_ZNSt6vectorI9ContainerSaIS0_EE17_M_realloc_insertIJRA3_KcEEEvN9__gnu_cxx17__normal_iteratorIPS0_S2_EEDpOT_
	movq	40(%rsp), %rbp
	movq	48(%rsp), %r15
	jmp	.L151
.L152:
	movabsq	$-3689348814741910323, %rax
	movq	%r15, %r14
	movabsq	$230584300921369395, %rdx
	subq	%r12, %r14
	movq	%r14, %rbx
	sarq	$3, %rbx
	imulq	%rax, %rbx
	cmpq	%rdx, %rbx
	je	.L240
	testq	%rbx, %rbx
	movl	$1, %eax
	cmovne	%rbx, %rax
	addq	%rax, %rbx
	jc	.L207
	xorl	%r13d, %r13d
	testq	%rbx, %rbx
	jne	.L241
.L158:
	movq	.LC4(%rip), %rax
	addq	%r13, %r14
	movl	$3, (%r14)
	movq	%rax, 8(%r14)
	cmpq	%r12, %rbp
	je	.L209
	movq	%r12, %rax
	movq	%r13, %rcx
	jmp	.L168
.L231:
	movdqu	8(%rax), %xmm1
	movups	%xmm1, 8(%rcx)
	.p2align 4,,10
	.p2align 3
.L165:
	addq	$40, %rax
	addq	$40, %rcx
	cmpq	%rax, %rbp
	je	.L242
.L168:
	movl	(%rax), %edx
	cmpl	$2, %edx
	je	.L160
	ja	.L161
	testl	%edx, %edx
	jne	.L231
	leaq	24(%rcx), %rdx
	leaq	24(%rax), %rsi
	movq	%rdx, 8(%rcx)
	movq	8(%rax), %rdx
	cmpq	%rsi, %rdx
	je	.L243
	movq	%rdx, 8(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
.L167:
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	jmp	.L165
	.p2align 4,,10
	.p2align 3
.L161:
	cmpl	$3, %edx
	jne	.L165
	cvttsd2sil	8(%rax), %edx
	movl	%edx, 8(%rcx)
	jmp	.L165
.L160:
	movq	8(%rax), %rdx
	movl	%edx, 8(%rcx)
	jmp	.L165
.L170:
	movabsq	$-3689348814741910323, %rax
	movq	%r15, %r13
	movabsq	$230584300921369395, %rdx
	subq	%r12, %r13
	movq	%r13, %rbx
	sarq	$3, %rbx
	imulq	%rax, %rbx
	cmpq	%rdx, %rbx
	je	.L244
	testq	%rbx, %rbx
	movl	$1, %eax
	cmovne	%rbx, %rax
	addq	%rax, %rbx
	jc	.L210
	xorl	%r14d, %r14d
	testq	%rbx, %rbx
	jne	.L245
.L176:
	addq	%r14, %r13
	movl	$2, 0(%r13)
	movq	$1986666, 8(%r13)
	cmpq	%r12, %rbp
	je	.L177
	movq	%r12, %rax
	movq	%r14, %rcx
	jmp	.L186
.L232:
	movdqu	8(%rax), %xmm2
	movups	%xmm2, 8(%rcx)
	.p2align 4,,10
	.p2align 3
.L183:
	addq	$40, %rax
	addq	$40, %rcx
	cmpq	%rax, %rbp
	je	.L246
.L186:
	movl	(%rax), %edx
	cmpl	$2, %edx
	je	.L178
	ja	.L179
	testl	%edx, %edx
	jne	.L232
	leaq	24(%rcx), %rdx
	leaq	24(%rax), %rsi
	movq	%rdx, 8(%rcx)
	movq	8(%rax), %rdx
	cmpq	%rsi, %rdx
	je	.L247
	movq	%rdx, 8(%rcx)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rcx)
.L185:
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rcx)
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L179:
	cmpl	$3, %edx
	jne	.L183
	cvttsd2sil	8(%rax), %edx
	movl	%edx, 8(%rcx)
	jmp	.L183
.L178:
	movq	8(%rax), %rdx
	movl	%edx, 8(%rcx)
	jmp	.L183
.L242:
	movabsq	$922337203685477581, %rax
	subq	%r12, %rbp
	subq	$40, %rbp
	shrq	$3, %rbp
	imulq	%rax, %rbp
	movabsq	$2305843009213693951, %rax
	andq	%rax, %rbp
	addq	$1, %rbp
	imulq	$40, %rbp, %rbp
	addq	%r13, %rbp
.L159:
	addq	$40, %rbp
	movq	%r13, %xmm0
	movq	%rbp, %xmm4
	punpcklqdq	%xmm4, %xmm0
	testq	%r12, %r12
	je	.L169
	movq	%r15, %rsi
	movq	%r12, %rdi
	movaps	%xmm0, (%rsp)
	subq	%r12, %rsi
	call	_ZdlPvm@PLT
	movdqa	(%rsp), %xmm0
.L169:
	imulq	$40, %rbx, %rbx
	movq	%xmm0, %r12
	movaps	%xmm0, 32(%rsp)
	leaq	0(%r13,%rbx), %r15
	movq	%r15, 48(%rsp)
	jmp	.L153
.L246:
	subq	%r12, %rbp
	movq	%r14, %xmm0
	movabsq	$922337203685477581, %rax
	subq	$40, %rbp
	shrq	$3, %rbp
	imulq	%rax, %rbp
	movabsq	$2305843009213693951, %rax
	andq	%rax, %rbp
	addq	$2, %rbp
	imulq	$40, %rbp, %rbp
	addq	%r14, %rbp
	movq	%rbp, %xmm5
	punpcklqdq	%xmm5, %xmm0
	testq	%r12, %r12
	je	.L187
.L205:
	movq	%r15, %rsi
	movq	%r12, %rdi
	movaps	%xmm0, (%rsp)
	subq	%r12, %rsi
	call	_ZdlPvm@PLT
	movdqa	(%rsp), %xmm0
.L187:
	imulq	$40, %rbx, %rbx
	movaps	%xmm0, 32(%rsp)
	leaq	(%r14,%rbx), %r15
	movq	%r15, 48(%rsp)
	jmp	.L171
.L243:
	movdqu	24(%rax), %xmm6
	movups	%xmm6, 24(%rcx)
	jmp	.L167
.L247:
	movdqu	24(%rax), %xmm7
	movups	%xmm7, 24(%rcx)
	jmp	.L185
.L207:
	movq	%rdx, %rbx
.L157:
	imulq	$40, %rbx, %rdi
	call	_Znwm@PLT
	movq	%rax, %r13
	jmp	.L158
.L210:
	movq	%rdx, %rbx
.L175:
	imulq	$40, %rbx, %rdi
	call	_Znwm@PLT
	movq	%rax, %r14
	jmp	.L176
.L209:
	movq	%r13, %rbp
	jmp	.L159
.L177:
	leaq	40(%r14), %rbp
	movq	%r14, %xmm0
	movq	%rbp, %xmm7
	punpcklqdq	%xmm7, %xmm0
	jmp	.L205
.L245:
	movabsq	$230584300921369395, %rax
	cmpq	%rax, %rbx
	cmova	%rax, %rbx
	jmp	.L175
.L241:
	movabsq	$230584300921369395, %rax
	cmpq	%rax, %rbx
	cmova	%rax, %rbx
	jmp	.L157
.L240:
	leaq	.LC1(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L238:
	call	_ZSt16__throw_bad_castv@PLT
.L244:
	leaq	.LC1(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE10:
.L239:
	call	__stack_chk_fail@PLT
.L212:
	endbr64
	movq	%rax, %rbp
	jmp	.L203
	.section	.gcc_except_table,"a",@progbits
.LLSDA3057:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3057-.LLSDACSB3057
.LLSDACSB3057:
	.uleb128 .LEHB10-.LFB3057
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L212-.LFB3057
	.uleb128 0
.LLSDACSE3057:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC3057
	.type	main.cold, @function
main.cold:
.LFSB3057:
.L203:
	.cfi_def_cfa_offset 176
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movq	32(%rsp), %rdi
	movq	48(%rsp), %rsi
	subq	%rdi, %rsi
	testq	%rdi, %rdi
	je	.L204
	call	_ZdlPvm@PLT
.L204:
	movq	%rbp, %rdi
.LEHB11:
	call	_Unwind_Resume@PLT
.LEHE11:
	.cfi_endproc
.LFE3057:
	.section	.gcc_except_table
.LLSDAC3057:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC3057-.LLSDACSBC3057
.LLSDACSBC3057:
	.uleb128 .LEHB11-.LCOLDB7
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
.LLSDACSEC3057:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB3709:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%rbp, %rsi
	popq	%rbp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE3709:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	2061584302
	.long	1076407828
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
