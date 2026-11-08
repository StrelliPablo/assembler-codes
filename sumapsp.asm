; ==============================================================================
; Archivo:     sumapsp.asm
; Propósito:   suma de dos números con psp con 30h
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       12 de marzo 2012
; Notas:       suma con Program Segment Prefix (PSP) con 30h, el programa suma dos números introducidos por teclado y muestra el resultado en pantalla.
; ==============================================================================

.model small
.stack 256
.data
res db 5 dup("$")
.code
mov ax,@data
mov ds,ax

xor cx,cx
xor ax,ax

mov cl,es:[80h]

xor si,si
xor bx,bx
volver: 
mov al,es:[81h+si]
cmp al,' '
je seguir
add bl,al
seguir:
inc si
loop volver
sub bl,30h
mov res,bl
mov ah,2
mov dl,res
int 21h

mov ah,4ch
int 21h

end