; ==============================================================================
; Archivo:     menu.asm
; Propósito:   menu interactivo en assembler
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       12 de marzo 2012
; Notas:       muestra un menu interactivo en assembler, con la posibilidad de moverse por el menu con las flechas del teclado y seleccionar una opcion.
; ==============================================================================

.model small
.stack 256
.data 
menu db "              **********************************",10,13
     db "              *       Cadenas                  *",10,13
	 db "              *       Numeros                  *",10,13
	 db "              *       Archivos                 *",10,13
	 db "              *       Salir                    *",10,13
	 db "              **********************************$"
a db 1
b db 1
.code
mov ax,@data
mov ds,ax

mov ah,00h
mov al,03h
int 10h
while:
call cls
call cursor
call cuadrado
mov ah,09
lea dx,menu
int 21h
;enter
;cmp ah,1ch 
		;je enterv
       ;que tecla pulsa
   	    mov ah,10h
        int 16h
       ;fin de codigo
        cmp ah,4fh
        je d3
		;sube 
        cmp ah,48h
        je d2
		;baja 
        cmp ah,50h
        je d1
jmp while
      d1:
        inc b
		inc a
         jmp while
      d2:
         dec b
		 dec a
         jmp while
d3:
mov ah,4ch
int 21h
cursor proc near
	mov ah,02h
    mov bh,00h
    mov dh,0
    mov dl,0
    int 10h
cursor endp
cuadrado proc near
    mov ah,06h
	mov bh,5fh
	mov ch,a
	mov cl,22
	mov dh,b
	mov dl,35
	int 10h
	ret
cuadrado endp
cls proc near
    mov ah,06h
	mov al,0
    mov bh,0F2h
    mov cl,00
	mov ch,00
    mov dl,79
	mov dh,24
    int 10h
    ret
cls endp
end 