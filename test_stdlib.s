;; AMD64 NASM Assembly example
;; calling standard library functions

;; compile with: 
;; nasm -f macho64 test_stdlib.s 
;; gcc -m64 -gdb /usr/lib/libSystem.dylib  test_stdlib.o -o test

BITS 64
CPU X64

section .data

	test_printf: db "The answer is %d.", 0xa, 0

section .text

	extern _printf
	global _main

_main:
	;; set up a stack frame
	push rbp
	mov rbp, rsp
	
	;; load the parameters and call printf
	lea rdi, [rel test_printf]  ;; uses relative addressing
	mov rsi, 42
	call _printf

	;; clean up the stack frame
	mov rsp, rbp
	pop rbp

	;; return
	ret
