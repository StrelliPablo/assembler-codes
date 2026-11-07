; ==============================================================================
; Archivo:     suma.asm
; Propósito:   Suma dos números de un solo dígito introducidos por teclado
;              y muestra el resultado en pantalla.
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       18 de noviembre 2013
; Notas:       Uso de interrupciones INT 21h para E/S y ajuste BCD (AAA).
; ==============================================================================

.model small
.stack 256
.data
 enter db 10,13,"$"
 msg db "numeros a sumar",10,13,"$"
.code
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov ah,1
int 21h
sub al,30h
mov bl,al

int 21h
sub al,30h
mov cl,al

mov ah,09h
lea dx,enter
int 21h

mov ah,1
int 21h
add bl,al
int 21h
add cl,al

mov ah,09
lea dx,enter
int 21h

mov ax,cx
aaa
mov cx,ax
add bl,ch
mov ax,bx
aaa
mov bx,ax
mov dl,bh
add dl,30h
mov ah,02
int 21h
mov dl,bl
add dl,30h
mov ah,02
int 21h

mov dl,cl
add dl,30h
mov ah,02
int 21h

mov ah,4ch
int 21h
end