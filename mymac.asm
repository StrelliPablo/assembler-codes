; ==============================================================================
; Archivo:     mymac.asm
; Propósito:   Macro de procedimientos.
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       18 de noviembre 2013
; Notas:       Programa de objetivo que contiene macros de procedimientos para E/S y gráficos.
; ==============================================================================


leer_cad macro cadena
    push dx
    push ax
    lea dx,cadena
    mov ah,0ah
    int 21h
    pop ax
    pop dx
endm
;imprime una cadena
imprimir_cad macro cadena
    push dx
    push ax
    lea dx,cadena
    mov ah,09h
    int 21h
    pop ax
    pop dx
endm   
;leer un caracter
leer_caracter macro dato
    push ax
    mov ah,01h
    int 21h
    mov dato,al
    pop ax
endm
;imprimir un cararter un caracter
imprimir_caracter macro dato
    push ax
    push dx
    mov ah,02h
    mov dl,dato
    int 21h
    pop dx
    pop ax
endm
sal_reg macro
    push ax
    push bx
	push cx
	push dx
	push si
	push di
endm
res_reg macro
    pop di
    pop si
    pop dx
    pop cx
	pop bx
	pop ax
endm

;baribo de la pantalla (bh cx dx)
;bh el color,punto cx inicio,punto dx fin  
barrido macro color x y
    push ax
    push bx
    push cx
    push dx
    mov ah,06h
    mov al,00h
    mov bh,color
    mov cx,x
    mov dx,y
    int 10h
    pop dx
    pop cx
    pop bx
    pop ax
endm 
;posicionamiento del cursor
;dx fila ,columna
cursor macro pos
    push ax
    push bx
    push dx
    mov ah,02h
    mov bh,00h
    mov dx,pos
    int 10h
    pop dx
    pop bx
    pop ax
endm

linea1 macro x,y,n,c
	push ax
    push bx
	push cx
    push dx
	push si
	mov ah,0ch
	mov bh,00h
	mov cx,x
	mov dx,y
	mov al,c;el color del pixel
    xor si,si
	forl1:
	cmp si,n
	je salirl1

	int 10h	
	inc cx
	inc si

	jmp forl1
	salirl1:
	pop si
	pop dx
	pop cx
    pop bx
    pop ax
endm

linea2 macro x,y,n,c
	push ax
    push bx
	push cx
    push dx
	push si
	mov ah,0ch
	mov bh,00h
	mov cx,x
	mov dx,y
	mov al,c;el color del pixel
    xor si,si
	forl2:
	cmp si,n
	je salirl2
	
	int 10h
	inc cx
	inc si

	jmp forl2
	salirl2:
	pop si
	pop dx
	pop cx
    pop bx
    pop ax
endm

linea3 macro x,y,n,c
	push ax
    push bx
	push cx
    push dx
	push si
	mov ah,0ch
	mov bh,00h
	mov cx,x
	mov dx,y
	mov al,c;el color del pixel
    xor si,si
	forl3:
	cmp si,n
	je salirl3
	
	int 10h
	inc dx
	inc si

	jmp forl3
	salirl3:
	pop si
	pop dx
	pop cx
    pop bx
    pop ax
endm
