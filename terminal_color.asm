; ==============================================================================
; Archivo:     terminal_color.asm
; Propósito:   pinta la terminal de un color
; Entorno:     DOS 16-bit (Ensamblador: MASM/TASM)
; Autor:       Juan Pablo Strelli (StrelliPablo)
; Fecha:       2 de enero 2012
; Notas:       el programa cambia el color de la terminal a un color especificado por el usuario.
; ==============================================================================
.model small
.stack 256
.data
pantalla db ?
letra db ?
caracter db ?
sw db 0
diez db 10
.code
mov ax,@data
mov ds,ax
mov ah,0
mov al,3
int 10h
mov cl,es:[80h]
xor si,si
volver:
mov al,es:[81h+si]
cmp al,' '
je seguir
cmp sw,0
je mover_pantalla
cmp sw,1
je mover_letra
mov caracter,al
seguir:
inc si
loop volver
sub pantalla,30h
sub letra,30h
;call pintar
mov al,10
mov bl,pantalla
mul bl
add al,letra
mov pantalla,al
;mov dl,pantalla
;mov ah,2
;int 21h
call pintar
call arriba
mov ah,1
int 21h
mov ah,4ch
int 21h
mover_pantalla:
mov pantalla,al
mov sw,1
jmp seguir

mover_letra:
mov letra,al
mov sw,2
jmp seguir
pintar proc near
mov ah,06h
mov al,0
mov bh,pantalla
mov cl,0
mov ch,0
mov dh,24
mov dl,79
int 10h
ret
pintar endp
arriba proc near
mov ah,02h
mov bh,0
mov dh,5
mov dl,20
int 10h

mov ah,09
mov al,caracter
mov bh,0
mov bl,pantalla
mov cx,28
int 10h
ret 
arriba endp
end 