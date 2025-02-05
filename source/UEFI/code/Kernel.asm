org 1006Eh

format ELF
use32

public _VIDEO__Prepare
public _VIDEO__Fill_Screen
public _VIDEO__PrintString

section '.text' executable
extrn _start
mov esp, stack_space
call _start
jmp $

	;_INTERFACE__Keyboard:
		
	;ret

	_VIDEO__PrintString:
		push ebp
		mov ebp, esp
		mov esi, [ebp+8]

		xor ebx, ebx
		mov ah, 07h
		puts:
			mov al, [esi+ebx]
			mov [gs:(ebx*2)], ax
			inc ebx
			test al, al
			jnz puts
		nop
		;leave
		mov esp, ebp
		pop ebp
	ret

	_VIDEO__Prepare:
		; Разблокировать регистры VGA
	    mov dx, 0x3C2
	    mov al, 0x63
	    out dx, al

	    ; Настроить регистры Sequencer
	    mov dx, 0x3C4
	    mov al, 0x04
	    out dx, al
	    inc dx
	    mov al, 0x06
	    out dx, al

	    ; Настроить регистры Graphics Controller
	    mov dx, 0x3CE
	    mov al, 0x05
	    out dx, al
	    inc dx
	    mov al, 0x40
	    out dx, al

	    ; Настроить регистры CRT Controller
	    mov dx, 0x3D4
	    mov al, 0x11
	    out dx, al
	    inc dx
	    mov al, 0x0E
	    out dx, al

	    ; Настроить регистры Attribute Controller
	    mov dx, 0x3C0
	    mov al, 0x10
	    out dx, al
	    inc dx
	    mov al, 0x41
	    out dx, al

	    ; Активировать режим 13h
	    mov dx, 0x3C0
	    mov al, 0x13
	    out dx, al
	ret

	_VIDEO__Set_Pixel:
	;Вычисляем адрес для пикселя
	;Адрес = y * ширина_экрана + x
	;в режиме 13h ширина экрана = 320
		push eax               ; сохраняем AX в стек
		mov eax, edx
		imul eax, 320          ; умножаем Y на ширину экрана
		add eax, ebx           ; добавляем X
		mov edi, eax           ; сохраняем адрес в DI
		pop eax                ; возвращаем AX из стека

		mov [gs:edi], al       ; устанавливаем пиксель
	ret

	_VIDEO__Fill_Screen:
		mov al, 0x0F           ; цвет пикселя
		pushad
		xor ebx, ebx
		.cycle:
		mov edi, ebx           ; сохраняем адрес в DI
	
		mov [gs:edi], al       ; устанавливаем пиксель
		inc ebx
		cmp ebx, 0FA00h
		jz .exit
		jmp .cycle
		.exit:
		popad
	ret

org 15000h
section '.bss'
;rb 8192
stack_space: