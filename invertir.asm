; ==============================================================================
; Archivo:     invertir.asm
; Propósito:   invierte una cadena
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       12 de enero 2012
; Notas:       invierte una cadena 
; ==============================================================================
.model small
.stack 256
.data
eti label byte
	max   db 10
	count db ?
	cadena db 10 dup (' '),'$'
 
	cad2 db 10 dup (' '),'$' 
	enter db 10,13,"$"
.code
mov ax,@data
mov ds,ax

	mov ah,0ah
	lea dx,eti
	int 21h
	
	mov cx,10 ;cuantas repeticiones
	lea di,cad2+9 ;cadena destino
	lea si,cadena ;cadena fuente
	repite:
		lodsb ;pone en al un caracter
		mov [di],al ;lo pasa a cad2
		dec di ;resto 1 a cad2
	loop repite
    mov ah,09h
    lea dx,enter
    int 21h
	
	mov ah,09h
	lea dx,cad2
	int 21h
mov ah,4ch
int 21h
end	